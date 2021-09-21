///make_ground_for_door(grid, x, y)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    
    var cx = 0;
    var cy = 0;
    
/*    if grid[# xx-2, yy-1] == mapcode.wall && grid[# xx, yy-1] == mapcode.wall
    {
        grid[# xx-1, yy-2] = mapcode.ground 
        grid[# xx-1, yy] = mapcode.ground
    }
    else if grid[# xx-1, yy-2] == mapcode.wall && grid[# xx-1, yy] == mapcode.wall
    {
        grid[# xx-2, yy-1] = mapcode.ground 
        grid[# xx, yy-1] = mapcode.ground
    }*/        
    
    // CHECK 4 DIRECTIONS
    for (var i = 0; i <= 3; i++)
    {
        var wall_r = grid[# ((xx-1) + lengthdir_x(1, (i-1)*90)), ((yy-1) + lengthdir_y(1, (i-1)*90))] == mapcode.wall;
        var wall_l = grid[# ((xx-1) + lengthdir_x(1, (i+1)*90)), ((yy-1) + lengthdir_y(1, (i+1)*90))] == mapcode.wall;        
        
        if wall_r && wall_l
        {
            cx = xx + lengthdir_x(1, i*90);
            cy = yy + lengthdir_y(1, i*90);
            
            while (grid[# cx-1, cy-1] == mapcode.hole)
            {
                grid[# cx-1, cy-1] = mapcode.ground;
                
                cx += lengthdir_x(1, i*90);
                cy += lengthdir_x(1, i*90);
            }
//            grid[# (xx + lengthdir_x(1, (i+2)*90)), (yy + lengthdir_y(1, (i+2)*90))] = mapcode.ground;
//            grid[# (xx + lengthdir_x(1, (i)*90)), (yy + lengthdir_y(1, (i)*90))] = mapcode.ground;
//            break;
        }
    }
/*        for (var j = 0; j <= 3; j++)
        {
        if wall_r && wall_l
        {
            grid[# (xx + lengthdir_x(1, (i+2)*90)), (yy + lengthdir_y(1, (i+2)*90))] = mapcode.ground;
            grid[# (xx + lengthdir_x(1, (i)*90)), (yy + lengthdir_y(1, (i)*90))] = mapcode.ground;
            break;
        }
    }
    
    /*
    for (var i = 0; i < 4; i++)
    {
        var wall_r = grid[# xx + lengthdir_x(1, (i-1)*90), yy + lengthdir_y(1, (i-1)*90)] == mapcode.wall;
        var wall_l = grid[# xx + lengthdir_x(1, (i+1)*90), yy + lengthdir_y(1, (i+1)*90)] == mapcode.wall;
        var void_f = grid[# xx + lengthdir_x(1, i*90), yy + lengthdir_y(1, i*90)] == mapcode.void;
        
        if wall_r && wall_l && void_f
        {
            grid[# xx - lengthdir_x(1, i), yy - lengthdir_y(1, i)] = mapcode.ground;
        }
    }
