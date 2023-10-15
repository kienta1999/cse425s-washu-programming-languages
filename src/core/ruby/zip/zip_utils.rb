require 'zip'

class ZipUtils
  def self.unzip(zip_file_path, dst_directory)
    # puts "unzipping: #{zip_file_path}"
    Zip::ZipFile.open(zip_file_path) do |zip_file|
      zip_file.each do |item|
        item_path = File.join(dst_directory, item.name)
        FileUtils.mkdir_p(File.dirname(item_path))
        zip_file.extract(item, item_path) unless File.exist?(item_path)
      end
    end
  end
end