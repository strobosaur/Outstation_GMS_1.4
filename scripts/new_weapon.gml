///new_weapon("weapon name");
   
    // EQUIP THIS WEAPON
    var new_wpn = argument0
    
    // UNEQUIP THIS WEAPON
    var old_weapon = ds_map_find_value(item_map, itemtype.weapon);
    
    // UNARMED
    if new_wpn == -1
    {
        new_wpn = unit_data.weapons[? "unarmed"];
        eq_wpn = new_wpn;
    }
    
    // REPLACE OLD ONE
    if old_weapon != -1
    {
        if old_weapon[? "itemtype"] != -1 && enemy == par_enemy
        {
            to_inventory(old_weapon);
        }
        update_item_stats(old_weapon, false);
        ds_map_replace(item_map, itemtype.weapon, new_wpn);
        eq_wpn = item_map[? itemtype.weapon];
    }
    else
    {
        ds_map_replace(item_map, itemtype.weapon, new_wpn);
        eq_wpn = item_map[? itemtype.weapon];
    }
    
    // MAKE NEW STATS
    update_item_stats(new_wpn, true);
    
    // WEAPON SPRITE
    wpnspr = new_wpn[? "wspr"];
    
