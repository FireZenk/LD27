-- INPUTS
function love.mousepressed(x, y, button)
  -- TODO
end

function love.mousereleased(x, y, button)
  -- TODO
end

function love.keypressed(key, unicode)
  -- AUDIO KEYS
  if key == 's' then
    love.audio.stop(bgm)
  elseif key == 'p' then
    love.audio.play(bgm) -- still streaming and looping
  end

  -- DEBUG KEY
  --if key == "rctrl" then --set to whatever key you want to use
  --  debug.debug()
  --end

  -- GAME KEYS
  if t_running then
    if key == "right" then
      moveRight()
    elseif key == "left" then
      moveLeft()
    elseif key == "up" then
      moveUp()
    elseif key == "down" then
      moveDown()
    end
  else
    if key == "r" then
      restart()
    end
  end

end

function love.keyreleased(key, unicode)
   -- TODO
end