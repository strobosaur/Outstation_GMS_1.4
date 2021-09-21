///remap_tiletype(grid, trigger, converto to)

    var grid = argument0;
    var trigger = argument1;
    var totype = argument2;
    
    var xx = 0;
    var yy = 0;
    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // LOOP
    
    for(var cx = 1; cx <= gw; cx++)
    {
        for(var cy = 1; cy <= gh; cy++)
        {
            if grid[# cx-1, cy-1] == trigger
            {
                grid[# cx-1, cy-1] = totype;
            }
        }
    }
