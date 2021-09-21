///tile_mapper(source grid, target grid, cell type, look for);

    // INPUT
    
    var grid = argument0;
    var grid2 = argument1;
    var trig = argument2;
    var trig2 = argument3;
    
    // LOCAL    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // LOOP
    var n = 0;
    
    for(var cx = 1; cx < gw-1; cx++){
        for(var cy = 1; cy < gh-1; cy++){
        
            var n = 0;
            
            if grid[# cx, cy] == trig && grid2[# cx, cy] == 0
            {
                if grid[# cx + 1, cy] == trig2 {n += 1; }
                if grid[# cx, cy + 1] == trig2 {n += 2; }
                if grid[# cx - 1, cy] == trig2 {n += 4; }
                if grid[# cx, cy - 1] == trig2 {n += 8; }
                
                grid2[# cx, cy] = n;
                
/*                if grid[# cx - 1, cy] == trig2 { grid2[# cx, cy] = tilemap.E; }
                if grid[# cx + 1, cy] == trig2 { grid2[# cx, cy] = tilemap.W; }
                if grid[# cx, cy - 1] == trig2 { grid2[# cx, cy] = tilemap.N; }
                if grid[# cx, cy + 1] == trig2 { grid2[# cx, cy] = tilemap.S; }
                
                if grid[# cx - 1, cy - 1] == trig2 { grid2[# cx, cy] = tilemap.NW; }
                if grid[# cx + 1, cy - 1] == trig2 { grid2[# cx, cy] = tilemap.NE; }
                if grid[# cx - 1, cy + 1] == trig2 { grid2[# cx, cy] = tilemap.SW; }
                if grid[# cx + 1, cy + 1] == trig2 { grid2[# cx, cy] = tilemap.SE; }*/
            }
        }
    }
