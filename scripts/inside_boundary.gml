///inside_boundary(x1, y1, x2, y2);

    var ret = false;

    if x < argument0 { x = argument0; ret = true; }
    if x > argument2 { x = argument2; ret = true; }
    if y < argument1 { y = argument1; ret = true; }
    if y > argument3 { y = argument3; ret = true; }
    
    return ret;
