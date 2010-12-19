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
      if char == '#' then
        quad = Quads.box
      elseif char == '^' then
        quad = Quads.boxTop
      elseif char == '*' then
        quad = Quads.flowers
      else
        quad = Quads.grass
      end
      love.graphics.drawq(Tileset, quad, (x-1)*TileW, (y-1)*TileH)
    end
  end

end
