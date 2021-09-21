///tiles_wall_cleaner(grid)

    var grid = argument0;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    var n = 0;
    
    // PARSE GRID
    for (var i = 2; i <= gridw-2; i++)
    {
        for (var j = 2; j <= gridh-2; j++)
        {
            // RESET N COUNT
            n = 0;
            
            // 4 WAY CHECK FOR VOID / WALL
            if grid[# i-1, j-1] == mapcode.wall
            {
/*                if grid[# i-2, j-1] == mapcode.wall || grid[# i-2, j-1] == mapcode.void {n++;}
                if grid[# i, j-1] == mapcode.wall || grid[# i, j-1] == mapcode.void {n++;}
                if grid[# i-1, j-2] == mapcode.wall || grid[# i-1, j-2] == mapcode.void {n++;}
                if grid[# i-1, j] == mapcode.wall || grid[# i-1, j] == mapcode.void {n++;}*/
                
                n += cellR1(grid, i, j, mapcode.wall, true);
                n += cellR1(grid, i, j, mapcode.void, true);
                
                if n >= 8
                {
                    grid[# i-1, j-1] = mapcode.void;
                }
            }
        }
    }
