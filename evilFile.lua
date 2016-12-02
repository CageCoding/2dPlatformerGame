local EvilAction1 = true
local EvilAction2 = true
local EvilAction3 = true
local EvilAction4 = true
local EvilAction5 = true
local EvilAction6 = true
local EvilAction7 = true

function evilChoices(x,y)

  if 1000<=x and x<=1200 then
    
    --Button 1
    if 50<=y and y<=(50+80) then
      if EvilAction1 == true then      
       print("Button 1")
       eBtn1.R = 255
       eBtn1.G = 255
       eBtn1.B = 255
       EvilAction1 = false
     end
   end
   
   --Button 2
    if 150<=y and y<=(150+80) then
     if EvilAction2 == true then      
       print("Button 2")
       eBtn2.R = 255
       eBtn2.G = 255
       eBtn2.B = 255
       EvilAction2 = false
     end     
   end
   
   --Button 3
    if 250<=y and y<=(250+80) then
     if EvilAction3 == true then      
       print("Button 3")
       eBtn3.R = 255
       eBtn3.G = 255
       eBtn3.B = 255
       EvilAction3 = false
     end
   end
   
   --Button 4
    if 350<=y and y<=(350+80) then
     if EvilAction4 == true then      
       print("Button 1")
       eBtn4.R = 255
       eBtn4.G = 255
       eBtn4.B = 255
       EvilAction4 = false
     end
   end
   
   --Button 5
    if 450<=y and y<=(450+80) then
     if EvilAction5 == true then      
       print("Button 5")
       eBtn5.R = 255
       eBtn5.G = 255
       eBtn5.B = 255
       EvilAction5 = false
     end
   end
   
   --Button 6
    if 550<=y and y<=(550+80) then
     if EvilAction6 == true then      
       print("Button 6")
       eBtn6.R = 255
       eBtn6.G = 255
       eBtn6.B = 255
       EvilAction6 = false
     end
   end
   
   --Button 7
    if 650<=y and y<=(650+80) then
     if EvilAction7 == true then      
       print("Button 7")
       eBtn7.R = 255
       eBtn7.G = 255
       eBtn7.B = 255
       EvilAction7 = false
     end
   end
  end

end

function resetEvilButtons()
  EvilAction1 = true
  EvilAction2 = true
  EvilAction3 = true
  EvilAction4 = true
  EvilAction5 = true
  EvilAction6 = true
  EvilAction7 = true
end
