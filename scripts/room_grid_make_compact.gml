///room_grid_make_compact(room grid, void cell);

    var grid = argument0;
    var type = argument1;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    var tempgrid = ds_grid_create(gridw, gridh);
    
    var x1 = gridw;
    var y1 = gridh;
    var x2 = 1;
    var y2 = 1;
    
    // PARSE GRID
    for (var xx = 1; xx <= gridw; xx++)
    {    
        for (var yy = 1; yy <= gridw; yy++)
        {
            // FIND OUTER COORDS
            if grid[# xx-1, yy-1] == type
            {
                if xx < x1 { x1 = xx; }
                if yy < y1 { y1 = yy; }
                if xx > x2 { x2 = xx; }
                if yy > y2 { y2 = yy; }
            }
        }
    }
    
    ds_grid_set_grid_region(tempgrid, grid, x1-1, y1-1, x2-1, y2-1, 1, 1);
    
    ds_grid_copy(grid, tempgrid);
    
    // CLEANUP
    ds_grid_destroy(tempgrid);
    
    
