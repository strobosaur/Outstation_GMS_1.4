///mp_grid_marker(grid)

    var grid = argument0;
    
    var xx = 0;
    var yy = 0;
    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // LOOP
    
    for(var cx = 1; cx <= gw-1; cx++)
    {
        for(var cy = 1; cy <= gh-1; cy++)
        {
            if grid[# cx-1, cy-1] == mapcode.hole 
            || grid[# cx-1, cy-1] == mapcode.wall
            || grid[# cx-1, cy-1] == mapcode.void
            {
                mp_grid_add_cell(global.pathgrid, cx-1, cy-1);
            }
        }
    }
