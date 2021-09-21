///cellR5x5(grid, x, y, n cell)

    // Init parameters
    
    var grid = argument0; // Source grid to draw neighbour info from

    var x0 = argument1; // Starting X position
    var y0 = argument2; // Starting Y position
    
    var nt = argument3; // What type of neighbour cell is counted
    
    var nn = 0;
    
    // Loop R2 cells and check for n

    for(var ix = (-2); ix <= 2; ix++)
    {  
        for(var iy = (-2); iy <= 2; iy++)
        {
            
            // Sum up nbr count
            var nx = x0 + ix;
            var ny = y0 + iy;
            
            // Make sure the n coordinates are inside the bounds of the source grid
            if inside_grid(grid, nx, ny) == false
            { 
                continue; // abort loop-cycle and proceed to next step
            }
            
            // If current cell is right type
            if (grid[# nx, ny] == nt) 
            {
                nn++;
            }
        }
    }
        
    // Return neighbor count
                
    return nn;
