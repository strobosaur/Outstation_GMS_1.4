///tiler(grid, cellsize, cell type, odds, tilesheet, std tiles x, std tiles y, depth);

    // INPUT
    
    var grid = argument0;
    var cell = argument1;
    var trig = argument2;
    var odds = argument3;
    var sheet = argument4;
    var stdx = argument5;
    var stdy = argument6;
    var layerdepth = argument7;
    
    // LOCAL
    
    var w = (background_get_width(sheet) div cell)-1;
    var h = (background_get_height(sheet) div cell)-1;
    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // LOOP
    
    for(var cx = 1; cx <= gw; cx++){
        for(var cy = 1; cy <= gh; cy++){
        
        if grid[# cx-1, cy-1] == trig
        {
            if random(1) < odds
            {
                //DECORATIVE TILE
                tile_add(sheet, irandom(w) * cell, irandom(h) * cell, cell, cell, (cx-1) * cell, (cy-1) * cell, layerdepth) // (-cy+1) * cell) //layerdepth);
            }
            else
            {
                //STANDARD TILE
                tile_add(bg_grass01, stdx, stdy, cell, cell, (cx-1) * cell, (cy-1) * cell, layerdepth)//(-cy+1) * cell) //layerdepth);
            }
        }
    }
}
