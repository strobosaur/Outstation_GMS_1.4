///level_generator2(grid)

    var grid = argument0;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    counter = 0;
    dir = irandom(3);
    
//    var tempgrid = ds_grid_create(gridw, gridh);
//    var markgrid = ds_grid_create(gridw, gridh);
    
    ds_grid_clear(grid, mapcode.void);
    
    room_map_list = ds_list_create();
    room_mid_list = ds_list_create();
    door_list = ds_list_create();
    open_ends = ds_list_create();    
    local_open_ends = ds_list_create();
    
    do_door_x = 0;
    do_door_y = 0;
    done_door_x = 0;
    done_door_y = 0;
    
    var midx = gridw div 2;
    var midy = gridh div 2;
    
    var fails, tries, rooms_done;
    
    rooms_placed = 0;
    
    ds_grid_set_region(grid,midx-3-1, 1-1, midx+3-1, gridh-1, mapcode.hole);
    
    ds_grid_set_region(grid, midx-1-1, midy-1-1, midx+1-1, midy+1-1, mapcode.ground);
    ds_grid_set_region(grid, midx-4-1, midy-2-1, midx-2-1, midy+2-1, mapcode.ground);
    ds_grid_set_region(grid, midx+2-1, midy-2-1, midx+4-1, midy+2-1, mapcode.ground);
    
    ds_grid_set_region(grid, midx-3-1, midy-1-1, midx-3-1, midy+1-1, mapcode.void)
    ds_grid_set_region(grid, midx+3-1, midy-1-1, midx+3-1, midy+1-1, mapcode.void)
    
    // ANTECHAMBERS WEST
    ds_grid_set_region(grid, midx-8-1, midy-1-1, midx-6-1, midy+1-1, mapcode.ground);
    ds_grid_set_region(grid, midx-8-1, midy-5-1, midx-6-1, midy-3-1, mapcode.ground);
    ds_grid_set_region(grid, midx-8-1, midy+3-1, midx-6-1, midy+5-1, mapcode.ground);
    
    // ANTECHAMBERS EAST
    ds_grid_set_region(grid, midx+6-1, midy-1-1, midx+8-1, midy+1-1, mapcode.ground);
    ds_grid_set_region(grid, midx+6-1, midy-5-1, midx+8-1, midy-3-1, mapcode.ground);
    ds_grid_set_region(grid, midx+6-1, midy+3-1, midx+8-1, midy+5-1, mapcode.ground);
    
    ds_grid_set_region(grid, midx-15-1, midy-2-1, midx-10-1, midy+2-1, mapcode.hole);
    ds_grid_set_region(grid, midx-14-1, midy-1-1, midx-12-1, midy+1-1, mapcode.ground);
    
    ds_grid_set_region(grid, midx+11-1, midy-2-1, midx+15-1, midy+2-1, mapcode.hole);
    ds_grid_set_region(grid, midx+12-1, midy-1-1, midx+14-1, midy+1-1, mapcode.ground);
    
    ds_grid_set_region(grid, midx-11-1, midy-1, midx+11-1, midy-1, mapcode.ground);
    
    ds_grid_set_region(grid, midx-7-1, midy-2-1, midx-7-1, midy+2-1, mapcode.ground);
    
    ds_grid_set_region(grid, midx+7-1, midy-2-1, midx+7-1, midy+2-1, mapcode.ground);
    
    grid[# midx-7-1, midy-1] = mapcode.hole;
    grid[# midx+7-1, midy-1] = mapcode.hole;
//    grid[# midx-9-1, midy] = mapcode.start_door;
                
    start_door = array_create(2);
    start_door[0] = midx-9;
    start_door[1] = midy;
    start_door[2] = false;
    
    global.start_x = midx-1;
    global.start_y = midy-1;
    
    global.start_x1 = midx-13-1;
    global.start_y1 = midy-1;
    
    global.start_x2 = midx+13-1;
    global.start_y2 = midy-1;
    
    global.start_x = global.start_x1;
    global.start_y = global.start_y1;
    
    var room_side = 8;
    // ROOM PLACER
    rooms_done = false;
    rooms_placed = 0;
    fails = 0;
    
    // FRIENDLY SIDE
    while rooms_done == false//rooms_placed < 10
    {
        rooms_placed = 0
        
        // VERTICAL DOORS TOP
        var pos = array_create(1);
        pos[0] = midx - 7;
        pos[1] = midy - 6;
        ds_list_add(open_ends, pos);
        
        // HORIZONTAL DOORS TOP
        var pos = array_create(1);
        pos[0] = midx - 9;
        pos[1] = midy - 4;
        ds_list_add(open_ends, pos);
        
        do
        {
            if make_room2(grid, room_side, room_side, false) == true
            {
                fails = 0;
            }
            else
            {
                fails++;
            }
        }
        until fails >= 100//rooms_placed >= 10
        if fails >= 100 
        { 
            rooms_done = true; 
        }
    }
    
    // ROOM PLACER
    ds_list_clear(open_ends);
    ds_list_clear(local_open_ends);
    rooms_done = false;
    rooms_placed = 0;
    fails = 0;
    
    // ENEMY SIDE
    while rooms_done == false//rooms_placed < 10
    {
        rooms_placed = 0
        
        // VERT DOOR BOTTOM
        var pos = array_create(1);
        pos[0] = midx - 7;
        pos[1] = midy + 6;
        ds_list_add(open_ends, pos);
        
        // HORIZONTAL DOORS BOTTOM
        var pos = array_create(1);
        pos[0] = midx - 9;
        pos[1] = midy + 4;
        ds_list_add(open_ends, pos);
        
        do
        {
            if make_room2(grid, room_side, room_side, false) == true
            {
                fails = 0;
            }
            else
            {
                fails++;
            }
        }
        until fails >= 100//rooms_placed >= 10
        if fails >= 100 
        { 
            rooms_done = true; 
        }
    }
    
    make_ground_for_door2(grid);
