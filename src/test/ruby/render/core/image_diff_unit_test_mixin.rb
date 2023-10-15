require_relative '../../../../core/ruby/download/download_utils'
require_relative 'snapshot_generator'
require_relative 'image_diff'

class ImageDiffUnitTestSetup
  def self.setup_pictures_and_exceptions(info, is_complete: true)
    snapshot_generator = SnapshotGenerator.new()

    pictures = {}
    exceptions = {}
    info.eval_text_image_sub_path_pairs(is_complete: is_complete).each do |pair|
      begin
        instance = eval(pair.eval_text)
        png = snapshot_generator.generate_png(instance)
      rescue StandardError => exception
        exceptions[pair.image_sub_path] = exception
        png = nil
      end
      pictures[pair.image_sub_path] = png
    end

    snapshot_generator.teardown

    [pictures, exceptions]
  end
end

module ImageDiffUnitTestMixin
  def expected_url_prefix
    "https://www.cse.wustl.edu/~cosgroved/courses/cse425s/spring22/ruby/render/#{expected_sub_path}"
  end

  def picture_diff(eval_text, image_sub_path)
    exception_from_setup = setup_exception_hash[image_sub_path]
    if exception_from_setup.nil?
      actual = setup_picture_hash[image_sub_path]
      expected = png_from_uri("#{expected_url_prefix}/expected_#{image_sub_path}.png")
      assert_equal(expected.width, actual.width)
      assert_equal(expected.height, actual.height)
      diff = ImageDiff.diff_pixel_count_allow_neighbors(expected, actual)
      assert_equal(0, diff)
    else
      raise exception_from_setup
    end
  end

  def png_from_uri(uri)
    download = DownloadUtils.download(uri)
    blob = download.read
    ChunkyPNG::Image.from_blob(blob)
  end
end
