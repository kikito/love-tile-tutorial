
function love.load()
  
  Tileset = love.graphics.newImage('countryside.png')
  
  local tileW, tileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  GrassQuad = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH)
  BoxQuad = love.graphics.newQuad(32, 0, tileW, tileH, tilesetW, tilesetH)

end

function love.draw()
  love.graphics.draw(Tileset, GrassQuad, 368, 268)
  love.graphics.draw(Tileset, GrassQuad, 400, 268)
  love.graphics.draw(Tileset, GrassQuad, 432, 268)
  love.graphics.draw(Tileset, GrassQuad, 368, 300)
  love.graphics.draw(Tileset, BoxQuad  , 400, 300)
  love.graphics.draw(Tileset, GrassQuad, 432, 300)
  love.graphics.draw(Tileset, GrassQuad, 368, 332)
  love.graphics.draw(Tileset, GrassQuad, 400, 332)
  love.graphics.draw(Tileset, GrassQuad, 432, 332)
end
