///bullet_grid_marker(grid, to grid, trigger)

    var grid = argument0;
    var togrid = argument1;
    var type = argument2;
    
    var xx = 0;
    var yy = 0;
    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // LOOP
    
    for(var cx = 1; cx <= gw-1; cx++)
    {
        for(var cy = 1; cy <= gh-1; cy++)
        {
            if grid[# cx-1, cy-1] == type
            {
                togrid[# cx-2, cy-2] = 1;
            }
        }
    }
