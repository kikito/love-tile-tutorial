

function love.load()

  TileW, TileH = 32,32
  
  Tileset = love.graphics.newImage('countryside.png')
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {
    grass   = love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH),
    box     = love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH),
    boxTop  = love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH),
    flowers = love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH),
  }
  
  TileTable = {
  
     { 2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2 },
     { 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,2 },
     { 2,0,3,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,2 },
     { 2,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,2 },
     { 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2 },
     { 2,0,0,2,0,0,0,0,0,1,1,0,0,2,0,0,0,2,0,2,1,1,0,0,2 },
     { 2,0,0,2,0,0,0,0,2,3,3,2,0,1,0,0,0,1,0,2,0,0,0,0,2 },
     { 2,0,0,2,0,0,0,0,2,3,3,2,0,0,2,0,2,0,0,2,1,1,0,0,2 },
     { 2,0,0,2,0,0,0,0,2,3,3,2,0,0,1,0,1,0,0,2,0,0,0,0,2 },           
     { 2,0,0,2,0,0,0,0,1,3,3,1,0,0,0,2,0,0,0,2,0,0,0,0,2 },
     { 2,0,0,1,1,1,1,0,0,1,1,0,0,0,0,1,0,3,0,1,1,1,0,0,2 },
     { 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2 },
     { 2,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,2,0,0,0,0,0,0,0,2 },
     { 2,0,0,0,0,0,0,0,2,3,2,0,0,0,0,0,1,0,0,0,0,0,0,0,2 },
     { 2,0,0,3,0,0,0,0,1,3,1,0,0,0,0,1,0,0,0,0,0,0,0,0,2 },
     { 2,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,0,0,0,0,0,0,3,0,2 },
     { 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2 },
     { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }
  }

end

function love.draw()

  local quad

  for y,row in ipairs(TileTable) do
    for x,number in ipairs(row) do
      if number == 1 then
        quad = Quads.box
      elseif number == 2 then
        quad = Quads.boxTop
      elseif number == 3 then
        quad = Quads.flowers
      else
        quad = Quads.grass
      end
      
      love.graphics.drawq(Tileset, quad, (x-1)*TileW, (y-1)*TileH)

    end
  end
end
