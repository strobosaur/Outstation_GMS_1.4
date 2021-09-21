///give_levelup(level up map)

    var bonusmap = argument0;
    
    // IF DOES NOT ALREADY HAVE
    if ds_list_find_index(level_up_list, bonusmap) == -1
    {
        // ADD TO LIST
        ds_list_add(level_up_list, bonusmap);
        // REMOVE FROM POOL
        ds_list_delete(bonus_pool, ds_list_find_index(bonus_pool, bonusmap));
        
        // CHECK IF HAS STAT BONUSES ===== ===== ===== ===== =====
        if ds_map_exists(bonusmap, "b increase")
        {
            // B BONUS ARRAY
            var b_bonus = ds_map_find_value(bonusmap, "b increase");
            // ITERATE ARRAY
            for (var i = 0; i < b_stats.stop; i++)
            {
                if b_bonus[i] != 0
                {
                    b_stats[i] += b_bonus[i];
                }
            }
        }
        
        // CHECK IF HAS STAT BONUSES ===== ===== ===== ===== =====
        if ds_map_exists(bonusmap, "a increase")
        {
            // B BONUS ARRAY
            var a_bonus = ds_map_find_value(bonusmap, "a increase");
            // ITERATE ARRAY
            for (var i = 0; i < a_stats.stop; i++)
            {
                if a_bonus[i] != 0
                {
                    a_stats[i] += a_bonus[i];
                }
            }
        }
        
        // CHECK IF HAS STAT BONUSES ===== ===== ===== ===== =====
        if ds_map_exists(bonusmap, "am increase")
        {
            // B BONUS ARRAY
            var am_bonus = ds_map_find_value(bonusmap, "am increase");
            // ITERATE ARRAY
            for (var i = 0; i < wpntype.stop; i++)
            {
                for (var j = 0; j < amx.stop; j++)
                {
                    if am_bonus[i, j] != 0
                    {
                        a_matrix[i, j] += am_bonus[i, j];
                    }
                }
            }
        }
        
        // CHECK IF HAS STAT BONUSES ===== ===== ===== ===== =====
        if ds_map_exists(bonusmap, "w increase")
        {
            var bonus_list = ds_map_find_value(bonusmap, "w increase");
            
//            if ds_exists(bonus_list, ds_type_list)
            if is_array(bonus_list)
            {
                // ADD SINGLE BONUS ARRAY
                ds_list_add(attack_modifier_list, ds_map_find_value(bonusmap, "w increase"));
            }
            else
            {
                // ADD ARRAYS FROM LIST
                for (var i = 0; i <= ds_list_size(bonus_list)-1; i++)
                {
                    ds_list_add(attack_modifier_list, ds_list_find_value(bonus_list, i))
                }
            }
        }
        
        // CHECK IF HAS STAT BONUSES ===== ===== ===== ===== =====
        if ds_map_exists(bonusmap, "dm increase")
        {
            // DM BONUS ARRAY
            var dm_bonus = ds_map_find_value(bonusmap, "dm increase");
            // ITERATE ARRAY
            for (var i = 0; i < dmx.stop; i++)
            {
                if dm_bonus[i] != 0
                {
                    d_matrix[i] += dm_bonus[i];
                }
            }
        }
        
        // CHECK IF HAS STAT BONUSES ===== ===== ===== ===== =====
        if ds_map_exists(bonusmap, "crt increase")
        {
            // DM BONUS ARRAY
            var crt_bonus = ds_map_find_value(bonusmap, "crt increase");
            // ITERATE ARRAY
            for (var i = 0; i < wpntype.stop; i++)
            {
                for (var j = 0; j < crts.stop; j++)
                {
                    if crt_bonus[i, j] != 0
                    {
                        crt_matrix[i, j] += crt_bonus[i, j];
                    }
                }
            }
        }
    }
    else
    {
        return false;
    }
