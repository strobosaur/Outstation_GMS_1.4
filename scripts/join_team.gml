///join_team(mounted);
    
    // GET STARTING SKILL
    active_skill = unit_data.skill_list[| irandom(ds_list_size(unit_data.skill_list)-1)];
    give_skill_bonus(active_skill, -1);

    // JOIN TEAM KICKASS
    
    var map = global.statsbook;
    
    // SKILL LOG
    skill_log = ds_map_create();
    
    ds_map_add(skill_log, "combat_lvl", 0);
    ds_map_add(skill_log, "melee_lvl", 0);
    ds_map_add(skill_log, "defense_lvl", 0);
    ds_map_add(skill_log, "bloodlust_lvl", 0);
    ds_map_add(skill_log, "overkill_lvl", 0);
    
    // MAKE MAPS FOR STATS
    var stats_map = ds_map_create();
    
    // ADD THE ARRAYS
    ds_map_add(stats_map, "stats a", stats_a);
    ds_map_add(stats_map, "item map", item_map);
    ds_map_add(stats_map, "item map", skill_map);
    ds_map_add(stats_map, "skill log", skill_log);
    ds_map_add(stats_map, "modifier list", attack_modifier_list);
    
    // ADD THE STATSMAP TO THE TEAM MAP
    ds_map_add(map, id, stats_map);
    
    // TEAM
    {
        // DROID LIST
        if !ds_list_find_index(global.team, id)
        {
            ds_list_add(global.team, id);
            ds_list_sort(global.team, true);
        }
    }

    // ADD TO MOUNTED LIST?
    if argument0 == true
    {
        // TURRET LIST
        if !ds_list_find_index(global.turrets, id)
        {
            ds_list_add(global.turrets, id);
            ds_list_sort(global.turrets, true);
        }
    }
    else
    {
        // DROID LIST
        if !ds_list_find_index(global.droids, id)
        {
            ds_list_add(global.droids, id);
            ds_list_sort(global.droids, true);
        }
    }
        
    
