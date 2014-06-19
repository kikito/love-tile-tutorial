
function love.load()
  
  tileset = love.graphics.newImage('countryside.png')
  
  local tileW, tileH = 32,32
  local tilesetW, tilesetH = tileset:getWidth(), tileset:getHeight()
  
  grassQuad = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH)
  boxQuad = love.graphics.newQuad(32, 0, tileW, tileH, tilesetW, tilesetH)

end

function love.draw()
  love.graphics.draw(tileset, grassQuad, 368, 268)
  love.graphics.draw(tileset, grassQuad, 400, 268)
  love.graphics.draw(tileset, grassQuad, 432, 268)
  love.graphics.draw(tileset, grassQuad, 368, 300)
  love.graphics.draw(tileset, boxQuad  , 400, 300)
  love.graphics.draw(tileset, grassQuad, 432, 300)
  love.graphics.draw(tileset, grassQuad, 368, 332)
  love.graphics.draw(tileset, grassQuad, 400, 332)
  love.graphics.draw(tileset, grassQuad, 432, 332)
end
