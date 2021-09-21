///lone_tile_cleaner(grid, cell type, n, runs);

    // INPUT    
    var grid = argument0;
    var trig = argument1;
    var cutoff = argument2;
    
    // LOCAL    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // LOOP
    var n = 0;
    repeat(argument3)
    {
        for(var cx = 1; cx < gw-1; cx++){
            for(var cy = 1; cy < gh-1; cy++){
            
                n = 0;
            
                if grid[# cx, cy] == trig
                {
                    if grid[# cx - 1, cy] == trig { n++; }
                    if grid[# cx + 1, cy] == trig { n++; }
                    if grid[# cx, cy - 1] == trig { n++; }
                    if grid[# cx, cy + 1] == trig { n++; }
                    
                    if n <= cutoff {grid[# cx, cy] = 0; }
                }
            }
        }
    }
