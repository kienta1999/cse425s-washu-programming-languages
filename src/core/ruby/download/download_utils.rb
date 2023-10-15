require 'open-uri'
require 'fileutils'
require 'os'

class DownloadUtils
  def self.download(uri)
    if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.7.0')
      open(uri, {ssl_verify_mode: 0}) #OpenSSL::SSL::VERIFY_NONE
    else
      URI.open(uri, {ssl_verify_mode: 0})
    end
  end

  def self.download_to_file(uri, file_path)
    puts "\n*****************\ndownloading from: #{uri}\n              to: #{file_path}\n*****************\n"
    IO.copy_stream(download(uri), file_path)
  end

  def self.downloads_directory
    root_dir = Dir.home
    if OS.windows?
      unless root_dir.ascii_only?
        root_dir = 'c:/'
      end
    end
    File.join(root_dir, 'Downloads', 'CSE425s')
  end

  def self.download_if_necessary(uri)
    directory_path = downloads_directory
    FileUtils.mkdir_p directory_path
    file_path = File.join(directory_path, File.basename(uri))
    unless File.exist?(file_path)
      download_to_file(uri, file_path)
    end
    raise file_path unless File.exist?(file_path)
    file_path
  end
end