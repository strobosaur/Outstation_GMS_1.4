///dir_find_tile(grid, x, y, dir, tile type)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var dir = argument3;
    var type = argument4;
    var ret = array_create(0);
    
    var failsafe = max(ds_grid_width(grid), ds_grid_height(grid));
    
    while grid[#xx-1,yy-1] != type
    {
        xx += lengthdir_x(1, dir*90);
        yy += lengthdir_y(1, dir*90);
        
//        failsafe--;
        
//        if failsafe <= 0 {return -1;}
    }
    
    ret[0] = round(xx);
    ret[1] = round(yy);
    
    return ret;
