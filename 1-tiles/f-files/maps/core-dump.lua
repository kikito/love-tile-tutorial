local tileString = [[
#########################
# AAA^AAAAAA      # ^^^ #
# |||@||||||      # @@@ #
#                 #     #
# AAAAAAA^AA      ### ###
# |||||||@||        # # #
#                   * * #
# *                 l l #
# l                     #
          ^             #
          @             #
# *                     #
# l                     #
#                       #
# AAAAA^AAA^AAA^    ^^  #
# |||||@|||@|||@    @@  #
#                       #
#########################
]]

local quadInfo = { 
  { ' ',  0,  0 }, -- gray floor
  { '#',  0, 32 }, -- brick wall
  { '^', 32,  0 }, -- mainframe 1 top
  { '@', 32, 32 }, -- mainframe 1 bottom
  { 'A', 64,  0 }, -- mainframe 2 top
  { '|', 64, 32 }, -- maingrame 2 bottom
  { '*', 96,  0 }, -- plant top
  { 'l', 96, 32 }  -- plant bottom
}

newMap(32,32,'/images/lab.png', tileString, quadInfo)
