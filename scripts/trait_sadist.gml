///trait_sadist()

    var luck = weighted_random(15, 5, 1);
    
    // THE GOOD
    
//    a_matrix[wpntype.mlw, amx.lifesteal] += 0.15 + (luck * 0.1);
//    a_matrix[wpntype.mlw, amx.knock] += 0.35 + (luck * 0.15);
//    a_matrix[wpntype.mlw, amx.d_plus] += 2 + luck;
    
    // LIFESTEAL BONUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "lifesteal";
    item_bonus[itembonus.name] = "sadist : melee lifesteal +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 0.15 + (luck * 0.1);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // DAMAGE BONUS
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "d_plus";
    item_bonus[itembonus.name] = "sadist : melee damage +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 2 + luck
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // KNOCKBACK BONUS
    item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "knock";
    item_bonus[itembonus.name] = "sadist : melee knockback +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] =  0.35 + (luck * 0.15);
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.mlw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // SKILL BONUS
    do_level_up("bloodlust", false);
    var new_skill = unit_data.skill_list[| 4];
    give_skill_bonus(new_skill, active_skill);
    active_skill = new_skill;
    
    // THE BAD
    stats_a[?"base th_plus"] -= 1;

    // THE NAME
    if luck > 0
    {
        ds_list_add(trait_list, "sadist +");
    }
    else
    {
        ds_list_add(trait_list, "sadist");
    }
    
    var pos = ds_list_find_index(sys_core.trait_pool, trait_sadist);
    ds_list_delete(sys_core.trait_pool, pos)
