barricadeStatus = {}

barricadeStatus.up = false
barricadeStatus.down = false
barricadeStatus.left = false
barricadeStatus.right = false


function whereIsPlayer1()
  Player1X = p1X()
  Player1Y = p1Y()

  Player1Width = p1Width()
  Player1Height = p1Height()

  Player1X = math.floor((Player1X + 0.5)) + 1
  Player1Y = math.floor((Player1Y + 0.5))

  Player1Width = Player1Width + Player1X
  Player1Height = Player1Height + Player1Y

  cellWidth = p1Width()
  cellHeight = p1Height()

  cellWidth = math.floor((cellWidth + 0.5)/40)
  cellHeight = math.floor((cellHeight + 0.5)/38)

  cellX = math.floor((Player1X)/40) + 1
  cellY = math.floor((Player1Y)/38)

  cellWidth = cellWidth + cellX
  cellHeight = cellHeight + cellY

  surveySAYS = true

  targetUpCell = {}

  targetUpCell.x = 0
  targetUpCell.y = 0
  targetUpCell.width = 0
  targetUpCell.height = 0

  targetDownCell = {}

  targetDownCell.x = 0
  targetDownCell.y = 0
  targetDownCell.width = 0
  targetDownCell.height = 0

  targetLeftCell = {}

  targetLeftCell.x = 0
  targetLeftCell.y = 0
  targetLeftCell.width = 0
  targetLeftCell.height = 0

  targetRightCell = {}

  targetLeftCell.x = 0
  targetLeftCell.y = 0
  targetLeftCell.width = 0
  targetLeftCell.height = 0

  dirMatrix = {} --A little array that holds all of the values of the nearby blocks surrounding Player1

  if NewMap[cellY][cellX] then
    --print (NewMap[cellY][cellX])

--[[These variables within the dirMatrix array hold the positions for the following directions:
    
    [ 1 2 3 ]
    [ 4 P 5 ]
    [ - 7 - ]
    
    1 - UpLeft
    2 - Up
    3 - UpRight
    4 - Left
    P - Player
    5 - Right
    7 - Down
--]]
    
    dirMatrix.UpLeftBlock   = NewMap[cellY+0][cellX-1]
    dirMatrix.UpBlock       = NewMap[cellY+0][cellX+0]
    dirMatrix.UpRightBlock  = NewMap[cellY+0][cellX+1]
    dirMatrix.LeftBlock     = NewMap[cellY+0][cellX+0]
    dirMatrix.RightBlock    = NewMap[cellY+0][cellX+1]
    dirMatrix.DownBlock     = NewMap[cellY+1][cellX+0]

    --
    --If Block has a value of 0, the player is free and can move in that spot
    --
    if dirMatrix.UpLeftBlock == 0 then
      barricadeStatus.up = false
      barricadeStatus.left = false
    end
    
    if dirMatrix.UpBlock == 0 then
      barricadeStatus.up = false
    end
    
    if dirMatrix.UpRightBlock == 0 then
      barricadeStatus.up = false
      barricadeStatus.right = false
    end

    if dirMatrix.LeftBlock == 0 then
      barricadeStatus.left = false
    end

    if dirMatrix.RightBlock == 0 then
      barricadeStatus.right = false
    end
    
    if dirMatrix.DownBlock == 0 then
      barricadeStatus.down = false
    end
    


    --
    --If Block has a value of 1, preform a collision test
    --
    if dirMatrix.UpLeftBlock == 1 then

      targetUpCell.x = (cellX-1)
      targetUpCell.y = (cellY-1)
      targetUpCell.width = 40*(cellX-1)
      targetUpCell.height = 38*(cellY-1)

      surveySAYS = rectCollisions(player.x, player.y, player.width, player.height, targetUpCell.x, targetUpCell.y, targetUpCell.width, targetUpCell.height)

      if surveySAYS == false then
        barricadeStatus.up = true
        barricadeStatus.left = true
      end
    end

    if dirMatrix.UpBlock == 1 then

      targetUpCell.x = (cellX+0)
      targetUpCell.y = (cellY-1)
      targetUpCell.width = 40*(cellX+0)
      targetUpCell.height = 38*(cellY-1)

      surveySAYS = rectCollisions(player.x, player.y, player.width, player.height, targetUpCell.x, targetUpCell.y, targetUpCell.width, targetUpCell.height)

      if surveySAYS == false then
        barricadeStatus.up = true
      end
    end
    
    if dirMatrix.UpRightBlock == 1 then

      targetUpCell.x = (cellX+1)
      targetUpCell.y = (cellY-1)
      targetUpCell.width = 40*(cellX+1)
      targetUpCell.height = 38*(cellY-1)

      surveySAYS = rectCollisions(player.x, player.y, player.width, player.height, targetUpCell.x, targetUpCell.y, targetUpCell.width, targetUpCell.height)

      if surveySAYS == false then
        barricadeStatus.up = true
        barricadeStatus.right = true
      end
    end

    if dirMatrix.LeftBlock == 1 then

      targetLeftCell.x = (cellX+0)
      targetLeftCell.y = (cellY+0)
      targetLeftCell.width = 40*(cellX+0)
      targetLeftCell.height = 38*(cellY+0)

      surveySAYS = rectCollisions(player.x, player.y, player.width, player.height, targetLeftCell.x, targetLeftCell.y, targetLeftCell.width, targetLeftCell.height)

      if surveySAYS == false then
        barricadeStatus.left = true
      end
    end

    if dirMatrix.RightBlock == 1 then

      targetRightCell.x = (cellX+1)
      targetRightCell.y = (cellY+0)
      targetRightCell.width = 40*(cellX+1)
      targetRightCell.height = 38*(cellY+0)

      surveySAYS = rectCollisions(player.x, player.y, player.width, player.height, targetRightCell.x, targetRightCell.y, targetRightCell.width, targetRightCell.height)

      if surveySAYS == false then
        barricadeStatus.right = true
      end
    end
    
    if dirMatrix.DownBlock == 1 then

      targetDownCell.x = (cellX+0)
      targetDownCell.y = (cellY+1)
      targetDownCell.width = 40*(cellX+0)
      targetDownCell.height = 38*(cellY+1)

      surveySAYS = rectCollisions(player.x, player.y, player.width, player.height, targetDownCell.x, targetDownCell.y, targetDownCell.width, targetDownCell.height)

      if surveySAYS == false then
        barricadeStatus.down = true
      end
    end
  end
end

function newFloor()
  return targetDownCell.y
end

