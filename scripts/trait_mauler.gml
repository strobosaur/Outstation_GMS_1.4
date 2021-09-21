///trait_mauler()

    var luck = weighted_random(5, 5, 1);
    
    // THE GOOD
//    a_matrix[wpntype.mlw, amx.th_plus] += 1 + luck;
//    a_matrix[wpntype.mlw, amx.d_plus] += 2 + luck;
//    a_matrix[wpntype.mlw, amx.splash_r] += 1.5 + (luck * 0.5);
//    a_matrix[wpntype.mlw, amx.crt_multiplier] += 1 + luck;
    
    // MELEE TO HIT +
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "th_plus";
    item_bonus[itembonus.name] = "mauler : melee to hit +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + luck;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // MELEE DAMAGE +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "d_plus";
    item_bonus[itembonus.name] = "mauler : melee damage +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 2 + luck;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // MELEE RADIUS +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "radius";
    item_bonus[itembonus.name] = "mauler : melee radius +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 1.35 + (luck * 0.25);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // MELEE CRIT MULTIPLIER +
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "multiplier";
    item_bonus[itembonus.name] = "mauler : melee crit x +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1 + luck
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // SKILL BONUS
    do_level_up("melee", false);
    var new_skill = unit_data.skill_list[|1];
    give_skill_bonus(new_skill, active_skill);
    active_skill = new_skill;
    
//    skill_log[skills.skl_mw, 1] += 1;
//    skill_log[skills.skl_mw, 2] += 1;
    
    // THE BAD
    stats_a[?"base ac"] -= 1;

    // THE NAME
    if luck > 0
    {
        ds_list_add(trait_list, "mauler +");
    }
    else
    {
        ds_list_add(trait_list, "mauler");
    }
    
    var pos = ds_list_find_index(sys_core.trait_pool, trait_mauler);
    ds_list_delete(sys_core.trait_pool, pos)
