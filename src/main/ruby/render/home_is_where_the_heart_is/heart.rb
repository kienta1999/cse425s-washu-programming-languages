# Kien Ta
# Dennis Cosgrove

require_relative '../assignment/rectangle'
require_relative '../assignment/ellipse'
require_relative '../core/color'

class Heart
  
end

if __FILE__ == $0
  require_relative '../core/render_app'
  app = RenderApp.new(Heart.new)
  app.main_loop
end
