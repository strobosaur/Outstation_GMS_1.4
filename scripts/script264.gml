///level_generator(grid, rooms, tunnel max, first room t/f, find_edge t/f)

    var grid = argument0;
    var tunnel_max = argument1;
    var first_room = argument2;
    var find_edge = argument3;
    
    var level_done = false;
    var rooms_placed = 0;
    ds_grid_clear(grid, mapcode.void);
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    // GRIDS
    markgrid = ds_grid_create(gridw, gridh);
    ds_grid_clear(markgrid, -1);
    room_marker = ds_grid_create(gridw, gridh);
    ds_grid_clear(room_marker, 0);
    tempgrid = ds_grid_create(gridw, gridh);
    ds_grid_clear(tempgrid, 0);
    
    // OPEN ENDS LIST
    used_rooms = ds_list_create();
    open_ends = ds_list_create();
    local_open_ends = ds_list_create();
    main_ends = ds_list_create();
    
    var midx = gridw div 2;
    var midy = gridh div 2;
    
    var roomw = 0;
    var roomh = 0;
    
    var rooms_max = argument1;
    var tunnel_max = argument2;
    
    var side = 3;
    var chunksize = 5;
    var dir = 0;
    var len = 0;
    
    var start_x = 0;
    var start_y = 0;
    
    var xx = 0;
    var yy = 0;
    
    var x1 = 0;
    var y1 = 0;
    
    var cx = xx;
    var cy = yy;
    
    do_door_x = 0;
    do_door_y = 0;
    
    var room_mid_x = 0;
    var room_mid_y = 0;
    
    var door_x = 0;
    var door_y = 0;
    var door_x_out = 0;
    var door_y_out = 0;
    var door_at = 0;
    
    var inx = 0;
    var iny = 0;
    var outx = 0;
    var outy = 0;
    
    var found_spot = false;
    var found_exit = false;
    
    var doornr = 0;
    var dtypes = 0;
    var rdoor = 0;
    
    var mirror_h = false;
    var mirror_v = false;
    
    var new_doorcell = false;
    var fails = 0;
    
    dir = random(360)
    from_dir = dir;
    
