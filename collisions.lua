
--[[

Collisions here are handled in a two setp process.

areWeTouching = Looks at the Min and Max of two rectangles and sees if either one of them has their ranges mixed with each other.
If this happens, the function returns a true value.   If it returns a false value, then they are not touching.

rectCollisions = Gets the player's block and the collision block for a collision test.  

aX = playerBlock.x
aY = playerBlock.y
aW = playerBlock.width
aH = playerBlock.height

cX = collisionBlock.x
cY = collisionBlock.y
cW = collisionBlock.width
cH = collisionBlock.height

--]]

function areWeTouching(aMin, bMin, aMax, bMax)
  return math.max(aMin, aMax) >= math.min(bMin, bMax) and math.min(aMin, aMax) <= math.max(bMin, bMax)
end

function rectCollisions(aX, aY, aW, aH,  cX, cY, cW, cH)
  return areWeTouching(aX, aX + aW, cX, cX + cW) and areWeTouching(aY, aY + aH, cY, cY + cH)
end

