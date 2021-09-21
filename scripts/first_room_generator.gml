///first_room_generator(grid)

    var grid = argument0;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    var xx = 0;
    var yy = 0;
    
    var dir = random(360)
    var from_dir = dir;
    
    var midx = gridw div 2;
    var midy = gridh div 2;
    
    ds_grid_clear(grid, mapcode.void);
    ds_grid_clear(tempgrid, mapcode.void);
    ds_list_clear(open_ends);
    
    xx = round(rnd(gridw div 2, gridw div 4));
    yy = round(rnd(gridh div 2, gridh div 4));
    
    // FIND MAP EDGE
    while (inside_grid(grid, round(xx), round(yy)))
    {
        xx += lengthdir_x(1, dir);
        yy += lengthdir_y(1, dir);
    }
    // START POS
    var start_x = clamp(round(xx), 1, gridw);
    var start_y = clamp(round(yy), 1, gridh);
    
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
        dir = i;
    
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
    
    

