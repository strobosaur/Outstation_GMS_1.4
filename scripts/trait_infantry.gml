///trait_infantry()

    var luck = weighted_random(5, 3, 1);
    
    // THE GOOD
//    a_matrix[wpntype.lw, amx.d_plus] += 1 + luck;
//    a_matrix[wpntype.lw, amx.atk_spd] -= 0.20;
    stats_a[?"move speed"]  *= 1.15;
    
    // LIGHT WEAPONS DAMAGE +
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "d_plus";
    item_bonus[itembonus.name] = "infantry : light weapons damage +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.lw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // LIGHT WEAPONS ATTACK SPEED +
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd";
    item_bonus[itembonus.name] = "infantry : light weapons attack speed +";
    item_bonus[itembonus.operation] = operation.divide;
    item_bonus[itembonus.amount] = 0.1;
    item_bonus[itembonus.value] = 0;
    item_bonus[itembonus.wpntype] = wpntype.lw;
    
    ds_list_add(attack_modifier_list, item_bonus);
    
    // SKILL BONUS
    do_level_up("combat", false);
    var new_skill = unit_data.skill_list[|0];
    give_skill_bonus(new_skill, active_skill);
    active_skill = new_skill;
    
    // THE BAD
    
    // THE NAME    
    if luck > 0
    {
        ds_list_add(trait_list, "infantry +");
    }
    else
    {
        ds_list_add(trait_list, "infantry");
    }
    
//    var pos = ds_list_find_index(global.trait_pool, trait_spectacular);
    ds_list_delete(sys_core.trait_pool, ds_list_find_index(sys_core.trait_pool, trait_infantry))
