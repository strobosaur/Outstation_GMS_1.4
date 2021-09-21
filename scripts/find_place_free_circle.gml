///find_place_free_circle(grid, x, y, increment)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var incr = argument3;
    
    var dir = 0;
    var len = 0;
    
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    
    while grid_place_meeting(global.collision_grid, xx, yy) // (grid[# (xx div CELL)-1, (yy div CELL)-1] != 0)
    {
        if (dir mod 360) == 0 {len += incr;}
        
        xx += lengthdir_x(len, dir);
        yy += lengthdir_y(len, dir);
        
        dir++;
        
        if (xx < 0) || (xx > (gridw*CELL)) || (yy < 0) || (yy > (gridh*CELL))
        {
            xx = argument1;
            yy = argument2;
            break;
        }
    }
    
    x = xx;
    y = yy;
