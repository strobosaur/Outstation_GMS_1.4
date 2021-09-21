///make_ground_for_door2(grid, x, y)

    var grid = argument0;
//    var xx = argument1;
//    var yy = argument2;
    
    var cx = 0;
    var cy = 0;
    
    var dx = 0;
    var dy = 0;
    
    var ex = 0;
    var ey = 0;
    
    var fx = 0;
    var fy = 0;
    
    var gx = 0;
    var gy = 0;
    
    
    // PARSE GRID
    for (var i = 1; i <= ds_grid_width(grid); i++)
    {
        for (var j = 1; j <= ds_grid_height(grid); j++)
        {
            // CHECK 4 DIRECTIONS
            for (var l = 0; l <= 3; l++)
            {
                // CHECK ALL DIRECTIONS FOR WALLS AND MAKE SURE CELL IS DOOR
                if grid[#i-1, j-1] == mapcode.door
                {
                    var xx = i;
                    var yy = j;
                    
                    cx = xx + lengthdir_x(1, (l+1)*90);
                    cy = yy + lengthdir_y(1, (l+1)*90);
                    
                    dx = xx + lengthdir_x(1, (l+3)*90);
                    dy = yy + lengthdir_y(1, (l+3)*90);
                    
                    var wall_l = grid[#cx-1, cy-1] == mapcode.void;
                    var wall_r = grid[#dx-1, dy-1] == mapcode.void;
                    
/*                    grid[# ((xx + lengthdir_x(1, (l+1)*90))-1), ((yy-1) + lengthdir_y(1, (l+1)*90))] == mapcode.void
                              || grid[# ((xx + lengthdir_x(1, (l+1)*90))-1), ((yy-1) + lengthdir_y(1, (l+1)*90))] == mapcode.wall
                    var wall_l = grid[# ((xx + lengthdir_x(1, (l+1)*90))-1), ((yy-1) + lengthdir_y(1, (l+1)*90))] == mapcode.void
                              || grid[# ((xx + lengthdir_x(1, (l+1)*90))-1), ((yy-1) + lengthdir_y(1, (l+1)*90))] == mapcode.wall*/
                    
                    // IF WALLS ON BOTH SIDES, GO FORWARD
                    if wall_r && wall_l
                    {
                        cx = xx + lengthdir_x(1, l*90);
                        cy = yy + lengthdir_y(1, l*90);
                        
                        // MAKE GROUND ON DOORSTEP
                        grid[#cx-1, cy-1] = mapcode.ground;
                        
                        cx += lengthdir_x(1, l*90);
                        cy += lengthdir_y(1, l*90);
                        
                        gx = cx// + lengthdir_x(5, l*90);
                        gy = cy// + lengthdir_y(5, l*90);
                        
                        // LOOK FOR MORE GROUND
                        var ground_found = false;
                        
                        for (var m = 2; m <= 6; m++)
                        {
                            dx = gx + lengthdir_x(1, (l+1)*90);
                            dy = gy + lengthdir_y(1, (l+1)*90);
                            
                            ex = gx + lengthdir_x(1, (l+3)*90);
                            ey = gy + lengthdir_y(1, (l+3)*90);
                            
                            fx = gx + lengthdir_x(1, (l)*90);
                            fy = gy + lengthdir_y(1, (l)*90);
                            
                            if grid[#dx-1, dy-1] == mapcode.ground
                            || grid[#ex-1, ey-1] == mapcode.ground
                            || grid[#fx-1, fy-1] == mapcode.ground
                            //ds_grid_value_exists(grid, dx, dy, ex, ey, mapcode.ground)
                            {
                                ground_found = true;
                                break;
                            }
                            else
                            {
                                gx += lengthdir_x(1, l*90);
                                gy += lengthdir_y(1, l*90);
                            }
                        }
                        
                        if ground_found == true //ds_grid_value_exists(grid, cx-1, cy-1, dx-1, dy-1, mapcode.ground)
                        {
                            for (var k = 0; k <= m; k++)
                            {
                                if (grid[# cx-1, cy-1] == mapcode.ground)
                                {
                                    break;
                                }
                                else
                                {
                                    grid[# cx-1, cy-1] = mapcode.ground;
                                    
                                    cx += lengthdir_x(1, l*90);
                                    cy += lengthdir_y(1, l*90);
                                }
                            }
                        }
                    }
                    
//                    tiles_convert_area(grid, i-1, j-1, i+1, j+1, mapcode.hole, mapcode.ground);
                }
            }
        }
    }
