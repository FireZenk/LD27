local Game = class('Game'):include(Stateful)

function Game:initialize()
  self:gotoState('Loading') -- go to the first state here, if you want
end

-- Include the methods available in all states here

-- prints output in the console
-- If you are on windows you will need to activate it first, see
--   https://love2d.org/wiki/Config_Files
-- for details (you have to set t.console to true)
function Game:log(...)
  print(...)
end

function Game:exit()
  self:log("Goodbye!")
  love.event.push('quit')
end

-- Also include "default safe" methods for the callbacks
-- This way we don't have to define "mousepressed" on the states that don't need it
function Game:draw()
end

function Game:update(dt)
end

-- by default, exit when pressing 'escape'
function Game:keypressed(key, code)
  if key == 'escape' then
    self:exit()
  end
end

function Game:mousepressed(x,y,button)
end

return Game