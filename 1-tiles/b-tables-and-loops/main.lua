

function love.load()

  tileW, tileH = 32,32
  
  tileSet = love.graphics.newImage('countryside.png')
  
  local tilesetW, tilesetH = tileSet:getWidth(), tileSet:getHeight()
  
  quads = {
    love.graphics.newQuad(0,   0, tileW, tileH, tilesetW, tilesetH), -- 1 = grass
    love.graphics.newQuad(32,  0, tileW, tileH, tilesetW, tilesetH), -- 2 = box
    love.graphics.newQuad(0,  32, tileW, tileH, tilesetW, tilesetH), -- 3 = flowers
    love.graphics.newQuad(32, 32, tileW, tileH, tilesetW, tilesetH)  -- 4 = boxtop
  }
  
  tileTable = {
  
     { 4,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4 },
     { 4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,4 },
     { 4,1,3,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,4 },
     { 4,1,1,1,1,1,1,1,2,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,4 },
     { 4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4 },
     { 4,1,1,4,1,1,1,1,1,2,2,1,1,4,1,1,1,4,1,4,2,2,1,1,4 },
     { 4,1,1,4,1,1,1,1,4,3,3,4,1,2,1,1,1,2,1,4,1,1,1,1,4 },
     { 4,1,1,4,1,1,1,1,4,3,3,4,1,1,4,1,4,1,1,4,2,2,1,1,4 },
     { 4,1,1,4,1,1,1,1,4,3,3,4,1,1,2,1,2,1,1,4,1,1,1,1,4 },           
     { 4,1,1,4,1,1,1,1,2,3,3,2,1,1,1,4,1,1,1,4,1,1,1,1,4 },
     { 4,1,1,2,2,2,2,1,1,2,2,1,1,1,1,2,1,3,1,2,2,2,1,1,4 },
     { 4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4 },
     { 4,1,1,1,1,1,1,1,1,2,1,1,1,1,2,2,4,1,1,1,1,1,1,1,4 },
     { 4,1,1,1,1,1,1,1,4,3,4,1,1,1,1,1,2,1,1,1,1,1,1,1,4 },
     { 4,1,1,3,1,1,1,1,2,3,2,1,1,1,1,2,1,1,1,1,1,1,1,1,4 },
     { 4,1,1,1,1,1,1,1,1,2,1,1,2,1,2,1,1,1,1,1,1,1,3,1,4 },
     { 4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4 },
     { 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 }
  }

end

function love.draw()
  for rowIndex=1, #tileTable do
    local row = tileTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x = (columnIndex-1)*tileW
      local y = (rowIndex-1)*tileH
      love.graphics.draw(tileSet, quads[number], x, y)
    end
  end
end
