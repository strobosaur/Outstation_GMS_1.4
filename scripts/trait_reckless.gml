///trait_reckless()

    var luck = weighted_random(5, 5, 1);
    
    // THE GOOD
//    a_matrix[wpntype.allw, amx.shots] += luck;
//    a_matrix[wpntype.allw, amx.atk_spd] -= 0.25;

    // SHOTS +
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "shots";
    item_bonus[itembonus.name] = "reckless : burst shots +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.15 + (0.1 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);

    // ATTACK SPEED +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd";
    item_bonus[itembonus.name] = "reckless : attack speed +";
    item_bonus[itembonus.operation] = operation.divide;
    item_bonus[itembonus.amount] = 0.15 + (0.075 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // THE BAD
//    a_matrix[wpntype.allw, amx.crt_chance] -= 1 + luck;
    stats_a[?"base th_plus"] -= 1 + luck;
    stats_a[?"base ac"] -= 1 + luck;
//    a_matrix[wpntype.allw, amx.spread] += 3;

    // CRIT -
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "crit";
    item_bonus[itembonus.name] = "reckless : crit % -";
    item_bonus[itembonus.operation] = operation.subtract;
    item_bonus[itembonus.amount] = 1 + (0.5 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);

    // SPREAD -
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "spread";
    item_bonus[itembonus.name] = "reckless : spread -";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 4;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // THE NAME    
    if luck > 0
    {
        ds_list_add(trait_list, "reckless +");
    }
    else
    {
        ds_list_add(trait_list, "reckless");
    }
    
    var pos = ds_list_find_index(sys_core.trait_pool, trait_reckless);
    ds_list_delete(sys_core.trait_pool, pos)
