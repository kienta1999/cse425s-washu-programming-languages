module Verbosity
  def verbose_puts
    puts "#{self.class.name}[#{to_s}]"
  end

  def mega_verbose_puts(invoking_method="?", file="?", line="?")
    puts "+----verbose_puts----\n| instance details:\n|\tclass: #{self.class.name}\n|\t to_s: #{to_s}\n|\n| invocation details:\n|   method: #{invoking_method}\n|     file: #{file}\n|     line: #{line}\n+--------------------"
  end
end
