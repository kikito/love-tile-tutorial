
local function loadMap(tileW, tileH, tilesetPath, TileString, quadInfo)
  Map = {}
  Map.tileW = tileW
  Map.tileH = tileH
  Map.tileset = love.graphics.newImage(tilesetPath)
  
  local tilesetW, tilesetH = Map.tileset:getWidth(), Map.tileset:getHeight()
  
  Map.quads = {}
  
  for quadName,info in pairs(quadInfo) do
    local quad = love.graphics.newQuad(info.x, info.y, tileW, tileH, tilesetW, tilesetH)
    Map.quads[quadName] = quad
    Map.quads[info.char] = quad
  end
  
  Map.tiles = {}
  
  local width = #(TileString:match("[^\n]+"))

  for x = 1,width,1 do Map.tiles[x] = {} end

  local x,y = 1,1
  for row in TileString:gmatch("[^\n]+") do
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
  local quad
  
  for x,column in ipairs(Map.tiles) do
    for y,tileKey in ipairs(column) do
      love.graphics.drawq(Map.tileset, Map.quads[ tileKey ] , (x-1)*Map.tileW, (y-1)*Map.tileH)
    end
  end
end

function love.load()

  local tileString = [[
#########################
#                       #
#                       #
#                       #
#                       #
#    ##  ###  ### # #   #
#   #  # #  # #   # #   #
#   #  # #  # #   # #   #
#   #  # ###  ### # #   #
#   #  # #  # #    #    #
#   #  # #  # #    #    #
#   #  # #  # #    #    #
#    ##  ###  ###  #    #
#                       #
#   #################   #
#                       #
#                       #
#########################
]]

  local quadInfo = {
    grass = {  x=0, y=0, char=' ' },    -- 'grass' is a tile located at 0,0 in the tileset. It is represented by a space
    box  =  { x=32, y=0, char='#' }     -- box is represented with the # character and is the quad on 32,0 on the tileset
  }

  loadMap( 32,32, 'countryside.png', tileString, quadInfo)
end


function love.draw()
  drawMap()
end
