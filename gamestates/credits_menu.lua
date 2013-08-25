local Game = require 'game'
local MainMenu = require 'gamestates.main_menu'

local CreditsMenu = Game:addState('CreditsMenu', MainMenu)

function CreditsMenu:enteredState()
  self:log('Entering CreditsMenu')

  local f = love.graphics.newFont("assets/a song for jennifer.ttf", 22)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(0,255,255)

end

function CreditsMenu:exitedState()
  self:log('Exiting CreditsMenu')
end

function CreditsMenu:keypressed(key, code)
  if key == 'escape' then
    self:gotoState('MainMenu')
  end
end

function CreditsMenu:draw()
	-- COLOR
  love.graphics.setColor(100, 149, 237)

  love.graphics.printf("Game created by FireZenk <twitter: @FireZenk>", 
    0, 140, love.graphics.getWidth(), "center")

  love.graphics.printf("-----------------------------------------------", 
    0, 180, love.graphics.getWidth(), "center")

  love.graphics.printf("Game engine: love2d.org", 
    0, 210, love.graphics.getWidth(), "center")

  love.graphics.printf("Source code: github.com/FireZenk/LD27", 
    0, 240, love.graphics.getWidth(), "center")

  love.graphics.printf("Graphics: lostgarden.com", 
    0, 270, love.graphics.getWidth(), "center")

  love.graphics.printf("Bgm and fx: freesound.org", 
    0, 300, love.graphics.getWidth(), "center")

  -- RESET COLOR
  love.graphics.setColor(255,255,255)
end

function CreditsMenu:mousepressed(x,y,button)
  self:gotoState('MainMenu')
end

return CreditsMenu
