require 'map-functions'

function love.load()
  loadMap('maps/chez-peter.lua')
end

function love.draw()
  drawMap()
end
