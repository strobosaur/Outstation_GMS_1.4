///inside_bounds(x0, y0, x1, y1, x2, y2)

    var x0 = argument0;
    var y0 = argument1;
    var x1 = argument2;
    var y1 = argument3;
    var x2 = argument4;
    var y2 = argument5;
    
    var ret = true;
    
    if x0 < x1 || x0 > x2 || y0 < y1 || y0 > y2
    {
        ret = false;
    }
    
    return ret;
