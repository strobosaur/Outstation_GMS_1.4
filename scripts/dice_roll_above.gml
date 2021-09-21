///dice_roll_above(rolls, dX, above or equal)

    var rolls = argument0;
    var dice = argument1;
    var above = argument2;

    var d = 0;
    repeat(max(0, round(rolls))) 
    { 
        d += (1 + irandom(dice-1)); 
    }
    
    if d >= above
    
    return true;
