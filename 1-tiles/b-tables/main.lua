

function love.load()

  TileW, TileH = 32,32
  
  Tileset = love.graphics.newImage('countryside.png')
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {}
  Quads[0] = love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH)  -- 0 = grass
  Quads[1] = love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH)  -- 1 = box
  Quads[2] = love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH)  -- 2 = boxtop
  Quads[3] = love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH)  -- 3 = flowers
  
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
      love.graphics.drawq(Tileset, Quads[number], (x-1)*TileW, (y-1)*TileH)
    end
  end
end
