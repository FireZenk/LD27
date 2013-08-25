-- STATES
local Game = require 'game'
local MainMenu = require 'gamestates.main_menu'
local GameScreen = Game:addState('GameScreen', MainMenu)

-- TWEEN
local tween = require 'lib.tween'

-- IMPORTS
require "util.audio"
require "player"
require "bugs"

-- STATE IMPL
function GameScreen:enteredState()
  self:log('Entering GameScreen') 
  load()
end

function GameScreen:draw()
  draw()
end

function GameScreen:update(dt)
  update(dt)
end

function GameScreen:exitedState()
  self:log('Exiting GameScreen') 
end

function map()
  -- CREATE BASE MAP
  grass = { -- 0=hierba, 1=agua
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,1,1,1,1,1},
  {0,0,0,0,0,1,0,0,0,1},
  {0,0,0,0,0,1,1,1,1,1},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0}}

  obstacles = { -- 0=nada, 1=muro, 2=muroTop, 3=bug, 5=goal, 7=gemaVerde, 8=gemaAzul, 9=gemaNaranja
  {0,0,0,0,0,2,2,2,2,2}, --lineaIni
  {1,1,1,1,0,0,0,0,0,0},
  {1,8,0,0,0,0,2,2,2,0},
  {1,1,1,0,0,0,0,0,0,0},
  {1,0,0,0,0,2,2,2,2,2},
  {1,0,2,1,0,0,0,0,0,0},
  {1,0,2,2,2,2,1,3,0,0},
  {3,0,0,0,9,2,1,0,0,2},
  {0,0,0,0,0,2,1,0,0,3},
  {2,2,2,2,2,2,1,0,0,2},
  {3,0,0,0,7,0,0,3,0,0},
  {0,2,1,0,2,2,2,2,2,2},
  {0,0,0,0,0,0,0,0,0,0},
  {1,1,1,1,1,1,1,1,0,5}} --lineaFin
end

-- FUNCS
function load()
  -- INIT TIMER
  t_seconds = 9
  t_millis  = 99
  t_running = true

  -- INIT SCENARIO
  scale = 2
  grass = {}
  scenario_n = 7*scale
  scenario_m = 5*scale
  obstacles = {}
  gem_n = 0
  win = false

  -- INIT MAP
  map()

  local f = love.graphics.newFont("assets/a song for jennifer.ttf", 22)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(0,255,255)

  -- RESET COLOR
  love.graphics.setColor(255,255,255)

  -- LOAD SPRITES
  piece_grass = love.graphics.newImage("assets/Grass Block.png")
  piece_grass:setFilter("nearest","nearest")
  piece_stone = love.graphics.newImage("assets/Stone Block.png")
  piece_stone:setFilter("nearest","nearest")
  piece_water = love.graphics.newImage("assets/Water Block.png")
  piece_water:setFilter("nearest","nearest")
  goal = love.graphics.newImage("assets/Key.png")
  goal:setFilter("nearest","nearest")
  gemB = love.graphics.newImage("assets/Gem Blue.png")
  gemB:setFilter("nearest","nearest")
  gemG = love.graphics.newImage("assets/Gem Green.png")
  gemG:setFilter("nearest","nearest")
  gemO = love.graphics.newImage("assets/Gem Orange.png")
  gemO:setFilter("nearest","nearest")

  bug = love.graphics.newImage("assets/Enemy Bug.png")
  bug:setFilter("nearest","nearest")

  player.spriteD = love.graphics.newImage("assets/Character Boy.png")
  player.spriteU = love.graphics.newImage("assets/Character Boy Back.png")
  player.spriteL = love.graphics.newImage("assets/Character Boy Left.png")
  player.spriteR = love.graphics.newImage("assets/Character Boy Right.png")
  player.spriteD:setFilter("nearest","nearest")
  player.spriteU:setFilter("nearest","nearest")
  player.spriteL:setFilter("nearest","nearest")
  player.spriteR:setFilter("nearest","nearest")
  player.sprite = player.spriteD
  player.step_x = (piece_grass:getWidth()-player.sprite:getWidth()/2)*scale
  player.x = player.step_x
  player.step_y = ((52.5-player.sprite:getHeight()/2)*scale)

  -- MUSIC
  bgm = love.audio.play("assets/background.wav", "stream", true)
end

