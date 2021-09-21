///edge_tile_finder(grid, cell type, look for, mark as);

    // INPUT
    
    var grid = argument0;
    var trig = argument1;
    var trig2 = argument2
    var marked = argument3;
    
    // LOCAL    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // LOOP
    var n = 0;
    
    for(var cx = 1; cx < gw-1; cx++){
        for(var cy = 1; cy < gh-1; cy++){
        
        if grid[# cx, cy] == trig
        {
/*            if grid[# cx + 1, cy] == trig2 || grid[# cx - 1, cy] == trig2 || grid[# cx, cy + 1] == trig2 || grid[# cx, cy - 1] == trig2
            {
                grid[# cx, cy] = marked;   
            }*/
            if cellR1(grid, cx, cy, trig2, false) > 0
            {
                grid[# cx-1, cy-1] = marked;
            }
        }
    }
}
