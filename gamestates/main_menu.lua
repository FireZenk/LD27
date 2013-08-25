local Game = require 'game'

local MainMenu = Game:addState('MainMenu')

function MainMenu:enteredState()
  self:log('Entering MainMenu')

  local f = love.graphics.newFont("assets/a song for jennifer.ttf", 40)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(0,255,255)

  self.menu = Menu:new({
    { 'Start game', function() self:pushState('GameScreen') end },
    { 'How to', function() self:gotoState('HowtoMenu') end },
    { 'Credits', function() self:gotoState('CreditsMenu') end },
    { 'Exit', function() self:exit() end }
  })
end

function MainMenu:draw()
  -- COLOR
  love.graphics.setColor(100, 149, 237)

  love.graphics.printf("10 Seconds to escape", 
    0, 100, love.graphics.getWidth(), "center")

  self.menu:draw()

  -- RESET COLOR
  love.graphics.setColor(255,255,255)
end

function MainMenu:exitedState()
  self.menu = nil
  self:log('Exiting MainMenu')
end

function MainMenu:mousepressed(x,y,button)
  self.menu:mousepressed(x,y,button)
end

return MainMenu