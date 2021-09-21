///cellR1(grid, x, y, n cell, outside grid counts t/f);

    // INPUT
    
    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var nt = argument3;
    var outside_n = argument4;
    
    // LOCAL VARS
    
    var n = 0;
    
    // LOOP NEIGHBOR CELLS

    for(var nx = -1; nx <= 1; nx++){
        for(var ny = -1; ny <= 1; ny++){
        
            // Skip mid
            if ((nx == 0) && (ny == 0)) { continue; }
        
            var rx = xx + nx;
            var ry = yy + ny;
            
            if inside_grid(grid, rx, ry) == false && outside_n == true
            {
                n++;
                continue;
                
            }
             
            if grid[# rx-1, ry-1] == nt 
            {
                n++;
            }
        }
    }
    
    return n;
