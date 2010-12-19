function love.load()

  TileW, TileH = 32,32
  
  Tileset = love.graphics.newImage('countryside.png')
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {}
  Quads[' '] = love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH) -- ' ' = grass   
  Quads['#'] = love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH) -- '#' = boxes
  Quads['^'] = love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH) -- '^' = boxTop
  Quads['*'] = love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH) -- '*' = flowers
  
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
  local quad
  
  for x,column in ipairs(TileTable) do
    for y,char in ipairs(column) do
      love.graphics.drawq(Tileset, Quads[char], (x-1)*TileW, (y-1)*TileH)
    end
  end

end
