///room_generator(grid, max width, max height, min cells, max cells)

/*    var grid = argument0;
    var max_w = argument1;
    var max_h = argument2;
    var min_chunks = argument3;
    var max_chunks = argument4;
    
    var side = 3;
    var chunksize = 5;
    
    var chunk_count = irandom_range(min_chunks, max_chunks);
    
    // TEMP GRID
    var tempgrid = ds_grid_create(max_chunks*5+2, max_chunks*5);
    ds_grid_clear(tempgrid, mapcode.wall);
    
    var gridw = ds_grid_width(tempgrid);
    var gridh = ds_grid_height(tempgrid);
    
    // MARK GRID
    var markgrid = ds_grid_create(gridw, gridh);
    ds_grid_clear(markgrid, mapcode.unmarked);
    
    ds_grid_set_region(tempgrid, 1, 1, gridw-2, gridh-2, mapcode.void);
    
    // LOCAL VARIABLES
    var x_chunk = 0;
    var y_chunk = 0;
    var entrance_x = 0;
    var entrance_y = 0;
    var door_x = 0;
    var door_y = 0;
    var bridge_x = 0;
    var bridge_y = 0;
    var cx = 0;
    var cy = 0;
    
    var floorsize = 0;
    
    // ENTRANCE ON EDGE OF GRID
    var vertical = irandom(1)
    if vertical == true
    {
        entrance_x = choose(0, gridw);
        
        y_chunk = irandom_range(1, max_chunks);
        entrance_y = (y_chunk*chunksize)-1 + irandom_range(1,3);
        
    }
    else
    {
        x_chunk = irandom_range(1, max_chunks);
        entrance_x = (x_chunk * chunksize)-1 + irandom_range(1,3);
        
        entrance_y = choose(0, gridh);
    }
    // MARK ENTRANCE
    tempgrid[# entrance_x-1, entrance_y-1] = mapcode.entrance;
    
    // START LOOP
    for (var i = 0; i < chunk_count; i++)
    {
        ds_grid_set_region(tempgrid,
