///equip_skill(skill, in map, in slot, y/n)

    var new_skill = argument0;
    var to_map = argument1;
    var in_slot = argument2;
    var do_quip = argument3;
    
    var old_skill, remove_list, add_list, bonus_array;
    
    // IF SLOT OCCUPIED
    if to_map[? in_slot] != -1
    {
        // RETURN OLD SKILL TO SKILL LIST
        old_skill = to_map[?in_slot];
        ds_list_add(eq_skill_list, old_skill);
        
        // CHECK FOR PASSIVE LIST
        if ds_map_exists(old_skill, "passive list")
        {
            // ITERATE LIST
            remove_list = old_skill[?"passive list"];
            for (var i = 1; i <= ds_list_size(remove_list); i++)
            {
                // UPDATE STATS
                bonus_array = remove_list[|i-1];
                
                switch bonus_array[itembonus.statstype]
                {
                    case statstype.stats_a:
                    stats_a[? bonus_array[itembonus.type]] -= bonus_array[itembonus.amount];
                    break;
                    
                    case statstype.stats_amr:
                    base_armor[? bonus_array[itembonus.type]] -= bonus_array[itembonus.amount];
                    break;
                }
            }
        }
        
        // ACTIVE BONUSES
        if ds_map_exists(old_skill, "active list")
        {
            // ITERATE LIST
            remove_list = old_skill[?"active list"];
            // LOOP THRU ARRAY LIST AND COPY / REMOVE
            for (var i = 1; i <= ds_list_size(remove_list); i++)
            {
                ds_list_delete(attack_modifier_list, ds_list_find_index(attack_modifier_list, remove_list[|i-1]));
            }
        }
    }
    
    // REMOVE FROM INVENTORY
    ds_list_delete(eq_skill_list, ds_list_find_index(eq_skill_list, new_skill))
    
    // EQUIP NEW SKILL
    ds_map_replace(to_map, in_slot, new_skill);
    
    // CHECK FOR PASSIVE LIST
    if ds_map_exists(new_skill, "passive list")
    {
        // ITERATE LIST
        add_list = new_skill[?"passive list"];
        for (var i = 1; i <= ds_list_size(add_list); i++)
        {
            // UPDATE STATS
            bonus_array = add_list[|i-1];
            
            switch bonus_array[itembonus.statstype]
            {
                case statstype.stats_a:
                stats_a[? bonus_array[itembonus.type]] += bonus_array[itembonus.amount];
                break;
                
                case statstype.stats_amr:
                base_armor[? bonus_array[itembonus.type]] += bonus_array[itembonus.amount];
                break;
            }
        }
    }
    
    // ACTIVE BONUSES
    if ds_map_exists(new_skill, "active list")
    {
        // ITERATE LIST
        add_list = new_skill[?"active list"];
        // LOOP THRU ARRAY LIST AND COPY / REMOVE
        for (var i = 1; i <= ds_list_size(add_list); i++)
        {
            ds_list_add(attack_modifier_list, add_list[|i-1]);
        }
    }
