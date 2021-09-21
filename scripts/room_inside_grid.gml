///room_inside_grid(fit into grid, x, y, room grid)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var room_grid = argument3;
    
    var grid_w = ds_grid_width(grid);
    var grid_h = ds_grid_height(grid);
    
    var room_w = ds_grid_width(room_grid);
    var room_h = ds_grid_height(room_grid);
    
    var ret = true;
    
    // ROOM BIGGER THAN GRID
    if grid_w < room_w ||grid_h < room_h {ret = false;}
    
    // X1
    if xx < 1 {ret = false;}
    if yy < 1 {ret = false;}
    if (xx + room_w-1) > grid_w {ret = false;}
    if (yy + room_h-1) > grid_h {ret = false;}
    
    return ret;
