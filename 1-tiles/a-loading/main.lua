
function love.load()

  -- Tile width and heigth
  tileW, tileH = 32,32
  
  images = {
    tileset = love.graphics.newImage('tileset.png')
  }
  
  local tilesetW, tilesetH = images.tileset:getWidth(), images.tileset:getHeight()
  
  quads = {
    grass = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH),
    box   = love.graphics.newQuad(32, 0, tileW, tileH, tilesetW, tilesetH)
  }

end

function love.draw()
  love.graphics.drawq(images.tileset, quads.grass, 368, 268)
  love.graphics.drawq(images.tileset, quads.grass, 400, 268)
  love.graphics.drawq(images.tileset, quads.grass, 432, 268)
  love.graphics.drawq(images.tileset, quads.grass, 368, 300)
  love.graphics.drawq(images.tileset, quads.box  , 400, 300)
  love.graphics.drawq(images.tileset, quads.grass, 432, 300)
  love.graphics.drawq(images.tileset, quads.grass, 368, 332)
  love.graphics.drawq(images.tileset, quads.grass, 400, 332)
  love.graphics.drawq(images.tileset, quads.grass, 432, 332)
end
