
local tileString = [[
#########################
#                #      #
# <========>     #      #
# <========>     #      #
# <========>     #      #
# <========>     ###  ###
# <========>            #
#                       #
# <===================> #
# <===================> #
#                       #
#                ###  ###
#                #      #
#                #      #
#                #      #
#                #      #
#                #      #
#########################
]]

local quadInfo = { 
  { ' ',  0,  0 }, -- floor
  { '#', 32,  0 }, -- bricks
  { '<',  0, 32 }, -- carpet left
  { '=', 32, 32 }, -- carpet middle
  { '>', 64, 32 }  -- carpet right
}

local entityInfo = {
  { 'rchair', 96, 0  },
  { 'lchair', 96, 32 }
}

local entities = {
  {'rchair',  6, 4},
  {'rchair',  6, 5},
  {'lchair',  9, 4},
  {'lchair',  9, 5},
  {'rchair', 20, 3},
  {'rchair', 20, 4},
  {'lchair', 23, 3},
  {'lchair', 23, 4}
  
}

newMap(32,32,'/images/resto.png', tileString, quadInfo, entityInfo, entities)