-- DRAWING LOOP
function draw()
  -- RESET COLOR
  love.graphics.setColor(255,255,255)

  -- SCENARIO
  for i=1,scenario_n do
    for j=1,scenario_m do
      if grass[i][j] == 0 then
    	  love.graphics.draw(piece_grass, piece_grass:getWidth()*i, (piece_grass:getHeight()-25)*j)
      elseif  grass[i][j] == 1 then
        love.graphics.draw(piece_water, piece_grass:getWidth()*i, (piece_grass:getHeight()-25)*j)
      end
    end
  end

  -- OBSTACLES
  for i=1,scenario_n do
    for j=1,scenario_m do
      if obstacles[i][j] == 1 then
        love.graphics.draw(piece_stone, piece_stone:getWidth()*i, ((piece_grass:getHeight()-25)*j)-20)
      elseif obstacles[i][j] == 3 then
        love.graphics.draw(bug, piece_stone:getWidth()*i, ((piece_grass:getHeight()-25)*j)-20)
      elseif obstacles[i][j] == 5 then
        love.graphics.draw(goal, piece_stone:getWidth()*i, ((piece_grass:getHeight()-25)*j)-40)
      elseif obstacles[i][j] == 7 then
        love.graphics.draw(gemG, piece_stone:getWidth()*i, ((piece_grass:getHeight()-25)*j)-20)
      elseif obstacles[i][j] == 8 then
        love.graphics.draw(gemB, piece_stone:getWidth()*i, ((piece_grass:getHeight()-25)*j)-20)
      elseif obstacles[i][j] == 9 then
        love.graphics.draw(gemO, piece_stone:getWidth()*i, ((piece_grass:getHeight()-25)*j)-20)
      end
    end
  end

  -- PLAYER
  player.draw()

  -- TOPOBSTACLES
  for i=1,scenario_n do
    for j=1,scenario_m do
      if obstacles[i][j] == 2 then
        love.graphics.draw(piece_stone, piece_stone:getWidth()*i, ((piece_grass:getHeight()-25)*j)-20)
      end
    end
  end

  -- PANEL
  hud()
end

-- MAIN LOOP
function update(dt)
  -- HANDLE AUDIO
  love.audio.update()

  -- TWEEN UPDATE
  tween.update(dt)

  -- CHECK POSITION
  if obstacles[player.i][player.j] == 7
    or obstacles[player.i][player.j] == 8
    or obstacles[player.i][player.j] == 9 then
    obstacles[player.i][player.j] = 0
    gem_n = gem_n + 1
    love.audio.play("assets/diamond.wav")
  elseif obstacles[player.i][player.j] == 3 then
    win = false
    t_running = false
  end

  -- MOVE ENEMIES
  if t_running then moveBugs(dt) end

  -- FINISH
  if obstacles[player.i][player.j] == 5 and gem_n == 3 then
    win = true
    t_running = false
    obstacles[player.i][player.j] = 0
  end

  -- TIMER
  if t_running == true then
	  t_millis = t_millis -1
	  if t_millis == -1 then
	  	t_seconds = t_seconds -1
	  	t_millis = 99
	  end
  end
end

function moveBugs(dt)
  bugs[1].move(dt)
  bugs[2].move(dt)
  bugs[3].move(dt)
  bugs[4].move(dt)
  bugs[5].move(dt)
end

function hud()
  local f = love.graphics.newFont("assets/a song for jennifer.ttf", 22)
  love.graphics.setFont(f)

  -- COLOR
  love.graphics.setColor(100, 149, 237)

  -- TIMER
  if t_seconds < 1 and t_millis < 1 then
    love.graphics.printf("TIME'S UP!",
      0, 0, love.graphics.getWidth(), "center")
    t_running = false
  end
  
  if t_running then
    if t_seconds < 10 and t_millis < 10 then
      love.graphics.printf("00:0"..t_seconds..":0"..t_millis,
        0, 0, love.graphics.getWidth(), "center")
    elseif t_seconds < 10 then
      love.graphics.printf("00:0"..t_seconds..":"..t_millis,
        0, 0, love.graphics.getWidth(), "center")
    elseif t_millis < 10 then
      love.graphics.printf("00:"..t_seconds..":0"..t_millis,
        0, 0, love.graphics.getWidth(), "center")
    else
      love.graphics.printf("00:"..t_seconds..":"..t_millis,
        0, 0, love.graphics.getWidth(), "center")
    end
  end

  -- GEM COUNTER
  love.graphics.printf("GEMS: "..gem_n.."/3", -10, 0, love.graphics.getWidth(), "right")

  -- WIN & LOSE
  if win == true then 
    local f = love.graphics.newFont("assets/a song for jennifer.ttf", 40)
    love.graphics.setFont(f)
    love.graphics.printf("You Win! Press R to restart", 0, 200, love.graphics.getWidth(), "center")
    love.graphics.printf("or ESC to menu.", 0, 240, love.graphics.getWidth(), "center")

    quit() 
  end

  if win == false and t_running == false then 
    local f = love.graphics.newFont("assets/a song for jennifer.ttf", 40)
    love.graphics.setFont(f)
    love.graphics.printf("You Lose! Press R to restart", 0, 200, love.graphics.getWidth(), "center")
    love.graphics.printf("or ESC to menu.", 0, 240, love.graphics.getWidth(), "center")

    quit() 
  end
