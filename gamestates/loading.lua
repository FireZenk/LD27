local Game = require 'game'
local Loading = Game:addState('Loading')

-- TWEEN
local tween = require 'lib.tween'

local percent = 0

function Loading:enteredState()
  self:log('Entered Loading')
  
  love.graphics.setBackgroundColor(0,255,255)

  local counterId = cron.every(0.5, function()
    percent = percent + 10
  end)

  cron.after(5, function()
    cron.cancel(counterId)
    self:gotoState('MainMenu')
  end)

  boy = {x=740,y=400,sprite=love.graphics.newImage("assets/Character Boy Left.png")}
  tween(5, boy, {x = 0}, 'inOutQuad')

end

function Loading:update(dt)
  -- TWEEN UPDATE
  tween.update(dt)
end

function Loading:draw()
  -- COLOR
  love.graphics.setColor(100, 149, 237)

  f = love.graphics.newFont("assets/a song for jennifer.ttf", 40)
  love.graphics.setFont(f)

	love.graphics.printf("10 Seconds to escape", 
		0, 180, love.graphics.getWidth(), "center")

  f = love.graphics.newFont("assets/a song for jennifer.ttf", 22)
  love.graphics.setFont(f)

	love.graphics.printf("Loading... " .. percent .. "%", 
    	0, 240, love.graphics.getWidth(), "center")

  -- RESET COLOR
  love.graphics.setColor(255,255,255)

  love.graphics.draw(boy.sprite, boy.x, boy.y) 
end

return Loading