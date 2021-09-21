///corner_tile_finder(source grid, target grid, cell type, look for, mark as);

    // INPUT
    
    var grid = argument0;
    var grid2 = argument1;
    var trig = argument2;
    var trig2 = argument3;
    var marked = argument4;
    
    // LOCAL    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // LOOP
    var n = 0;
    
    for(var cx = 1; cx < gw-1; cx++){
        for(var cy = 1; cy < gh-1; cy++){
        
        if grid[# cx, cy] == trig
        {
            if grid[# cx - 1, cy] == trig2 { n++; }
            if grid[# cx + 1, cy] == trig2 { n++; }
            if grid[# cx, cy - 1] == trig2 { n++; }
            if grid[# cx, cy + 1] == trig2 { n++; }
            
            if n <= 0 
            {
                if grid[# cx - 1, cy - 1] == trig2 { grid2[# cx, cy] = 16 + tilemap.NW; }
                if grid[# cx + 1, cy - 1] == trig2 { grid2[# cx, cy] = 16 + tilemap.NE; }
                if grid[# cx - 1, cy + 1] == trig2 { grid2[# cx, cy] = 16 + tilemap.SW; }
                if grid[# cx + 1, cy + 1] == trig2 { grid2[# cx, cy] = 16 + tilemap.SE; }
            }
        }
    }
}
