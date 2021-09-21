///door_find_dir(grid, x, y, door list)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    xx = do_door_x // argument1;
    yy = do_door_y // argument2;
    var door_list = argument3;
    
    var local_failsafe = ds_list_size(door_list)-1;
    var make_door = 0;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    // IF NOT DOOR, FAIL
    if grid[# xx-1, yy-1] != mapcode.door 
    {
       return false;
    }
    
    var found_doorway = false;
    var local_fails = 0;
    
    while (found_doorway == false)
    {
//        var pos = ds_list_find_value(door_list, irandom(ds_list_size(door_list)-1));
        
//        do_door_x = pos[0];
//        do_door_y = pos[1];
    
        // CHECK 4 DIRECTIONS
        for (var i = 0; i <= 3; i++)
        {
            var cx = do_door_x;
            var cy = do_door_y;
            
            // FIND GROUND/WALL DIR
            if grid[# (xx-1) + lengthdir_x(1, (i-1)*90), (yy-1) + lengthdir_y(1, (i-1)*90)] == mapcode.wall
            && grid[# (xx-1) + lengthdir_x(1, (i+1)*90), (yy-1) + lengthdir_y(1, (i+1)*90)] == mapcode.wall
            && grid[# (xx-1) + lengthdir_x(1, (i+2)*90), (yy-1) + lengthdir_y(1, (i+2)*90)] == mapcode.ground
            {
                var steps = 1;
                
                cx += lengthdir_x(steps, (i)*90)
                cy += lengthdir_y(steps, (i)*90)
                
                // IF GROUND IN 3x3 1 STEP AHEAD, BREAK
                if cellR1(grid, cx, cy, mapcode.ground, false) > 0
                {
                    continue;
                }
                else
                {
                    // ELSE, STEP AHEAD
                    
                    cx += lengthdir_x(3, (i)*90)
                    cy += lengthdir_y(3, (i)*90)
                    steps += 3;
                }
                
                // TUNNEL
                repeat(5)
                {
                    cx += lengthdir_x(1, (i)*90)
                    cy += lengthdir_y(1, (i)*90)
                    steps++;
                    
                    if !inside_bounds(cx, cy, 2, 2, gridw-2, gridh-2) { break; }
                    
                    // IF 5x5 IS VOID, MAKE PASSAGE IN THIS DIRECTION
                    // IF CELL INSIDE BOUNDS
                    if cellR5x5(grid, cx, cy, mapcode.void) >= 25
                    {
                        found_doorway = true;
                        
                        make_door = array_create(0);
                        make_door[0] = cx;
                        make_door[1] = cy;
                        
                        ds_list_add(big_room_open_ends, make_door);
                        
                        do_door_x = cx;
                        do_door_y = cy;
                        
                        // BACKTRACK AND MAKE GROUND
                        repeat(steps)
                        {
                            cx -= lengthdir_x(1, (i)*90)
                            cy -= lengthdir_y(1, (i)*90)
                            
                            if grid[# cx-1, cy-1] == mapcode.ground
                            || grid[# cx-1, cy-1] == mapcode.door
                            {
                                // BREAK LOOP IF GROUND FOUND
                                break;
                            }
                            
                            grid[# cx-1, cy-1] = mapcode.ground;
                        }
                        
                        return true;
                    }
                }
            }
        }
        
        // TRY NEW DOOR
        if !ds_list_empty(door_list)
        {
            var r_door = irandom(ds_list_size(door_list)-1)
            var open_end = ds_list_find_value(door_list, r_door);
            
            do_door_x = open_end[0];
            do_door_y = open_end[1];
            
            ds_list_delete(door_list, r_door);
        }
        else
        {
            return false;
        }
    }
                    
        
            // FIND GROUND DIR
/*            if grid[# xx + lengthdir_x(1, i*90)-1, yy + lengthdir_y(1, i*90)-1] == mapcode.ground
            {
                // FIND NEXT WALL
                while (grid[# xx-1, yy-1] != mapcode.wall && grid[# xx-1, yy-1] != mapcode.void)
                {
                    xx += lengthdir_x(1, (i+2)*90)
                    yy += lengthdir_y(1, (i+2)*90)
                    
                    // IF GROUND IN 3x3, BREAK
                    if cellR1(grid, xx, yy, mapcode.ground) > 1
                    || inside_bounds(xx, yy, 10, 10, gridw-10, gridh-10) == false
                    {
                        local_fails++;
                        break;
                    }
                    
                    // INSIDE BOUNDS?
    /*                if (xx < 10) || (xx > gridw - 10) || (yy < 10) || (yy > gridh -10)
                    {
                        return noone;
                    }*/
                    
                    // MAKE PASSAGE
    //                grid[# xx-1, yy-1] = mapcode.passage;
/*                }
                
                // PUNCH HOLE IN WALL
                repeat(3)
                {
                    xx += lengthdir_x(1, (i+2)*90)
                    yy += lengthdir_y(1, (i+2)*90)
                    
                    grid[# xx-1, yy-1] = mapcode.passage;
                }
                
                // MAKE DOOR TO NEW ROOM
                grid[# xx-1, yy-1] = mapcode.door;
                
                var ret = array_create(0);
                ret[0] = xx;
                ret[1] = yy;
                
                return ret;
            }
        }
    }
