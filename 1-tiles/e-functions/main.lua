
function loadMap(tileW, tileH, tilesetPath, tileString, quadInfo)
  
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

  local rowIndex,columnIndex = 1,1
  for row in tileString:gmatch("[^\n]+") do
    assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    columnIndex = 1
    for character in row:gmatch(".") do
      TileTable[columnIndex][rowIndex] = character
      columnIndex = columnIndex + 1
    end
    rowIndex=rowIndex+1
  end

end

function drawMap()
  for columnIndex,column in ipairs(TileTable) do
    for rowIndex,char in ipairs(column) do
      local x,y = (columnIndex-1)*TileW, (rowIndex-1)*TileH
      love.graphics.draw(Tileset, Quads[ char ], x, y)
    end
  end
end

function love.load()

  local tileString = [[
^#######################^
^                    *  ^
^  *                    ^
^              *        ^
^                       ^
^    ##  ^##  ^## ^ ^   ^
^   ^  ^ ^  ^ ^   ^ ^   ^
^   ^  ^ ^ *# ^   ^ ^   ^
^   ^  ^ ^##  ^## # #   ^
^   ^  ^ ^  ^ ^    ^  * ^
^ * ^  ^ ^  ^ ^    ^    ^
^   #  # ^* # ^  * ^    ^
^    ##  ###  ###  #    ^
^                       ^
^   *****************   ^
^                       ^
^  *                  * ^
#########################
]]

  local quadInfo = { 
    { ' ',  0,  0 }, -- grass 
    { '#', 32,  0 }, -- box
    { '^', 32, 32 }, -- boxTop
    { '*',  0, 32 }  -- flowers
  }

  loadMap(32,32,'countryside.png',tileString,quadInfo)
end


function love.draw()
  drawMap()
end
