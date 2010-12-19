function love.load()

  TileW, TileH = 32,32
  
  Tileset = love.graphics.newImage('countryside.png')
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  local quadInfo = { 
    { ' ',  0,  0 }, -- grass 
    { '#', 32,  0 }, -- box
    { '^', 32, 32 }, -- boxTop
    { '*',  0, 32 }  -- flowers
  }
  Quads = {}
  for _,info in ipairs(quadInfo) do
    -- info[1] = character, info[2] = x, info[3] = y
    Quads[info[1]] = love.graphics.newQuad(info[2], info[3], TileW, TileH, tilesetW, tilesetH)
  end
  
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

  TileTable = {}
  
  local width = #(tileString:match("[^\n]+"))
  
  for x = 1,width,1 do TileTable[x] = {} end

  local x,y = 1,1
  for row in tileString:gmatch("[^\n]+") do
    x = 1
    for character in row:gmatch(".") do
      TileTable[x][y] = character
      x = x + 1
    end
    y=y+1
  end
end


function love.draw()

  for x,column in ipairs(TileTable) do
    for y,char in ipairs(column) do
      love.graphics.drawq(Tileset, Quads[char], (x-1)*TileW, (y-1)*TileH)
    end
  end

end
