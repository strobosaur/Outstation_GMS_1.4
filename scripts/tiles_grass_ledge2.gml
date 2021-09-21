///tiles_grass_ledge2(grid, trigger, if prox to, tilesheet)

    var grid = argument0;
    var trigger_type = argument1;
    var prox_type = argument2
    var sheet = argument3;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    var sw = background_get_width(sheet);
    var sh = background_get_height(sheet);
    
    var sx = 0;
    var sy = 0;
    
    var d = 0;
    var n = 0;
    var t = 0;
    
    var tx = 0;
    var ty = 0;
    
    var tiles = sw / CELL;
    
    // PARSE GRID
    for (var i = 1; i <= gridw; i++)
    {
        for (var j = 1; j <= gridh; j++)
        {
            // RESET N & T
            n = 0;
            t = 0;
            
            tx = 0;
            ty = 0;
            
            // IF IS WALL
            if grid[# i-1, j-1] == trigger_type && cellR1_4(grid, i, j, mapcode.hole) > 0
            {
                // 4 WAY COUNT VOID & WALL
                if grid[# i-2, j-1] == trigger_type || grid[# i-2, j-1] == trigger_type {n++;}
                if grid[# i, j-1] == trigger_type || grid[# i, j-1] == trigger_type {n++;}
                if grid[# i-1, j-2] == trigger_type || grid[# i-1, j-2] == trigger_type {n++;}
                if grid[# i-1, j] == trigger_type || grid[# i-1, j] == trigger_type {n++;}
                
                // IF NOT INNER CORNER
                if n < 4
                {
                    // LEFT
                    if grid[# i-2, j-1] == trigger_type || grid[# i-2, j-1] == trigger_type { t += 4; }
                    // RIGHT
                    if grid[# i, j-1] == trigger_type || grid[# i, j-1] == trigger_type { t += 1; }
                    // UP
                    if grid[# i-1, j-2] == trigger_type || grid[# i-1, j-2] == trigger_type { t += 2; }
                    // DOWN
                    if grid[# i-1, j] == trigger_type || grid[# i-1, j] == trigger_type { t += 8; }
                    
                    // CORNERS
                    if t == 3 { tx = 0; ty = 2; } // SW
                    if t == 6 { tx = 2; ty = 2; } // SE
                    if t == 9 { tx = 0; ty = 0; } // NW
                    if t == 12 { tx = 2; ty = 0; } // NE
                    
                    // 4 WAY
                    if t == 7 { tx = 1; ty = 2; } // S
                    if t == 11 { tx = 0; ty = 1; } // W
                    if t == 13 { tx = 1; ty = 0; } // N
                    if t == 14 { tx = 2; ty = 1; } // E
                }
                // IF IS INNER CORNER
                else
                {
                    // NW
                    if grid[# i-2, j-2] == trigger_type || grid[# i-2, j-2] == trigger_type { t += 4; }
                    // SE
                    if grid[# i, j] == trigger_type || grid[# i, j] == trigger_type { t += 1; }
                    // NE
                    if grid[# i, j-2] == trigger_type || grid[# i, j-2] == trigger_type { t += 2; }
                    // SW
                    if grid[# i-2, j] == trigger_type || grid[# i-2, j] == trigger_type { t += 8; }
                    
                    // INNER CORNERS
                    if t == 7 { tx = 4; ty = 0; } // SW
                    if t == 14 { tx = 3; ty = 0; } // SE
                    if t == 11 { tx = 4; ty = 1; } // NW
                    if t == 13 { tx = 3; ty = 1; } // NE
                }
                
                // PAINT RIGHT TILE
                tile_add(sheet, tx*CELL, ty*CELL, CELL, CELL, (i-1)*CELL, (j-1)*CELL, (-j+2)*CELL);
            }
        }
    }
