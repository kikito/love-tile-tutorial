function loadMap(tileW, tileH, tilesetPath, tileString, quadInfo)
  Map = {}
  
  Map.tileW = tileW
  Map.tileH = tileH
  Map.tileset = love.graphics.newImage(tilesetPath)
  
  local tilesetW, tilesetH = Map.tileset:getWidth(), Map.tileset:getHeight()
  
  Map.quads = {}
  
  for _,info in ipairs(quadInfo) do
    -- info[1] = the character, info[2] = x, info[3] = y
    Map.quads[info[1]] = love.graphics.newQuad(info[2], info[3], Map.tileW,  Map.tileH, tilesetW, tilesetH)
  end
  
  Map.tiles = {}
  
  local width = #(tileString:match("[^\n]+"))

  for x = 1,width,1 do Map.tiles[x] = {} end

  local x,y = 1,1
  for row in tileString:gmatch("[^\n]+") do
    assert(#row == width, 'Map is not squared: width of row ' .. tostring(y) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    x = 1
    for tile in row:gmatch(".") do
      Map.tiles[x][y] = tile
      x = x + 1
    end
    y=y+1
  end

end

function drawMap()
  for x,column in ipairs(Map.tiles) do
    for y,char in ipairs(column) do
      love.graphics.drawq(Map.tileset, Map.quads[ char ] , (x-1)*Map.tileW, (y-1)*Map.tileH)
    end
  end
end
