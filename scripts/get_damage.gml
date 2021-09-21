///get_damage(weapon, attack modifier list, id)

    var weapon = argument0;
    var list = argument1;
    var owner = argument2;
    
    var dmg_dice = weapon[? "d_sides"] + check_bonus_list(list, "d_sides", owner);
    var dmg_rolls = weapon[? "d_rolls"] + check_bonus_list(list, "d_rolls", owner);
    var dmg_plus = owner.stats_a[?"base d_plus"] + weapon[? "d_plus"] + check_bonus_list(list, "d_plus", owner);
    
    var basedmg = 0;
    
    // ROLL DICE
    repeat(ceil(dmg_rolls))
    {
        basedmg += dice_roll(1, ceil(dmg_dice));
    }
    
    // RETURN DAMAGE SCORE
    return basedmg + dmg_plus;
    
    
