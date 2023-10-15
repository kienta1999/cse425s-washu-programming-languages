# Kien Ta
# Dennis Cosgrove

class TextFileWriter
  def self.open_yield_close(path)
    
    raise :not_yet_implemented
  end
end

if __FILE__ == $0
  require 'fileutils'
  directory_path = File.join(Dir.home, 'Downloads', 'CSE425s')
  FileUtils.mkdir_p directory_path
  path = File.join(directory_path, 'TextFileWriter.html')
  if File.exist?(path)
    File.delete(path)
  end
  TextFileWriter.open_yield_close(path) do |file|
    # nil.not_a_method
    file.write("<html><body><h1>#{Time.now}</h1></body></html>")
  end

  require 'opener'
  Opener.spawn(path)
end
