-- require libs; I usually make them global for simplicity
require 'lib.middleclass'
Stateful = require 'lib.stateful'
cron     = require 'lib.cron'
Menu     = require 'lib.menu'

-- game & gamestate requires
local Game = require 'game'
require 'gamestates.loading'
require 'gamestates.main_menu'
require 'gamestates.credits_menu'
require 'gamestates.howto_menu'
require 'gamestates.game_screen'


local game -- the "game" var is local; only visible on this file

-- basic LÖVE callbacks used on this game; add more as needed
function love.load()
  game = Game:new() -- initialize game here
end

function love.draw()
  game:draw()
end

function love.update(dt)
  cron.update(dt) -- notice that cron is updated here; other things could be update here too
  game:update(dt)
end

function love.keypressed(key, code)
  game:keypressed(key, code)
end

function love.mousepressed(x,y,button)
  game:mousepressed(x,y,button)
end