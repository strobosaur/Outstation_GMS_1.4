///trait_sureshot()

    var luck = weighted_random(5, 3, 1);
    
    // THE GOOD
//    a_matrix[wpntype.rngw, amx.th_plus] += 1 + luck;
//    a_matrix[wpntype.rngw, amx.d_plus] += 1 + luck;
//    a_matrix[wpntype.rngw, amx.crt_chance] += 1 + luck;
//    a_matrix[wpntype.rngw, amx.crt_multiplier] += 1 + luck;
//    a_matrix[wpntype.rngw, amx.spread] -= 3 + luck;
    
    // RANGED TO HIT +
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "th_plus";
    item_bonus[itembonus.name] = "sureshot : ranged to hit +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + luck;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.rngw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // RANGED DAMAGE +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "d_plus";
    item_bonus[itembonus.name] = "sureshot : ranged damage +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + luck;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.rngw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // RANGED CRIT CHANCE +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "crit";
    item_bonus[itembonus.name] = "sureshot : ranged crit % +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + luck;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.rngw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // RANGED CRIT MULTIPLIER +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "multiplier";
    item_bonus[itembonus.name] = "sureshot : ranged crit x +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + luck;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.rngw;
    
    // RANGED SPREAD +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "spread";
    item_bonus[itembonus.name] = "sureshot : spread +";
    item_bonus[itembonus.operation] = operation.divide;
    item_bonus[itembonus.amount] = 0.25 + (0.1 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.rngw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // SKILL BONUS
//    skill_log[skills.skl_aim, 1] += 1;
//    skill_log[skills.skl_aim, 2] += 1;
    
    // THE BAD
//    a_matrix[wpntype.allw, amx.atk_spd] += 0.20;
//    a_matrix[wpntype.mlw, amx.th_plus] -= 1;
//    a_matrix[wpntype.mlw, amx.atk_spd] += 0.25;
    
    // ATTACK SPEED -
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd";
    item_bonus[itembonus.name] = "sureshot : attack speed -";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.1
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // MELEE TO HIT-
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "th_plus";
    item_bonus[itembonus.name] = "sureshot : melee to hit -";
    item_bonus[itembonus.operation] = operation.subtract;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // MELEE ATTACK SPEED-
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd";
    item_bonus[itembonus.name] = "sureshot : melee attack speed -";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.15;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // THE NAME    
    if luck > 0
    {
        ds_list_add(trait_list, "sureshot +");
    }
    else
    {
        ds_list_add(trait_list, "sureshot");
    }
    
    var pos = ds_list_find_index(sys_core.trait_pool, trait_sureshot);
    ds_list_delete(sys_core.trait_pool, pos)
