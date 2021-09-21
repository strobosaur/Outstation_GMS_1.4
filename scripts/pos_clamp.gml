///pos_clamp(x1, y1, x2, y2);

    var x1 = argument0;
    var y1 = argument1;
    var x2 = argument2;
    var y2 = argument3;
    
    // CLAMP
    
    if x < x1 { x = x1; }
    if x > x2 { x = x2; }
    
    if y < y1 { y = y1; }
    if y > y2 { y = y2; }
