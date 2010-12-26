
local tileString = [[
#########################
#                #      #
#  L[]R   L[]R   # L[]R #
#  L()R   L()R   # L()R #
#                #      #
#                ###  ###
#  L[]R   L[]R          #
#  L()R   L()R    L[]R  #
#                 L()R  #
#                       #
#  L[]R   L[]R          #
#  L()R   L()R   ###  ###
#                #LL  RR#
#                #LL  RR#
#  L[]R   L[]R   #LL  RR#
#  L()R   L()R   #LL  RR#
#                #LL  RR#
#########################
]]

local quadInfo = { 
  { ' ',  0,  0 }, -- floor 
  { '[', 32,  0 }, -- table top left
  { ']', 64,  0 }, -- table top right
  { '(', 32, 32 }, -- table bottom left
  { ')', 64, 32 }, -- table bottom right
  { 'L',  0, 32 }, -- chair on the left
  { 'R', 96, 32 }, -- chair on the right
  { '#', 96,  0 }  -- bricks
}

newMap(32,32,'/images/resto.png', tileString, quadInfo)
