///get_range(weapon map, bonus list, id)

    var weapon_map = argument0;
    var bonus_list = argument1;
    var owner = argument2;
    
    return (weapon_map[? "range"] + check_bonus_list(bonus_list, "range", owner));
