
function love.load()

  local tileW, tileH = 32,32
  
  Tileset = love.graphics.newImage('countryside.png')
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {
    grass = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH),
    box   = love.graphics.newQuad(32, 0, tileW, tileH, tilesetW, tilesetH)
  }

end

function love.draw()
  love.graphics.drawq(Tileset, Quads.grass, 368, 268)
  love.graphics.drawq(Tileset, Quads.grass, 400, 268)
  love.graphics.drawq(Tileset, Quads.grass, 432, 268)
  love.graphics.drawq(Tileset, Quads.grass, 368, 300)
  love.graphics.drawq(Tileset, Quads.box  , 400, 300)
  love.graphics.drawq(Tileset, Quads.grass, 432, 300)
  love.graphics.drawq(Tileset, Quads.grass, 368, 332)
  love.graphics.drawq(Tileset, Quads.grass, 400, 332)
  love.graphics.drawq(Tileset, Quads.grass, 432, 332)
end
