
local function newMap(tiles, quadEquivalence)
  local map = {}

  local width = #(tiles:match("[^\n]+"))

  for x = 1,width,1 do
    map[x] = {}
  end

  local x,y = 1,1
  for row in tiles:gmatch("[^\n]+") do
    assert(#row == width, 'Map is not squared: width of row ' .. tostring(y) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    x = 1
    for tile in row:gmatch(".") do
      map[x][y] = tile
      x = x + 1
    end
    y=y+1
  end

  return map
end



function love.load()

  tileW, tileH = 32,32
  
  images = {
    tileset = love.graphics.newImage('tileset.png')
  }
  
  local tilesetW, tilesetH = images.tileset:getWidth(), images.tileset:getHeight()
  
  quads = {
    grass = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH),
    box   = love.graphics.newQuad(32, 0, tileW, tileH, tilesetW, tilesetH)
  }
  
  local tiles = [[
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

  map = newMap(tiles)

end


function love.draw()
  
  local quad
  
  for x,column in ipairs(map) do
    for y,tileValue in ipairs(column) do
      if tileValue == ' ' then
        quad = quads.grass
      else
        quad = quads.box
      end
      love.graphics.drawq(images.tileset, quad, (x-1)*tileW, (y-1)*tileH)
    end
  end
end
