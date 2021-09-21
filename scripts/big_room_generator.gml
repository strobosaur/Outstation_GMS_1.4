///big_room_generator(grid, x, y, rooms)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var rooms_max = argument3;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    var rooms_placed = 0;
    
    var start_x = xx;
    var start_y = yy;
    
    var door_x = 0;
    var door_y = 0;
    
    var door_x_out = 0;
    var door_y_out = 0;
    
//    var do_door_x = 0;
//    var do_door_y = 0;
    
    var outx = 0;
    var outy = 0;
    
    var x1 = 0;
    var y1 = 0;
    
    var local_fails = 0;
    
    var mirror_h = 0;
    var mirror_v = 0;
    
    var room_done = false;
    var found_spot = false;
    
    var open_end = 0;
    var dtypes = 0;
    var rdoor = 0;
    var door_at = 0;
    var make_door = 0;
    
    var room_map = 0;
    var whole_room_done = false;
    var passage = false;
    
    // ROOM & PASSAGE CHECK
    while (!whole_room_done)
    {
        // CLEAR DS
        ds_grid_clear(tempgrid, mapcode.void);
        
        ds_list_clear(local_open_ends);
        ds_list_clear(used_rooms);
        ds_list_clear(done_doors);
        
        // DOOR STORED FROM PASSAGE
        if ds_list_empty(big_room_open_ends) && !ds_list_empty(open_ends)
        {
            rdoor = irandom(ds_list_size(open_ends)-1);
            door_at = ds_list_find_value(open_ends, rdoor);
            
            do_door_x = door_at[0];
            do_door_y = door_at[1];
            
            ds_list_delete(big_room_open_ends, rdoor);
        }
        
        passage = false;
        room_done = false;
        
        // WHILE BIG ROOM NOT DONE
        while (!room_done)
        {
            found_spot = false;
            found_exit = false;
            
            //LOOK FOR ROOM IN POOL
            while (found_spot == false)
            {
                // DOOR STORED FROM PASSAGE
                if !ds_list_empty(big_room_open_ends)
                {
                    door_at = ds_list_find_value(big_room_open_ends, 0);
                    
                    do_door_x = door_at[0];
                    do_door_y = door_at[1];
                    
                    ds_list_delete(big_room_open_ends, 0);
                }
                else
                {
                    // FAIL TO FIND SPOT?
                    if local_fails > 50
                    {
                        // FAILED !!!
                        if ds_list_empty(local_open_ends) 
                        {
                            return false;
                        }
                        
                        //... OR SHUFFLE DOOR LIST
                        ds_list_shuffle(local_open_ends);
                        var newdoor = ds_list_find_value(local_open_ends, 0);
                        do_door_x = newdoor[0];
                        do_door_y = newdoor[1];
                        ds_list_delete(local_open_ends, 0);
                        
                        local_fails = 0;
                    }
                    // START AT RANDOM DOOR
                    else if random(1) < 1
                    && !ds_list_empty(local_open_ends)
                    && ds_list_empty(big_room_open_ends)
                    {
                        var pos = find_closest_coord(tempgrid, start_x, start_y, local_open_ends);
                        ds_list_shuffle(local_open_ends);
                        
                        do_door_x = pos[0];
                        do_door_y = pos[1];
                        
                        ds_list_delete(local_open_ends, 0);
                    }
                }
                
                // GET ROOM MAP
                ds_list_shuffle(room_pool);
                room_map = ds_list_find_value(room_pool, 0);
                
                // CHECK IF ROOM ALREADY USED
                while (ds_list_find_index(used_rooms, room_map) != -1)
                {
                    // GET ROOM MAP
                    ds_list_shuffle(room_pool);
                    room_map = ds_list_find_value(room_pool, 0);
                }
                
                // MIRROR DIR?
//                mirror_h = irandom(1);
//                mirror_v = irandom(1);
                
                // ROOM GRID
                room_grid = room_map[?"grid"];
                
                // ROOM MAP VARIABLES
                roomw = room_map[?"width"]
                roomh = room_map[?"height"]
                
                var rm_grid = ds_grid_create(roomw, roomh);
                ds_grid_copy(rm_grid, room_grid);
                
                door_at = room_map[?"door array"]
                dtypes = room_map[?"choices"]
                rdoor = irandom(dtypes);
                
                // MIRRORED HOR / VERT?
                if mirror_h || mirror_v
                {
                    ds_grid_mirror(rm_grid, mirror_h, mirror_v);
                }
                
                // CHECK DOOR CONFIGS
                for (var j = 0; j <= dtypes; j++)
                {
                    door_x = abs((mirror_h * (roomw-1)) - (door_at[(rdoor+j) mod (dtypes+1), 0]));
                    door_y = abs((mirror_v * (roomh-1)) - (door_at[(rdoor+j) mod (dtypes+1), 1]));
                    
                    x1 = do_door_x - door_x;
                    y1 = do_door_y - door_y;
                    
                    // SPOT IS ONLY VOID?
                    var is_empty = (ds_grid_get_min(grid, x1-1 + 1, y1-1 + 1, x1-1 + roomw-1 - 1, y1-1 + roomh-1 - 1) == mapcode.void) 
                    && (ds_grid_get_min(tempgrid, x1-1 + 1, y1-1 + 1, x1-1 + roomw-1 - 1, y1-1 + roomh-1 - 1) == mapcode.void);
                    // NO GROUND IN MID?
                    var is_free = (!ds_grid_value_exists(grid, x1-1, y1-1, x1-1 + roomw-1, y1-1 + roomh-1, mapcode.ground)) 
                    && (!ds_grid_value_exists(tempgrid, x1-1, y1-1, x1-1 + roomw-1, y1-1 + roomh-1, mapcode.ground));
                    // IS INSIDE GRID?
                    var is_inside = room_inside_grid(tempgrid, x1, y1, room_grid)
                    
                    // CHECK GRID FREE
                    if is_empty && is_free && is_inside
                    {
                        // FOUND SPOT FOR ROOM
                        found_spot = true;
                
                        // ADD ROOM TO USED LIST
                        ds_list_add(used_rooms, room_map);
                        
                        // NOT SAME AS ENTRANCE
                        var k = irandom(dtypes);
                        while k == j { k = irandom(dtypes);}
                        
                        door_x_out = door_at[k, 0];
                        door_y_out = door_at[k, 1];
                        
                        // NEW EXIT CELL
                        outx = x1 + door_x_out;
                        outy = y1 + door_y_out;
                       
                        // STOP LOOP 
                        break;
                    }
                    else
                    {                    
                        // FAIL
                        local_fails++;                    
                    }
                }
            }
            
            // COPY ROOM GRID UNTO LEVEL GRID
            ds_grid_set_grid_region(tempgrid, rm_grid, 0, 0, roomw-1, roomh-1, x1-1, y1-1);
            rooms_placed++;
            
            // CHECK RANDOM CELLS
            find_random_cells(tempgrid, x1, y1, x1+roomw-1, y1+roomh-1);
            
            // ADD DOOR COORDS TO LIST
            for (var i = 0; i <= dtypes; i++)
            {
                var dx = abs((mirror_h * (roomw-1)) - door_at[i, 0]);
                var dy = abs((mirror_v * (roomh-1)) - door_at[i, 1]);
                
                if (dx == door_x && dy == door_y)
                || (dx == door_x_out && dy == door_y_out)
                {
                    continue;
                }
                else
                {
                    open_end = array_create(0);
                    open_end[0] = x1 + dx;
                    open_end[1] = y1 + dy;
                    
                    ds_list_add(local_open_ends, open_end);
                }
            }
            
            // PLACE DOOR IN OLD SLOT
            make_door = array_create(0);
            
            make_door[0] = do_door_x;
            make_door[1] = do_door_y;
            
            ds_list_add(done_doors, make_door);
            
            tempgrid[# do_door_x-1, do_door_y-1] = mapcode.door;
                
            // UPDATE DO DOOR COORDS
            do_door_x = outx;
            do_door_y = outy;
            
            found_spot = false;
            found_exit = false;
            
            local_fails = 0;
            
            // CHECK IF ROOMS PLACED
            if rooms_placed >= rooms_max
            {
                room_done = true;
            }
        }
            
        // PLACE DOOR IN OLD SLOT
        tempgrid[# do_door_x-1, do_door_y-1] = mapcode.door;
        
        make_door = array_create(0);
        
        make_door[0] = do_door_x;
        make_door[1] = do_door_y;
        
        ds_list_add(done_doors, make_door);
        
        // PICK FARTHEST EXIT
    //    var main_end = find_furthest_coord(tempgrid, start_x, start_y, local_open_ends);
    //    ds_list_add(main_ends, main_end);
        
        // MAKE GROUND BEFORE / AFTER DOORS
//        for (var i = 1; i < gridw; i++)
        {
//            for (var j = 1; j < gridh; j++)
            {
                // MAKE DOORS
                while (!ds_list_empty(done_doors))
                {
                    make_door = ds_list_find_value(done_doors, 0);
                    
                    var i = make_door[0];
                    var j = make_door[1];
                    
                    ds_list_delete(done_doors, 0);
                    
                    // IF DOOR FOUND
                    if tempgrid[# i-1, j-1] == mapcode.door
                    {
                        make_ground_for_door(tempgrid, i, j);
                    }
                }
            }
        }
        
        // MAKE PASSAGE TO NEXT ROOM
        if door_find_dir(tempgrid, do_door_x, do_door_y, local_open_ends) == true
        {
            passage = true
        }
        else
        {
            // TRY OPEN END
            if !ds_list_empty(open_ends)
            {
                var new_door = irandom(ds_list_size(open_ends)-1);
                var pos = ds_list_find_value(open_ends, new_door);
                ds_list_add(big_room_open_ends, pos);
                ds_list_delete(open_ends, new_door);
                
                do_door_x = pos[0];
                do_door_y = pos[1];
            }
            else
            {
                return false;
            }
        }
        
        // FINAL DONE!!!
        if (passage == true && room_done == true)
        {
            whole_room_done = true;
        }
    }
        
    // TRANSFER OPEN ENDS
    while(!ds_list_empty(local_open_ends))
    {
        ds_list_add(open_ends, ds_list_find_value(local_open_ends, 0))
        ds_list_delete(local_open_ends, 0);
    }
    
    // TRANSFER TO GRID
    for (var i = 1; i < gridw; i++)
    {
        for (var j = 1; j < gridh; j++)
        {
            var thiscell = tempgrid[# i-1, j-1];
            if thiscell != mapcode.void
            {
                grid[# i-1, j-1] = thiscell;
            }
        }
    }
    
    return true;
