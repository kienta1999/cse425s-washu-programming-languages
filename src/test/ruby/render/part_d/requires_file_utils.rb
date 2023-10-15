require "test/unit"

module RequiresFileUtils
  include Test::Unit::Assertions

  private

  def check_symbol(name_symbol, receiver_name_symbol, file)
    # assert_false Object.const_defined?(:Composite)
    # assert_false Object.const_defined?(class_name_symbol)
    begin
      require_relative "../../../../main/ruby/render/assignment/#{file}"
    rescue NameError => e
      if e.name == name_symbol and e.receiver.name == receiver_name_symbol.to_s
        assert_true(false, "========\n#{e.receiver} cannot find #{e.name}.\n\nEnsure that you have require_relative 'composite' in #{file}.rb\n========\n\n")
      else
        raise e
      end
    end
    assert_true Object.const_defined?(name_symbol)
    assert_true Object.const_defined?(receiver_name_symbol)
  end
end