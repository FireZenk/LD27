local Game = require 'game'
local MainMenu = require 'gamestates.main_menu'

local HowtoMenu = Game:addState('HowtoMenu', MainMenu)

function HowtoMenu:enteredState()
  self:log('Entering HowtoMenu')

  local f = love.graphics.newFont("assets/a song for jennifer.ttf", 22)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(0,255,255)

end

function HowtoMenu:exitedState()
  self:log('Exiting HowtoMenu')
end

function HowtoMenu:keypressed(key, code)
  if key == 'escape' then
    self:gotoState('MainMenu')
  end
end

function HowtoMenu:draw()
	-- COLOR
  love.graphics.setColor(100, 149, 237)

  love.graphics.printf("CONTROLS | player movements: arrow keys", 
    0, 180, love.graphics.getWidth(), "center")

  love.graphics.printf("INSTRUCTIONS | Collect all the gems before reach the key to finish the level",
    0, 220, love.graphics.getWidth(), "center")

  -- RESET COLOR
  love.graphics.setColor(255,255,255)
end

function HowtoMenu:mousepressed(x,y,button)
  self:gotoState('MainMenu')
end

return HowtoMenu