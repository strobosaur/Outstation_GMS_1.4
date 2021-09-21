///tiles_underside(grid, trigger, if prox to, sheet)

    var grid = argument0;
    var trigger = argument1;
    var prox = argument2
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
    for (var i = 1; i < gridw; i++)
    {
        for (var j = 1; j < gridh; j++)
        {
            // IF RIGHT TILE & BELOW TYPE
            if grid[# i-1, j-1] == trigger && grid[# i-1, j] == prox
            {
                // PAINT RANDOM TILE
                r = irandom(tiles-1);
                
                tile_add(sheet, 0*CELL, 0*CELL, CELL, CELL, (i-1)*CELL, (j)*CELL, (-j+2)*CELL);
            }
        }
    }
