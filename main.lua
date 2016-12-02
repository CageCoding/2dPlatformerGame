require "collisions"
require "evilFile"
require "playerAction"
require "playerInfo"

function love.load()
local MapTest = require("maps")

NewMap =  map1()
mWidth = gMapWidth()
mHeight = gMapHeight()

--[[
print (mWidth)
print (mHeight)

for i=1, 25 do
  for j=1, 20 do
    print (NewMap[j][i])
  end
end
--]]


evilInfo()
loadPlayer()

end

function evilInfo()
  --Enemy Buttons
  eBtn1 = {}

  eBtn1.R = 0
  eBtn1.G = 0
  eBtn1.B = 125


  eBtn2 = {}

  eBtn2.R = 0
  eBtn2.G = 125
  eBtn2.B = 0


  eBtn3 = {}

  eBtn3.R = 0
  eBtn3.G = 125
  eBtn3.B = 125


  eBtn4 = {}

  eBtn4.R = 125
  eBtn4.G = 0
  eBtn4.B = 0


  eBtn5 = {}

  eBtn5.R = 125
  eBtn5.G = 0
  eBtn5.B = 125


  eBtn6 = {}

  eBtn6.R = 125
  eBtn6.G = 125
  eBtn6.B = 0


  eBtn7 = {}

  eBtn7.R = 125
  eBtn7.G = 125
  eBtn7.B = 125
end

function evilButtons()
   --Evil Button 1
  love.graphics.setColor(eBtn1.R, eBtn1.G, eBtn1.B)
  love.graphics.rectangle("fill", 1000, 50, 200, 80)

   --Evil Button 2
  love.graphics.setColor(eBtn2.R, eBtn2.G, eBtn2.B)
  love.graphics.rectangle("fill", 1000, 150, 200, 80)

   --Evil Button 3
  love.graphics.setColor(eBtn3.R, eBtn3.G, eBtn3.B)
  love.graphics.rectangle("fill", 1000, 250, 200, 80)

   --Evil Button 4
  love.graphics.setColor(eBtn4.R, eBtn4.G, eBtn4.B)
  love.graphics.rectangle("fill", 1000, 350, 200, 80)

   --Evil Button 5
  love.graphics.setColor(eBtn5.R, eBtn5.G, eBtn5.B)
  love.graphics.rectangle("fill", 1000, 450, 200, 80)

     --Evil Button 6
  love.graphics.setColor(eBtn6.R, eBtn6.G, eBtn6.B)
  love.graphics.rectangle("fill", 1000, 550, 200, 80)

     --Evil Button 7
  love.graphics.setColor(eBtn7.R, eBtn7.G, eBtn7.B)
  love.graphics.rectangle("fill", 1000, 650, 200, 80)
end

function makeMap()
  for i=1, 25 do
    for j=1, 20 do
      
      if NewMap[j][i] == 0 then
        --Free Space Squares
        love.graphics.setColor(200, 200, 255)
        love.graphics.rectangle("fill", i*40 - 40, j*38 - 38, 40, 38)
      end
      if NewMap[j][i] == 1 then
        --Walkable Squares
        love.graphics.setColor(0, 100, 0)
        love.graphics.rectangle("fill", i*40 - 40, j*38 - 38, 40, 38)
      end
      if NewMap[j][i] == 2 then
        --Dead Space
        love.graphics.setColor(255, 0, 0)
        love.graphics.rectangle("fill", i*40 - 40, j*38 - 38, 40, 38)
      end
      if NewMap[j][i] == 3 then
        --Player Start
        love.graphics.setColor(255, 0, 255)
        love.graphics.rectangle("fill", i*40 - 40, j*38 - 38, 40, 38)
      end
      if NewMap[j][i] == 4 then
        --Player End
        love.graphics.setColor(255, 255, 0)
        love.graphics.rectangle("fill", i*40 - 40, j*38 - 38, 40, 38)
      end
      if NewMap[j][i] == 5 then
        --Evil Choice
        love.graphics.setColor(255, 150, 150)
        love.graphics.rectangle("fill", i*40 - 40, j*38 - 38, 40, 38)
      end
      
    end
  end
end


function love.update(dt)

  whereIsPlayer1()
  playerActions(dt)
  
  

end

function love.draw()

  --Background Color
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 0, 0, 1000, 768)

  makeMap()
  evilButtons()
  
  love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32) --Spawn Player

end

function love.mousepressed(x, y, button)
  
  evilChoices(x,y)
  
end