//    xx = gridw div 2 + irandom(8);
//    yy = gridh div 2 + irandom(8);
    
    // FIND MAP EDGE
    if first_room == true
    {
        if find_edge == true
        {
            while (inside_grid(grid, round(xx), round(yy)))
            {
                xx += lengthdir_x(1, dir);
                yy += lengthdir_y(1, dir);
            }
        }
        else
        {
            xx = round(rnd(gridw div 2, gridw div 4));
            yy = round(rnd(gridh div 2, gridh div 4));
        }
    
        // START ROOM
        var room_grid = ds_grid_create(7, 7);
        ds_grid_set_region(room_grid, 0, 0, 6, 6, mapcode.wall);
        ds_grid_set_region(room_grid, 1, 1, 5, 5, mapcode.ground);
        room_grid[# 3, 3] = mapcode.room_center;
        
        roomw = ds_grid_width(room_grid);
        roomh = ds_grid_height(room_grid);
        
        // FIND CLOSEST SPOT
        var pos = -1
        var tries = 0;
        
        while (pos == -1)
        {
            tries++;
            pos = find_closest_room_fit(grid, start_x, start_y, room_grid);
        }
        
        // TRANSFER ROOM TO GRID
        ds_grid_set_grid_region(grid, room_grid, 0, 0, roomw-1, roomh-1, pos[0]-1, pos[1]-1);
        rooms_placed++;
        
        ds_grid_destroy(room_grid);
        
        // ROOM MID COORDS
        room_mid_x = pos[0] + 3;
        room_mid_y = pos[1] + 3;
        
        global.start_x = room_mid_x;
        global.start_y = room_mid_y
        
        var startdir = irandom(3);
        
        // MARK ALL 4 DIRECTIONS AS OPEN ENDS
        for (var i = 0; i <= 0; i++)
        {
            dir = startdir// + i;
        
            // FIND NEXT WALL
            var pos = array_create(0);
            pos = dir_find_tile(grid, room_mid_x, room_mid_y, dir, mapcode.wall);
            ds_list_add(open_ends, pos);
        }
        
        // DIR TO MID
        dir = round(point_direction(room_mid_x, room_mid_y, midx, midy) / 90) mod 4;
        
        pos = dir_find_tile(grid, room_mid_x, room_mid_y, dir, mapcode.wall);
        
        do_door_x = pos[0];
        do_door_y = pos[1];
    }
    
    // START POS
    start_x = clamp(round(xx), 1, gridw);
    start_y = clamp(round(yy), 1, gridh);
    
//    ds_grid_set(markgrid, do_door_x-1, do_door_y-1, 10);
    
//    grid[#pos[0],pos[1]] = mapcode.door;

    // ===== ===== ===== ===== ===== =====
    //LOOP UNTIL ALL ROOMS PLACED
    var big_level_done = false;
    while (big_level_done == false)
    {
        // MAIN ROOM
        var main_room = false;
        do
        {
            main_room = 
            big_room_generator(grid, do_door_x, do_door_y, 3) != -1 
//            && door_find_dir(grid, do_door_x, do_door_y) != -1;
        }
        until (main_room == true)
    
        var rooms = 0;
        do
        {
            rooms += big_room_generator(grid, do_door_x, do_door_y, irandom(1)+1)
//            && door_find_dir(grid, do_door_x, do_door_y) != -1;
        }
        until (rooms >= 3);
        
        if main_room == true && rooms >= 3
        {
            big_level_done = true;
        }
    }
        
//    for (var i = 0; i <= rooms_max; i++)
/*    while (level_done == false)
    {
        found_spot = false;
        found_exit = false;
        
        //LOOK FOR ROOM IN POOL
        while (found_spot == false)
        {
            // FAIL TO FIND SPOT?
            if fails > 50
            {
                if ds_list_empty(open_ends) {game_restart();}
                
                ds_list_shuffle(open_ends);
                var newdoor = ds_list_find_value(open_ends, 0);
                do_door_x = newdoor[0];
                do_door_y = newdoor[1];
                ds_list_delete(open_ends, 0);
                
                fails = 0;
            }
            // START AT RANDOM DOOR
            else if random(1) < 1 && !ds_list_empty(open_ends)
            {
                var pos = find_closest_coord(grid, global.start_x, global.start_y, open_ends);
                ds_list_shuffle(open_ends);
                
                do_door_x = pos[0];
                do_door_y = pos[1];
                
//                var newdoor = ds_list_find_value(open_ends, 0);
//                do_door_x = newdoor[0];
//                do_door_y = newdoor[1];
                ds_list_delete(open_ends, 0);
            }
            
            // GET ROOM MAP
            ds_list_shuffle(room_pool);
            // CHECK IF ROOM ALREADY USED
            while (ds_list_find_index(used_rooms, room_map) == -1)
            {
                room_map = ds_list_find_value(room_pool, 0);
            }
            // ADD ROOM TO USED LIST
            ds_list_add(used_rooms, room_map);
            
            // MIRROR DIR?
            mirror_h = irandom(1);
            mirror_v = irandom(1);
            
            // ROOM GRID
            room_grid = room_map[?"grid"];
            
            // ROOM MAP VARIABLES
            roomw = room_map[?"width"]
            roomh = room_map[?"height"]
            
            var tmpgrid = ds_grid_create(roomw, roomh);
            ds_grid_copy(tmpgrid, room_grid);
            
            door_at = room_map[?"door array"]
            dtypes = room_map[?"choices"]
            rdoor = irandom(dtypes);
            
            // MIRRORED HOR / VERT?
            if mirror_h || mirror_v
            {
                ds_grid_mirror(tmpgrid, mirror_h, mirror_v);
            }
            
            // CHECK DOOR CONFIGS
            for (var j = 0; j <= dtypes; j++)
            {
                door_x = abs((mirror_h * (roomw-1)) - (door_at[(rdoor+j) mod (dtypes+1), 0]));
                door_y = abs((mirror_v * (roomh-1)) - (door_at[(rdoor+j) mod (dtypes+1), 1]));
                
                x1 = do_door_x - door_x;
                y1 = do_door_y - door_y;
                
                var is_empty = (ds_grid_get_min(grid, x1-1 + 1, y1-1 + 1, x1-1 + roomw-1 - 1, y1-1 + roomh-1 - 1) == mapcode.void);
                var is_free = (!ds_grid_value_exists(grid, x1-1, y1-1, x1-1 + roomw-1, y1-1 + roomh-1, mapcode.ground));
                var is_inside = room_inside_grid(grid, x1, y1, room_grid)
                
                // CHECK GRID FREE
                if is_empty && is_free && is_inside
                {
                    // FOUND SPOT FOR ROOM
                    found_spot = true;
                    
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
                    fails++;                    
                }
            }
        }
        
        // COPY ROOM GRID UNTO LEVEL GRID
        ds_grid_set_grid_region(grid, tmpgrid, 0, 0, roomw-1, roomh-1, x1-1, y1-1);
        rooms_placed++;
        
        // CHECK RANDOM CELLS
        find_random_cells(grid, x1, y1, x1+roomw-1, y1+roomh-1);
        
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
                
                ds_list_add(open_ends, open_end);
            }
        }
        
        // PLACE DOOR IN OLD SLOT
        grid[# do_door_x-1, do_door_y-1] = mapcode.door;
            
        // UPDATE DO DOOR COORDS
        do_door_x = outx;
        do_door_y = outy;
        
        found_spot = false;
        found_exit = false;
        
        fails = 0;
        
        if rooms_placed >= rooms_max
        {
            level_done = true;
        }
    }
    
    // MAKE GROUND BEFORE / AFTER DOORS
    for (var i = 1; i < gridw; i++)
    {
        for (var j = 1; j < gridh; j++)
        {
            // IF DOOR FOUND
            if grid[# i-1, j-1] == mapcode.door
            {
                make_ground_for_door(grid, i, j);
            }
        }
    }*/
    
    // CLEANUP
    ds_grid_destroy(tempgrid);
    ds_list_destroy(used_rooms);
    ds_list_destroy(open_ends);
    ds_list_destroy(local_open_ends);
    ds_list_destroy(main_ends);
