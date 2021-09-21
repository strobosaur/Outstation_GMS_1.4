///tiles_plates_top(grid, trigger, look for, tilesheet)

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
            if grid[# i-1, j-1] == mapcode.wall
            {
                // 4 WAY COUNT VOID & WALL
                if grid[# i-2, j-1] == mapcode.wall || grid[# i-2, j-1] == mapcode.void {n++;}
                if grid[# i, j-1] == mapcode.wall || grid[# i, j-1] == mapcode.void {n++;}
                if grid[# i-1, j-2] == mapcode.wall || grid[# i-1, j-2] == mapcode.void {n++;}
                if grid[# i-1, j] == mapcode.wall || grid[# i-1, j] == mapcode.void {n++;}
                
                // IF NOT INNER CORNER
                if n < 4
                {
                    // LEFT
                    if grid[# i-2, j-1] == mapcode.wall || grid[# i-2, j-1] == mapcode.void { t += 4; }
                    // RIGHT
                    if grid[# i, j-1] == mapcode.wall || grid[# i, j-1] == mapcode.void { t += 1; }
                    // UP
                    if grid[# i-1, j-2] == mapcode.wall || grid[# i-1, j-2] == mapcode.void { t += 2; }
                    // DOWN
                    if grid[# i-1, j] == mapcode.wall || grid[# i-1, j] == mapcode.void { t += 8; }
                    
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
                    if grid[# i-2, j-2] == mapcode.wall || grid[# i-2, j-2] == mapcode.void { t += 4; }
                    // SE
                    if grid[# i, j] == mapcode.wall || grid[# i, j] == mapcode.void { t += 1; }
                    // NE
                    if grid[# i, j-2] == mapcode.wall || grid[# i, j-2] == mapcode.void { t += 2; }
                    // SW
                    if grid[# i-2, j] == mapcode.wall || grid[# i-2, j] == mapcode.void { t += 8; }
                    
                    // INNER CORNERS
                    if t == 7 { tx = 4; ty = 0; } // SW
                    if t == 14 { tx = 3; ty = 0; } // SE
                    if t == 11 { tx = 4; ty = 1; } // NW
                    if t == 13 { tx = 3; ty = 1; } // NE
                }
                
                // PAINT RIGHT TILE
                tile_add(sheet, tx*CELL, ty*CELL, CELL, CELL, (i-1)*CELL, (j-2)*CELL, (-j-2)*CELL);
            }
        }
    }
