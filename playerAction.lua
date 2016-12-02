function loadPlayer()

  player = {}
  setPlayer1Spawn()
  player.speed = 200
  player.img = love.graphics.newImage('purple.png')

  player.width = 40
  player.height = 38

  player.ground = 18*38
  player.trueGround = 19*38
  player.y_velocity = 0
  player.jump_height = -350
  player.gravity = -500

end

function setPlayer1Spawn()

  Player1MapLocation = sendMapNumber()

  if Player1MapLocation == 1 then
    player.x = 3
    player.y = 680
  end

end

function playerActions(dt)
  
  print(player.x)
  print(player.y)

  if love.keyboard.isDown('d') then

    if player.x <= (1000 - player.width) then
      if barricadeStatus.right == false then
        player.x = player.x + (player.speed * dt)
      else
        player.x = player.x 
      end
    end

  elseif love.keyboard.isDown('a') then
    if player.x >= 0 then 
      if barricadeStatus.left == false then
        player.x = player.x - (player.speed * dt)
      else
        player.x = player.x
      end
    end
  end

  if love.keyboard.isDown('space') then
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height
		end
	end
 
	if player.y_velocity ~= 0 or barricadeStatus.down == false then
		player.y = player.y + player.y_velocity * dt
		player.y_velocity = player.y_velocity - player.gravity * dt
    player.ground = newFloor()*38-38
	end
  
  if barricadeStatus.down == true then
    player.ground = newFloor()*38-38
  else
    player.ground = player.trueGround
  end
  
  if barricadeStatus.up == true then
    player.y_velocity = 58
  end
 
	if player.y > player.ground then
		player.y_velocity = 0
    player.y = player.ground
	end
  
end

function p1X()
  return player.x
end

function p1Y()
  return player.y
end

function p1Width()
  return player.width
end

function p1Height()
  return player.height
end