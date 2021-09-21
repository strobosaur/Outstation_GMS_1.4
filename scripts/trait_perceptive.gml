///trait_perceptive()

    var luck = weighted_random(5, 3, 1);
    
    // THE GOOD
    stats_a[?"base th_plus"] += round(1 + (luck * 1));
    
//    a_matrix[wpntype.allw, amx.range] += 25 *(1 + luck);
//    a_matrix[wpntype.allw, amx.th_rolls] += 1 + luck;
//    a_matrix[wpntype.allw, amx.crt_chance] += 1 + luck;
//    crt_matrix[wpntype.allw, crts.multiplier] += 1 + luck;
//    a_matrix[wpntype.allw, amx.crt_multiplier] += 1 + luck;
    
    // RANGE +
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "range";
    item_bonus[itembonus.name] = "perceptive : range +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.15 + (0.1 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // CRIT CHANCE +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "crit";
    item_bonus[itembonus.name] = "perceptive : crit % +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + luck;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // CRIT MULTIPLIER +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "multiplier";
    item_bonus[itembonus.name] = "perceptive : crit x +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + luck;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // SKILL BONUS
//    skill_log[skills.skl_crt, 1] += 1;
//    skill_log[skills.skl_crt, 2] += 1;
    
    // THE BAD
//    b_stats[b_stats.mspd]  *= 0.7;
    stats_a[?"base ac"] -= 1 + luck;
//    a_matrix[wpntype.allw, amx.atk_spd] += 0.25 - (0.075 * luck);
    
    // ATTACK SPEED -
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd";
    item_bonus[itembonus.name] = "perceptive : attack speed -";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.15 + (0.075 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // BURST SPEED -
/*    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd2";
    item_bonus[itembonus.name] = "perceptive : burst speed -";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.25 + (0.075 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);*/
    
    // THE NAME    
    if luck > 0
    {
        ds_list_add(trait_list, "perceptive +");
    }
    else
    {
        ds_list_add(trait_list, "perceptive");
    }
    
    var pos = ds_list_find_index(sys_core.trait_pool, trait_perceptive);
    ds_list_delete(sys_core.trait_pool, pos)
