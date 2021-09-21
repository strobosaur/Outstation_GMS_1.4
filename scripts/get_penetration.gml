///get_penetration(weapon map, attack matrix)

    var weapon = argument0;
    var list = argument1;
    var owner = argument2;
    
    return max(1, weapon[?"penetration"] + check_bonus_list(list, "penetration", owner)); //check_attack_matrix(w_array, atk_mx, amx.penetration));
