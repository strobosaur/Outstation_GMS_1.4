///get_atkspd(weapon map, bonus list, id)

    var weapon = argument0;
    var list = argument1;
    var owner = argument2;
    
    return max(5, round(weapon[?"atkspd"] + check_bonus_list(list, "atkspd", owner))); //check_attack_matrix(w_array, atk_mx, amx.atk_spd)));
