path = File.join(File.dirname(__FILE__), '../../../../main/ruby/render/assignment/')
raise StandardError unless File.directory?(path)
Dir.entries(path).each do |file|
  if File.extname(file) == '.rb'
    unless File.basename(file) == 'composite.rb'
      full_path = File.join(path, File.basename(file))
      require_relative full_path
    end
  end
end
