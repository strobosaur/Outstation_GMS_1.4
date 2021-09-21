///unequip_item(itemtype)

    var type = argument0;
    
    // CURRENT EQUIPPED ITEMS
    var equipped = ds_map_find_value(item_map, type);
    
    // RETURN TO INVENTORY
    to_inventory(equipped);
    ds_map_replace(item_map, type, -1);

    
