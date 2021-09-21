///update_item_stats(item, equip y/n)

    var stats_item = argument0;
    var equip = argument1;
    
    // WHICH WAY
    if equip == false { equip = -1; }
    
    // ARMOR ========== ========== ==========
    if stats_item[? "itemtype"] == itemtype.armor
    {
        // HP BONUS
        var hp_ratio = (stats_a[?"hpmax"] + stats_item[? "amr_hpmax"] * equip) / stats_a[?"hpmax"];
        stats_a[?"hpmax"] += stats_item[? "amr_hpmax"] * equip;
        stats_a[?"hp"] *= hp_ratio;
    }
    
    // IMPLANT ========== ========== ==========
    if stats_item[? "itemtype"] == itemtype.implant1
    {
        // IF EQUIPPING : ADD BONUS ARRAY TO LIST
        var array_list = ds_map_find_value(stats_item, "array list");
        
        // LOOP THRU ARRAY LIST AND COPY / REMOVE
        for (var i = 0; i <= ds_list_size(array_list)-1; i++)
        {
            var bonus_array = ds_list_find_value(array_list, i);
             //ds_map_find_first(stats_item);
             
             // IF EQUIPPING...
            if argument1 == true
            {
                ds_list_add(attack_modifier_list, bonus_array);
            }
            // IF UNEQUIPPING : REMOVE ARRAY FROM LIST
            else
            {
                ds_list_delete(attack_modifier_list, ds_list_find_index(attack_modifier_list, bonus_array));
            }
        }
    }
