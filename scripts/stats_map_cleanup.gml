///stats_map_cleanup();

    if instance_exists(o_weapon)
    {
        instance_destroy(o_weapon);
    }

    // STATSMAP IS NOT UNDEFINED
    if !is_undefined(stats_map)
    {
        if is_array(stats_map)
        {
            ds_map_destroy(stats_map[? "stats a"]);    
            ds_map_destroy(stats_map[? "item map"]);
            ds_map_destroy(stats_map[? "skill log"]);
            ds_map_destroy(stats_map[? "modifier list"]);
            ds_map_destroy(stats_map[? statstype.stats_i]);
            ds_map_destroy(stats_map);
        }
    }
    
    // STATS A
    if !is_undefined(stats_a)
    {
        ds_map_destroy(stats_a);
    }
        
    // PATH DELETE
    if !is_undefined(path)
    {
        if path_exists(path)
        {
            path_delete(path);
        }
    }
    
    // HAS HIT & MODIFIER LISTS
    ds_list_destroy(has_hit);
    ds_list_destroy(attack_modifier_list);
