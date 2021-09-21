///trait_tough();

    var luck = weighted_random(5, 7, 1);

    // THE GOOD
    stats_a[?"base ac"] += 1 + weighted_random(5, 7, 1);
    stats_a[?"hpmax"] += irandom_range(10, 20) + (2 *  + weighted_random(5, 7, 1));
    stats_a[?"hp"] = stats_a[?"hpmax"]
    stats_a[?"regen"] += 0.15 + (0.1 * luck);
    stats_a[?"regen timer"] *= (1 / (1.25 + luck));
    
    // SKILL BONUS
    do_level_up("defense", false);
    var new_skill = unit_data.skill_list[| 2];
    give_skill_bonus(new_skill, active_skill);
    active_skill = new_skill;
    
    // THE BAD
    stats_a[?"base th_plus"] -= 3;
    
    // THE WORDS
    if luck > 0
    {
        ds_list_add(trait_list, "tough +");
    }
    else
    {
        ds_list_add(trait_list, "tough");
    }
    
    // THERE CAN BE ONLY ONE
    var pos = ds_list_find_index(sys_core.trait_pool, trait_tough);
    ds_list_delete(sys_core.trait_pool, pos)
