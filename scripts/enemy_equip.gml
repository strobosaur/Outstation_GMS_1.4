///enemy_equip(item map, in slot)

    var new_item = argument0;
    var in_slot = argument1;
    
    var old_item = item_map[? in_slot];
    if in_slot == eqp.weapon
    {
        new_weapon(new_item);
    }
    else
    {
        ds_map_replace(item_map, in_slot, new_item);
        update_item_stats(new_item, true);
    }
