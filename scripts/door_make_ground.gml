///door_make_ground(grid, x1, y1, x2, y2)

    var grid = argument0;
    var x1 = argument1;
    var y1 = argument2;
    var x2 = argument3;
    var y2 = argument4;
    
    var xx = x1
    var yy = y1;

    if cellR1_4(grid, xx, yy, mapcode.ground) == 0
    {
        for(var i = min(x1, x2); i <= (max(x1, x2)); i++)
        {
            var dir = point_direction(x1, y1, x2, y1);
            
            xx += lengthdir_x(1, dir*90);
            yy += lengthdir_y(1, dir*90);
            
            if grid[#xx-1, yy-1] == mapcode.ground
            {
                break;
            }
            else
            {
                grid[#xx-1, yy-1] = mapcode.ground
            }
        }
    }
    
    if cellR1_4(grid, x2, y2, mapcode.ground) == 0
    {
        for(var i = min(y1, y2); i <= (max(y1, y2)); i++)
        {
            yy = y2;
            xx = x2;
            
            var dir = point_direction(x2, y2, x2, y1);
            
            xx += lengthdir_x(1, dir*90);
            yy += lengthdir_y(1, dir*90);
            
            if grid[#xx-1, yy-1] == mapcode.ground
            {
                break;
            }
            else
            {
                grid[#xx-1, yy-1] = mapcode.ground
            }
        }
    }
            
                
//    var yy = min(y1, y2);
//    if grid[#x1-1, y1-1] != mapcode.
    
