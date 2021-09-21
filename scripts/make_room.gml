///make_room(grid, width, height, allow splice)

    var grid = argument0;
    var maxwidth = argument1;
    var maxheight = argument2;
    var splice = argument3;
    
    var width, height, list, found_spot, has_door_coord, door_x, door_y, last_door_x, last_door_y, door_out_x, door_out_y, door_at, rdoor, room_mid, mid_x, mid_y, x1, y1, x2, y2;
    
    var new_open_end_odds = 0.15;
    
    var corner_odds = 0.33;
    var local_fails = 0;
    var spot_tries = 0;
    
    var cx = 0;
    var cy = 0;
    has_door_coord = false;
//    ds_list_clear(local_open_ends);
    
    for(var i = 1; i < 50; i++)
    {
        spot_tries = 0;
        found_spot = false;
        
        // CHECK LIST FOR NEW DOOR COORDS
        if ds_list_empty(open_ends)
        && ds_list_empty(local_open_ends)
        {
            return false;
        }
        else if has_door_coord == false
        {
            // ODDS: START AT RANDOM OPEN END
            if !ds_list_empty(local_open_ends) 
            {
                if !ds_list_empty(open_ends)
                && random(1) < new_open_end_odds
                {
                    ds_list_clear(local_open_ends);
                    list = open_ends;
                }
                else
                {
                    list = local_open_ends; 
                }
                has_door_coord = true;
            } 
            else 
            {
                list = open_ends;
            }
            
            // NEW DOOR COORD
            rdoor = irandom(ds_list_size(list)-1)
            door_at = list[| rdoor];
            
            do_door_x = door_at[0];
            do_door_y = door_at[1];
            
            // IF COORD NOT VOID, DELETE AND PICK NEW
            if grid[#do_door_x-1, do_door_y-1] != mapcode.void
            {
                ds_list_delete(list, rdoor);
                rdoor = irandom(ds_list_size(list)-1)
                door_at = list[| rdoor];
                continue;
            }
        }
        
        {
            // TRY DIFFERENT SHAPES AND SIZES
            repeat(10)
            {
                // SIZE OF ROOM
                width = irandom_range(5, maxwidth);
                height = irandom_range(5, maxheight);
                
                if width*height > maxwidth * (maxheight-2) { continue; }
                
                var randomizer = irandom(3);
                // DOOR SPOT
                for (var j = 0; j <= 3; j++)
                {
                    switch (j + randomizer) mod 4
                    {
                        //DOOR ON HORIZONTAL SIDE TOWARDS DOWN
                        case 0:
                        door_x = irandom_range(2, width-2);
                        door_y = 0;
                        break;
                        
                        //DOOR ON HORIZONTAL SIDE - TOWARDS UP
                        case 1:
                        door_x = irandom_range(2, width-2);
                        door_y = height;
                        break;
                        
                        // DOOR ON VERTICAL SIDE - TOWARDS RIGHT
                        case 2:
                        door_x = 0;
                        door_y = irandom_range(2, height-2);
                        break;
                        
                        // DOOR ON VERTICAL SIDE - TOWARDS LEFT
                        case 3:
                        door_x = width;
                        door_y = irandom_range(2, height-2);
                        break;
                    }
            
                    // ROOM GRID COORDS
                    x1 = do_door_x - (door_x);
                    y1 = do_door_y - (door_y);
                    x2 = x1+(width);
                    y2 = y1+(height);
                    
                    if !inside_grid(grid, x1, y1)
                    || !inside_grid(grid, x2, y2)
                    {
                        local_fails++;
                        continue;
                    }
                        
                    // CHECK IF FREE
                    if !splice
                    {
                        spot_tries++;
                        
                        if ds_grid_get_mean(grid, x1-1, y1-1, x2-1, y2-1) != mapcode.void
                        {
                            local_fails++;
                            continue;
                        }
                        else
                        {
                            found_spot = true;
                            break;
                        }
                    }
                }
                
                // FOUND SPOT?
                if found_spot 
                {
//                    ds_list_delete(list, ds_list_find_index(list, door_at));            
                    break;
                }
            }
            
            // FOUND SPOT?
            if !found_spot 
            {
                local_fails++;
                has_door_coord = false;
//                ds_list_delete(list, ds_list_find_index(list, door_at));            
                continue;
            }
            else
            {
                // PUNCH DOOR IN
                grid[#do_door_x-1,do_door_y-1] = mapcode.door;
                
                
                // STORE DOOR COORD
                var room_map = ds_map_create();
                
                ds_map_add(room_map, "door x", do_door_x);
                ds_map_add(room_map, "door y", do_door_y);
                ds_map_add(room_map, "x1", x1);
                ds_map_add(room_map, "y1", y1);
                ds_map_add(room_map, "x2", x2);
                ds_map_add(room_map, "y2", y2);
                
                var pos = array_create(1);
                pos[0] = do_door_x;
                pos[1] = do_door_y;
                ds_list_add(door_list, pos);
                
                // STORE MID COORDS
                mid_x = x1 + ((width-1) / 2);
                mid_y = y1 + ((height-1) / 2);
                ds_map_add(room_map, "mid x", mid_x);
                ds_map_add(room_map, "mid y", mid_y);
                
                room_mid = array_create(1);
                
                room_mid[0] = mid_x;
                room_mid[1] = mid_y;
                
                ds_list_add(room_mid_list, room_mid);
                ds_list_add(room_map_list, room_map);
                
                // ROUGH DIR
                dir = round(point_direction(do_door_x, do_door_y, mid_x, mid_y) / 90);
                
                // SWITCH ROOM STYLE
                var room_type = weighted_random(1,1,15,15,75,75);
                switch room_type
                {
                    // STANDARD ONE ===== ===== ===== ===== ===== =====
                    case 0:
                    ds_grid_set_region(grid, x1, y1, x2-2, y2-2, mapcode.ground);
                    xx = x1 + ((width-1) div 2);
                    yy = y1 + ((height-1) div 2);
                    dir += irandom_range(-1, 1);
                    
                    // WALL CORNERS?
                    if random(1) < corner_odds
                    {
                        grid[#x1, y1] = mapcode.wall;
                        grid[#x2-2, y2-2] = mapcode.wall;
                        grid[#x1, y2-2] = mapcode.wall;
                        grid[#x2-2, y1] = mapcode.wall;
                    }
                    
                    break;
                    
                    // THE MOATED ONE ===== ===== ===== ===== ===== =====
                    case 1:
                    ds_grid_set_region(grid, x1, y1, x2-2, y2-2, mapcode.hole);
                    ds_grid_set_region(grid, x1+1, y1+1, x2-3, y2-3, mapcode.ground);
                    xx = x1 + ((width-1) div 2);
                    yy = y1 + ((height-1) div 2);
                    dir += irandom_range(-1, 1);
                    
                    // WALL CORNERS?
                    if random(1) < corner_odds
                    {
                        grid[#x1, y1] = mapcode.wall;
                        grid[#x2-2, y2-2] = mapcode.wall;
                        grid[#x1, y2-2] = mapcode.wall;
                        grid[#x2-2, y1] = mapcode.wall;
                    }
                    
                    break;
                    
                    // INVERTED MOAT & CHAOS ===== ===== ===== ===== ===== =====
                    case 2:
                    ds_grid_set_region(grid, x1, y1, x2-2, y2-2, mapcode.ground);
                    ds_grid_set_region(grid, x1+1, y1+1, x2-3, y2-3, mapcode.hole);
                    
/*                    if width*height > 6*6
                    {
                        repeat(irandom_range(1, 3))
                        {
                            xx = irandom_range(x1+1, x2-1);
                            yy = irandom_range(y1+1, y2-1);
                            
                            tiles_convert_area(grid, xx-irandom(1), yy-irandom(1), xx+irandom(1), yy+irandom(1), mapcode.hole, mapcode.ground);
                        }
                    }*/
                    
                    dir += irandom_range(-1, 1);
                    
                    break;
                    
                    // THE LONE ISLAND ===== ===== ===== ===== ===== =====
                    case 3:
                    ds_grid_set_region(grid, x1, y1, x2-2, y2-2, mapcode.hole);
                    tiles_convert_area(grid, mid_x-1, mid_y-1, mid_x+1, mid_y+1, mapcode.hole, mapcode.ground);
                    break;
                    
                    // THE TWO ISLANDS ===== ===== ===== ===== ===== =====
                    case 4:
                    ds_grid_set_region(grid, x1, y1, x2-2, y2-2, mapcode.hole);
                    
                    cx = do_door_x + lengthdir_x(1, dir);
                    cy = do_door_y + lengthdir_y(1, dir);
                    
                    var island_x = do_door_x;
                    var island_y = do_door_y;
                    
                    var pos = tunnel_type_until(grid, cx, cy, dir, mapcode.hole, mapcode.walkway, 1, 100, random_range(0.1, 0.9));
                    
                    ds_list_add(local_open_ends, pos);
                    
                    has_door_coord = true;
                    
                    tiles_convert_area(grid, do_door_x-1, do_door_y-1, do_door_x+1, do_door_y+1, mapcode.hole, mapcode.ground);
                    tiles_convert_area(grid, island_x-1, island_y-1, island_x+1, island_y+1, mapcode.hole, mapcode.ground);
                    
                    break;
                    
                    // THE LONE ISLAND ===== ===== ===== ===== ===== =====
                    case 5:
                    ds_grid_set_region(grid, x1, y1, x2-2, y2-2, mapcode.hole);
                    
                    var pos = tunnel_type_until(grid, do_door_x, do_door_y, dir, mapcode.hole, mapcode.ground, 1, min(width-1, height-1), 0);
                    
                    cx = pos[0];
                    cy = pos[1];
                    
                    dir += irandom_range(-1, 1);
                    
                    var pos = tunnel_type_until(grid, do_door_x, do_door_y, dir, mapcode.hole, mapcode.ground, 3, min(width-1, height-1), 0);
                    
                    do_door_x = pos[0];
                    do_door_y = pos[1];
                    
                    tiles_convert_area(grid, cx-1, cy-1, cx+1, cy+1, mapcode.hole, mapcode.ground);
//                    tiles_convert_area(grid, do_door_x-1, do_door_y-1, do_door_x+1, do_door_y+1, mapcode.hole, mapcode.ground);
                    
                    break;
                }
                
                // ROOMS PLACED
                rooms_placed++;
                
                random_door_coord(grid, x1, y1, x2, y2, 2, local_open_ends);
                
/*                var randomizer = irandom(3);
                // DOOR OUT SPOT
                for (var j = 0; j <= 3; j++)
                {
                    switch (j + randomizer) mod 4
                    {
                        //DOOR ON HORIZONTAL SIDE
                        case 0:
                        door_out_x = x1 + irandom_range(2, width-2);
                        door_out_y = y1;
                        
                        if door_out_y == do_door_y
                        {
                            continue;
                        }
                        else
                        {
                            var pos = array_create(1);
                            
                            pos[0] = door_out_x;
                            pos[1] = door_out_y;
                            
                            ds_list_add(local_open_ends, pos);
                            break;
                        }
                        
                        //DOOR ON HORIZONTAL SIDE
                        case 1:
                        door_out_x = x1 + irandom_range(2, width-2);
                        door_out_y = y1 + height;
                        
                        if door_out_y == do_door_y
                        {
                            continue;
                        }
                        else
                        {
                            var pos = array_create(1);
                            
                            pos[0] = door_out_x;
                            pos[1] = door_out_y;
                            
                            ds_list_add(local_open_ends, pos);
                            break;
                        }
                        
                        // DOOR ON VERTICAL SIDE
                        case 2:
                        door_out_x = x1;
                        door_out_y = y1 + irandom_range(2, height-2);
                        
                        if door_out_x == do_door_x
                        {
                            continue;
                        }
                        else
                        {
                            var pos = array_create(1);
                            
                            pos[0] = door_out_x;
                            pos[1] = door_out_y;
                            
                            ds_list_add(local_open_ends, pos);
                            break;
                        }
                        
                        // DOOR ON VERTICAL SIDE
                        case 3:
                        door_out_x = x1 + width;
                        door_out_y = y1 + irandom_range(2, height-2);
                        
                        if door_out_x == do_door_x
                        {
                            continue;
                        }
                        else
                        {
                            var pos = array_create(1);
                            
                            pos[0] = door_out_x;
                            pos[1] = door_out_y;
                            
                            ds_list_add(local_open_ends, pos);
                            break;
                        }
                    }
                }*/
                
                if room_type == 4
                {
                    tiles_convert_area(grid, do_door_x-1, do_door_y-1, do_door_x+1, do_door_y+1, mapcode.hole, mapcode.ground);
                }
                
                if !ds_list_empty(local_open_ends)
                {
//                    has_door_coord = true;
    //                continue;
                }
                
                // SUCCESS
                return true;
                
                //door_digger(grid, width, height);
            }
        }
    }
    
    return false
