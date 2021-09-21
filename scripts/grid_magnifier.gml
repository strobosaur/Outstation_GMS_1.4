///grid_magnifier(from grid, to grid, factor)

    var grid = argument0;
    var togrid = argument1;
    var factor = argument2;
    
    var gridw1 = ds_grid_width(grid);
    var gridh1 = ds_grid_height(grid);
    
    var gridw2 = ds_grid_width(togrid);
    var gridh2 = ds_grid_height(togrid);
    
    for (var i = 1; i < gridw1; i++)
    {
        for (var j = 1; j < gridh1; j++)
        {
            var val = grid[# i-1,j-1]
            ds_grid_set_region(togrid, (i-1)*factor,(j-1)*factor,(i-1)*factor+factor,(j-1)*factor+factor, val);
        }
    }