end

function checkObstacle(i, j)
  if obstacles[i][j] ~= 1 and obstacles[i][j] ~= 2 and grass[i][j] ~= 1 then
    return true
  else
    return false
  end
end

function moveUp()
  player.sprite = player.spriteU
  if player.j > 1 and checkObstacle(player.i,player.j-1) then
  	if player.y ~= 0 then
        --player.y = player.y - player.step_y
        tween(0.1, player, {y = player.y - player.step_y}, 'linear')
        player.j = player.j - 1
    end
  end
end

function moveDown()
  player.sprite = player.spriteD
  if player.j < scenario_m and checkObstacle(player.i,player.j+1) then
  	if player.y ~= player.step_y*(scenario_m-1) then
    		--player.y = player.y + player.step_y
        tween(0.1, player, {y = player.y + player.step_y}, 'linear')
        player.j = player.j + 1
    end
  end
end

function moveRight()
  player.sprite = player.spriteR
  if player.i < scenario_n and checkObstacle(player.i+1,player.j) then
  	if player.x ~= player.step_x*scenario_n then
    		--player.x = player.x + player.step_x
        tween(0.1, player, {x = player.x + player.step_x}, 'linear')
        player.i = player.i + 1
    	end
  end
end

function moveLeft()
  player.sprite = player.spriteL
  if player.i > 1 and checkObstacle(player.i-1,player.j) then
  	if player.x ~= player.step_x then
    		--player.x = player.x - player.step_x
        tween(0.1, player, {x = player.x - player.step_x}, 'linear')
        player.i = player.i - 1
    	end
  end
end

-- INPUT
function GameScreen:keypressed(key, unicode)
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
    if key == "right" then moveRight()
    elseif key == "left" then moveLeft()
    elseif key == "up" then moveUp()
    elseif key == "down" then moveDown()
    end
  else
    -- STATE KEYS
    if key == 'escape' then
      quit()
      self:gotoState('MainMenu')
    elseif key == 'r' then
      quit()
      load()
    end
  end
end

-- MOUSE INPUT
function GameScreen:mousepressed(x,y,button)
  -- NO ACTION
end

-- END
function quit() 
  -- MAP & GEMS
  map() gem_n=0
  -- PLAYER
  player.step_x = (piece_grass:getWidth()-player.sprite:getWidth()/2)*scale
  player.step_y = ((52.5-player.sprite:getHeight()/2)*scale)
  player.sprite = player.spriteD
  player.x = player.step_x
  player.y = 0
  player.i = 1
  player.j = 1
  -- ENEMIES
  bugs[1].bug_x, bugs[1].bug_y, bugs[1].bug_moves = 8, 1, 1
  bugs[2].bug_x, bugs[2].bug_y, bugs[2].bug_moves = 7, 8, 1
  bugs[3].bug_x, bugs[3].bug_y, bugs[3].bug_moves = 9, 9, 1
  bugs[4].bug_x, bugs[4].bug_y, bugs[4].bug_moves = 11,8, 1
  bugs[5].bug_x, bugs[5].bug_y, bugs[5].bug_moves = 11,1, 1  
  -- AUDIO
  love.audio.stop(bgm) 
  -- FONT RESET
  local f = love.graphics.newFont("assets/a song for jennifer.ttf", 22)
  love.graphics.setFont(f)
end

return GrameScreen