///random_radius_between(x, y, radius, mid distance);

    // RETURNS ARRAY

    var dir = random(360);
    var len = argument3 + random(argument2);
    var xx = argument0 + lengthdir_x(len, dir);
    var yy = argument1 + lengthdir_y(len, dir);
    
    var ret = array_create(0);
    
    ret[0] = xx;
    ret[1] = yy;
    
    return ret;
