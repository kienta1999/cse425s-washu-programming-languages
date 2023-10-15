# Kien Ta
# Dennis Cosgrove

require_relative '../assignment/rectangle'
require_relative '../assignment/equilateral_triangle'
require_relative '../core/color'

class Home

end

if __FILE__ == $0
  require_relative '../core/render_app'
  app = RenderApp.new(Home.new)
  app.main_loop
end
