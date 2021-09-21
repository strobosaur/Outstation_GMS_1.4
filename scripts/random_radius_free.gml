///random_radius_free(x, y, radius, col grid, block type);

    var x0 = argument0
    var y0 = argument1
    var grid = argument3;
    var type = argument4;

    // RETURNS ARRAY

    var dir = random(360);
    var len = random(argument2);
    var xx = x0 + lengthdir_x(len, dir);
    var yy = y0 + lengthdir_y(len, dir);
    
    var failsafe = 0;
    
    // WHILE NOT RIGHT
    while (grid[# round(xx div CELL)-1, round(yy div CELL)-1] == type)
    {
        dir = random(360);
        len = random(argument2);
        xx = x0 + lengthdir_x(len, dir);
        yy = y0 + lengthdir_y(len, dir);
        
        failsafe++;
        
        // FAIL
        if failsafe > 1000
        {
            return -1;
        }
    }

    // RETURN COORDINATES
    var ret = array_create(0);
    
    ret[0] = xx;
    ret[1] = yy;
    
    return ret;
