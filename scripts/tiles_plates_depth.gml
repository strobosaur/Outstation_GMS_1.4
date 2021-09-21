///tiles_plates_depth(grid, trigger, look for, tilesheet)

    var grid = argument0;
    var type = argument1;
    var type2 = argument2
    var sheet = argument3;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    var sw = background_get_width(sheet);
    var sh = background_get_height(sheet);
    
    var sx = 0;
    var sy = 0;
    
    var d = 0;
    
    var tiles = sw / CELL;
    
    // PARSE GRID
    for (var i = 1; i <= gridw; i++)
    {
        for (var j = 1; j <= gridh; j++)
        {
            // IF RIGHT TILE & BELOW TYPE
            if grid[# i-1, j-1] == type && grid[# i-1, j-2] == type2
            {
                // PAINT RANDOM TILE
                r = irandom(tiles-1);
                
                tile_add(sheet, r*CELL, 0*CELL, CELL, CELL, (i-1)*CELL, (j-2)*CELL, (-j+1)*CELL);
            }
            // IF RIGHT TILE & BELOW TYPE
            if grid[# i-1, j] == mapcode.wall
            {
                // PAINT RANDOM TILE
                r = irandom(1);
                
                tile_add(bg_plates01_top, r*CELL, 0, CELL, CELL, (i-1)*CELL, (j-1)*CELL, (-j+1)*CELL);
            }
        }
    }
