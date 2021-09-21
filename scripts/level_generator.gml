///level_generator(grid, rooms, tunnel max)

    var grid = argument0;
    
    var level_done = false;
    var rooms_placed = 0;
    ds_grid_clear(grid, mapcode.void);
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    // GRIDS
    tempgrid = ds_grid_create(gridw, gridh);
    ds_grid_clear(tempgrid, 0);
    
    // OPEN ENDS LIST
    used_rooms = ds_list_create();
    open_ends = ds_list_create();
    local_open_ends = ds_list_create();
    big_room_open_ends = ds_list_create();
    passage_open_ends = ds_list_create();
    done_doors = ds_list_create();
    
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
    var big_fails = 0;
    
    rooms_in_place = 0;
    
/*    dir = random(360)
    from_dir = dir;
    
//    xx = round(rnd(gridw div 2, gridw div 4));
//    yy = round(rnd(gridh div 2, gridh div 4));
    
    // FIND MAP EDGE
    while (inside_grid(grid, round(xx), round(yy)))
    {
        xx += lengthdir_x(1, dir);
        yy += lengthdir_y(1, dir);
    }
    // START POS
    start_x = clamp(round(xx), 1, gridw);
    start_y = clamp(round(yy), 1, gridh);
    
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
    for (var i = 0; i <= 3; i++)
    {
        dir = i// startdir// + i;
    
        // FIND NEXT WALL
        var pos = array_create(0);
        pos = dir_find_tile(grid, room_mid_x, room_mid_y, dir, mapcode.wall);
        ds_list_add(open_ends, pos);
    }
    
    // DIR TO MID
    dir = round(point_direction(room_mid_x, room_mid_y, midx, midy) / 90) mod 4;
    
    pos = dir_find_tile(grid, room_mid_x, room_mid_y, dir, mapcode.wall);
    
    do_door_x = pos[0];
    do_door_y = pos[1];*/
    
//    ds_grid_set(markgrid, do_door_x-1, do_door_y-1, 10);
    
//    grid[#pos[0],pos[1]] = mapcode.door;

    // ===== ===== ===== ===== ===== =====
    //LOOP UNTIL ALL ROOMS PLACED
    var big_level_done = false;
    while (big_level_done == false)
    {
        grid_debug = true;
        rooms_in_place = 0;
        big_fails = 0;
        // MAIN ROOM
        var main_room = false;
        do
        {
            // FIRST ROOM
            first_room_generator(grid);
            // GENERATE
            if big_room_generator(grid, do_door_x, do_door_y, 3) == false
            {
                big_fails++;
            }
            else
            {
                main_room = true;
                big_fails = 0;
                rooms_in_place++;
            }
            
            // BIG FAIL
            if big_fails >= 15
            {
                
                ds_grid_clear(tempgrid, mapcode.void);
                ds_grid_clear(grid, mapcode.void);
                ds_list_clear(open_ends);
            }
        }
        until (main_room == true)
    
        // NORMAL ROOMS
        do
        {
            // GENERATE
            if big_room_generator(grid, do_door_x, do_door_y, irandom(2)+1) == false
            {
                big_fails++;
            }
            else
            {
                rooms_in_place++;
                big_fails = 0;
            }
            
            // BIG FAIL
            if big_fails >= 15
            {
                ds_grid_clear(tempgrid, mapcode.void);
                ds_list_clear(open_ends);
                ds_list_clear(big_room_open_ends);
            }
        }
        until (rooms_in_place >= 4);
        
        // FINAL CHECK!!!
        if main_room == true && rooms_in_place >= 4
        {
            big_level_done = true;
        }
    }
    
    // CLEANUP
    ds_grid_destroy(tempgrid);
    ds_list_destroy(used_rooms);
    ds_list_destroy(open_ends);
    ds_list_destroy(local_open_ends);
    ds_list_destroy(passage_open_ends);
    ds_list_destroy(big_room_open_ends);
    ds_list_destroy(done_doors);
