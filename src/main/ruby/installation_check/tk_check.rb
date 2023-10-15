require 'tk'

root = TkRoot.new do
  title 'V V V - Button Below??? - V V V'
end

button = TkButton.new do
  text "If you can see this button then Tk seems to be working.  Click to exit."
  command { Tk.exit }
  pack('padx' => 8, 'pady' => 8)
end

Tk.mainloop
