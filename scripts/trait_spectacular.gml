///trait_spectacular()

    var luck = weighted_random(5, 5, 1);
    
    // THE GOOD
//    a_matrix[wpntype.allw, amx.range] += 20 *(1 + luck);
//    a_matrix[wpntype.allw, amx.atk_spd] -= 0.20;
//    a_matrix[wpntype.allw, amx.crt_chance] += 1;
//    crt_matrix[wpntype.allw, irandom_range(0, crts.stop-1)] += 1
    
    // RANGE +
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "range";
    item_bonus[itembonus.name] = "spectacular : range +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.1 + (0.075 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // ATTACK SPEED +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd";
    item_bonus[itembonus.name] = "spectacular : attack speed +";
    item_bonus[itembonus.operation] = operation.divide;
    item_bonus[itembonus.amount] = 0.1 + (0.075 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // CRIT CHANCE +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "crit";
    item_bonus[itembonus.name] = "spectacular : crit % +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + (0.5 * luck);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // SKILL BONUS
    do_level_up("overkill", false);
    var new_skill = unit_data.skill_list[|3];
    give_skill_bonus(new_skill, active_skill);
    active_skill = new_skill;
    
    // THE BAD
//    b_stats[b_stats.mspd]  *= 0.7;
    stats_a[?"base ac"] -= 1 + luck;
//    a_matrix[wpntype.allw, amx.spread] += 3;
    
    // SPREAD -
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "spread";
    item_bonus[itembonus.name] = "spectacular : spread -";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 3;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // THE NAME    
    if luck > 0
    {
        ds_list_add(trait_list, "spectacular +");
    }
    else
    {
        ds_list_add(trait_list, "spectacular");
    }
    
//    var pos = ds_list_find_index(global.trait_pool, trait_spectacular);
    ds_list_delete(sys_core.trait_pool, ds_list_find_index(sys_core.trait_pool, trait_spectacular))
