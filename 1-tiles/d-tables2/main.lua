function love.load()

  TileW, TileH = 32,32
  
  Tileset = love.graphics.newImage('countryside.png')
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  local quadInfo = {
    grass   = {  0,  0, ' ' }, -- info1
    box     = { 32,  0, '#' }, -- info2
    boxTop  = { 32, 32, '^' }, -- etc
    flowers = {  0, 32, '*' }
  }
  
  Quads = {}
  
  for quadName,info in pairs(quadInfo) do
    local quad = love.graphics.newQuad(info[1], info[2], TileW, TileH, tilesetW, tilesetH)
    Quads[quadName] = quad
    Quads[info[3]] = quad
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
