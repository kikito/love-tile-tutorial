require 'map-functions'

function love.load()
  love.filesystem.load('maps/chez-peter.lua')() -- attention! extra parenthesis
end

function love.draw()
  drawMap()
end
