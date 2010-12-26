function loadMap(path)
  love.filesystem.load(path)() -- attention! extra parenthesis
end

function newMap(tileW, tileH, tilesetPath, tileString, quadInfo)
  
  TileW = tileW
  TileH = tileH
  Tileset = love.graphics.newImage(tilesetPath)
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {}
  
  for _,info in ipairs(quadInfo) do
    -- info[1] = the character, info[2] = x, info[3] = y
    Quads[info[1]] = love.graphics.newQuad(info[2], info[3], TileW,  TileH, tilesetW, tilesetH)
  end
  
  TileTable = {}
  
  local width = #(tileString:match("[^\n]+"))

  for x = 1,width,1 do TileTable[x] = {} end

  local x,y = 1,1
  for row in tileString:gmatch("[^\n]+") do
    assert(#row == width, 'Map is not aligned: width of row ' .. tostring(y) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    x = 1
    for tile in row:gmatch(".") do
      TileTable[x][y] = tile
      x = x + 1
    end
    y=y+1
  end

end

function drawMap()
  for x,column in ipairs(TileTable) do
    for y,char in ipairs(column) do
      love.graphics.drawq(Tileset, Quads[ char ] , (x-1)*TileW, (y-1)*TileH)
    end
  end
end
