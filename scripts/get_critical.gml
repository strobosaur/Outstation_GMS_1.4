///get_critical(weapon map, bonus list, id)
    
    var weapon = argument0;
    var list = argument1;
    var owner = argument2;
    
    var d_sides = 50;
    
    // ATTACK MATRIX
    var crt_chance = weapon[?"crit"] + owner.stats_a[?"base crit"] + check_bonus_list(list, "crit", owner);
    var crt_rolls = 0
    
    // ROLL DICE
    repeat(ceil(1 + crt_rolls))
    {
        var d_roll = dice_roll(1, ceil(d_sides))
        if d_roll > (d_sides - crt_chance )
        { 
            // CRITICAL HIT!
            return true; 
        }
        else
        {
            // REGULAR HIT
            return false;
        }
    }
