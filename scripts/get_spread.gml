///get_spread(weapon map, bonus list, id)

    var weapon = argument0;
    var list = argument1;
    var owner = argument2;
    
    return max(0, (weapon[? "spread"] + check_bonus_list(list, "spread", owner)));
