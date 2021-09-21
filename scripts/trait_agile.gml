///trait_agile()
    
    var luck = weighted_random(5, 1);

    // THE GOOD
    stats_a[?"move speed"] *= 1.35;
    stats_a[?"base ac"] += 1 + luck; //weighted_random(5, 3, 1);
    
    // SHOTS +
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "shots";
    item_bonus[itembonus.name] = "agile : shots +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // LUCKY?
    if luck > 0
    {
        // SHOTS +
        item_bonus = array_create(0);
        
        item_bonus[itembonus.statstype] = statstype.stats_w;
        item_bonus[itembonus.type] = "shots";
        item_bonus[itembonus.name] = "agile : melee shots +";
        item_bonus[itembonus.operation] = operation.add;
        item_bonus[itembonus.amount] = luck;
        item_bonus[itembonus.value] = 0;
        item_bonus[itembonus.wpntype] = wpntype.mlw;
    
        ds_list_add(attack_modifier_list, item_bonus);
    }
    
//    skill_log[skills.skl_agl, 1] += 1;
//    skill_log[skills.skl_agl, 2] += 1;
    
    // THE BAD
    stats_a[?"hpmax"] = round((0.65 + (0.1 * luck)) * stats_a[?"hpmax"]);
    stats_a[?"hp"] = stats_a[?"hpmax"];
//    b_stats[b_stats.focus] -= 1;
    
    // THE NAMES
    if luck > 0
    {
        ds_list_add(trait_list, "agile +");
    }
    else
    {
        ds_list_add(trait_list, "agile");
    }
    
    // THE 
    var pos = ds_list_find_index(sys_core.trait_pool, trait_agile);
    ds_list_delete(sys_core.trait_pool, pos)
