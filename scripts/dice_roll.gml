///dice_roll(rolls, dX)

    var rolls = round(argument0);
    var dice = round(argument1);

    var d = 0;
    repeat(max(0, round(rolls))) 
    { 
        d += (1 + irandom(dice-1)); 
    }
    return d;
