bugs = {
	{bug_moves = 1, --8max
	 bug_sleep = 0.5,
	 bug_time = 0,
	 bug_x = 8,
	 bug_y = 1,
	 bug_movements = {{8,1},{8,2},{8,3},{8,4},{9,4},{9,3},{9,2},{9,1}},
	 move = function(dt)
		bugs[1].bug_time = bugs[1].bug_time + dt
	  	if bugs[1].bug_time > bugs[1].bug_sleep then
	    	obstacles[bugs[1].bug_x][bugs[1].bug_y] = 0
	    	if bugs[1].bug_moves < 8 then
	      		bugs[1].bug_moves = bugs[1].bug_moves + 1
	      		bugs[1].bug_x = bugs[1].bug_movements[bugs[1].bug_moves][1]
	      		bugs[1].bug_y = bugs[1].bug_movements[bugs[1].bug_moves][2]
	    	else
	    		bugs[1].bug_moves = 1
	    		bugs[1].bug_x = bugs[1].bug_movements[bugs[1].bug_moves][1]
	      		bugs[1].bug_y = bugs[1].bug_movements[bugs[1].bug_moves][2]
	    	end
	    	obstacles[bugs[1].bug_x][bugs[1].bug_y] = 3
	    	bugs[1].bug_time = 0
	  	end
	 end},
	{bug_moves = 1, --4max
	 bug_sleep = 0.5,
	 bug_time = 0,
	 bug_x = 7,
	 bug_y = 8,
	 bug_movements = {{7,8},{7,9},{7,10},{7,9}},
	 move = function(dt)
		bugs[2].bug_time = bugs[2].bug_time + dt
	  	if bugs[2].bug_time > bugs[2].bug_sleep then
	    	obstacles[bugs[2].bug_x][bugs[2].bug_y] = 0
	    	if bugs[2].bug_moves < 4 then
	      		bugs[2].bug_moves = bugs[2].bug_moves + 1
	      		bugs[2].bug_x = bugs[2].bug_movements[bugs[2].bug_moves][1]
	      		bugs[2].bug_y = bugs[2].bug_movements[bugs[2].bug_moves][2]
	    	else
	    		bugs[2].bug_moves = 1
	    		bugs[2].bug_x = bugs[2].bug_movements[bugs[2].bug_moves][1]
	      		bugs[2].bug_y = bugs[2].bug_movements[bugs[2].bug_moves][2]
	    	end
	    	obstacles[bugs[2].bug_x][bugs[2].bug_y] = 3
	    	bugs[2].bug_time = 0
	  	end
	 end},
	{bug_moves = 1, --4max
	 bug_sleep = 0.5,
	 bug_time = 0,
	 bug_x = 9,
	 bug_y = 9,
	 bug_movements = {{9,9},{9,10},{9,9},{9,8}},
	 move = function(dt)
		bugs[3].bug_time = bugs[3].bug_time + dt
	  	if bugs[3].bug_time > bugs[3].bug_sleep then
	    	obstacles[bugs[3].bug_x][bugs[3].bug_y] = 0
	    	if bugs[3].bug_moves < 4 then
	      		bugs[3].bug_moves = bugs[3].bug_moves + 1
	      		bugs[3].bug_x = bugs[3].bug_movements[bugs[3].bug_moves][1]
	      		bugs[3].bug_y = bugs[3].bug_movements[bugs[3].bug_moves][2]
	    	else
	    		bugs[3].bug_moves = 1
	    		bugs[3].bug_x = bugs[3].bug_movements[bugs[3].bug_moves][1]
	      		bugs[3].bug_y = bugs[3].bug_movements[bugs[3].bug_moves][2]
	    	end
	    	obstacles[bugs[3].bug_x][bugs[3].bug_y] = 3
	    	bugs[3].bug_time = 0
	  	end
	end},
	{bug_moves = 1, --4max
	 bug_sleep = 0.5,
	 bug_time = 0,
	 bug_x = 11, 
	 bug_y = 8,
	 bug_movements = {{11,8},{11,9},{11,10},{11,9}},
	 move = function(dt)
		bugs[4].bug_time = bugs[4].bug_time + dt
	  	if bugs[4].bug_time > bugs[4].bug_sleep then
	    	obstacles[bugs[4].bug_x][bugs[4].bug_y] = 0
	    	if bugs[4].bug_moves < 4 then
	      		bugs[4].bug_moves = bugs[4].bug_moves + 1
	      		bugs[4].bug_x = bugs[4].bug_movements[bugs[4].bug_moves][1]
	      		bugs[4].bug_y = bugs[4].bug_movements[bugs[4].bug_moves][2]
	    	else
	    		bugs[4].bug_moves = 1
	    		bugs[4].bug_x = bugs[4].bug_movements[bugs[4].bug_moves][1]
	      		bugs[4].bug_y = bugs[4].bug_movements[bugs[4].bug_moves][2]
	    	end
	    	obstacles[bugs[4].bug_x][bugs[4].bug_y] = 3
	    	bugs[4].bug_time = 0
	  	end
	end},
	{bug_moves = 1, --10max
	 bug_sleep = 0.5,
	 bug_time = 0,
	 bug_x = 11, --de 11 a 13
	 bug_y = 1, --de 1 a 4
	 bug_movements = {{11,1},{11,2},{11,3},{11,4},{12,4},{13,4},{13,3},{13,2},{13,1},{12,1}},
	 move = function(dt)
		bugs[5].bug_time = bugs[5].bug_time + dt
	  	if bugs[5].bug_time > bugs[5].bug_sleep then
	    	obstacles[bugs[5].bug_x][bugs[5].bug_y] = 0
	    	if bugs[5].bug_moves < 10 then
	      		bugs[5].bug_moves = bugs[5].bug_moves + 1
	      		bugs[5].bug_x = bugs[5].bug_movements[bugs[5].bug_moves][1]
	      		bugs[5].bug_y = bugs[5].bug_movements[bugs[5].bug_moves][2]
	    	else
	    		bugs[5].bug_moves = 1
	    		bugs[5].bug_x = bugs[5].bug_movements[bugs[5].bug_moves][1]
	      		bugs[5].bug_y = bugs[5].bug_movements[bugs[5].bug_moves][2]
	    	end
	    	obstacles[bugs[5].bug_x][bugs[5].bug_y] = 3
	    	bugs[5].bug_time = 0
	  	end
	end}
}