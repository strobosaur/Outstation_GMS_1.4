///face4(dir);
    
    // FACE = SHIELD    
    var ret = clamp(round(argument0 / 90) mod 4, 0, 3);
    
    return ret;
