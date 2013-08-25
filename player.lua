player = {
	x = 0,
	y = 0,
	step_x = 0,
	step_y = 0,
	i = 1,
	j = 1,
	sprite = nil,
	draw = function () 
				love.graphics.draw(player.sprite, player.x, player.y+10) 
			end
	}