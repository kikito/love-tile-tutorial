function love.load()

  TileW, TileH = 32,32
  
  Tileset = love.graphics.newImage('tileset.png')
  
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {
    grass = love.graphics.newQuad(0,  0, TileW, TileH, tilesetW, tilesetH),
    box   = love.graphics.newQuad(32, 0, TileW, TileH, tilesetW, tilesetH)
  }
  
  local str = [[
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

  map = {}
  
  local width = #(str:match("[^\n]+"))
  
  for x = 1,width,1 do map[x] = {} end

  local x,y = 1,1
  for row in str:gmatch("[^\n]+") do
    x = 1
    for tile in row:gmatch(".") do
      map[x][y] = tile
      x = x + 1
    end
    y=y+1
  end
end


function love.draw()
  local quad
  
  for x,column in ipairs(map) do
    for y,tileValue in ipairs(column) do
      if tileValue == ' ' then
        quad = Quads.grass
      else
        quad = Quads.box
      end
      love.graphics.drawq(Tileset, quad, (x-1)*TileW, (y-1)*TileH)
    end
  end

end
