///tiler_02(grid, tilegrid, cellsize, cell type, odds, tilesheet, std tiles x, std tiles y, depth);

    // INPUT
    
    var grid = argument0;
    var tilegrid = argument1;
    var cell = argument2;
    var trig = argument3;
    var odds = argument4;
    var sheet = argument5;
    var stdx = argument6;
    var stdy = argument7;
    var layerdepth = argument8;
    
    // LOCAL
    
    var w = (background_get_width(sheet) div cell) - 1;
    var h = (background_get_height(sheet) div cell) - 1;
    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    var wx = 0;
    var hx = 0;
    
    // LOOP
    
    for(var cx = 0; cx < gw; cx++){
        for(var cy = 0; cy < gh; cy++){
        
        if grid[# cx, cy] == trig
        {
            // TILE ROTATION
            if tilegrid[# cx, cy] == tilemap.NW {wx = 0; hx = 3; }
            if tilegrid[# cx, cy] == tilemap.SW {wx = 0; hx = 4; }
            if tilegrid[# cx, cy] == tilemap.SE {wx = 1; hx = 4; }
            if tilegrid[# cx, cy] == tilemap.NE {wx = 1; hx = 3; }
            
            if tilegrid[# cx, cy] == tilemap.S {wx = 1; hx = 0; }
            if tilegrid[# cx, cy] == tilemap.E {wx = 0; hx = 1; }
            if tilegrid[# cx, cy] == tilemap.N {wx = 1; hx = 2; }
            if tilegrid[# cx, cy] == tilemap.W {wx = 2; hx = 1; }
            
            if tilegrid[# cx, cy] == 16 + tilemap.NW {wx = 2; hx = 2; }
            if tilegrid[# cx, cy] == 16 + tilemap.SW {wx = 2; hx = 0; }
            if tilegrid[# cx, cy] == 16 + tilemap.SE {wx = 0; hx = 0; }
            if tilegrid[# cx, cy] == 16 + tilemap.NE {wx = 0; hx = 2; }
            
            //DECORATIVE TILE
            tile_add(sheet, wx * cell, hx * cell, cell, cell, cx * cell, cy * cell, layerdepth);
        }
    }
}
