///equip_item(item, slot, y/n);

    var new_item = argument0;
    var in_slot = argument1;
    var do_equip = argument2;
    
    //UNEQUIP?
    if !do_equip
    {
        // NO SLOT GIVEN
        if in_slot == -1 { exit; }
        
        // CURRENT EQUIPPED ITEMS
        var equipped = ds_map_find_value(item_map, in_slot);
        
        // SLOT OCCUPIED?
        if equipped != -1
        {
            to_inventory(equipped);
            update_item_stats(equipped, false);
            if in_slot == eqp.weapon
            {
                ds_map_replace(item_map, in_slot, unit_data.weapons[?"unarmed"]);
                eq_wpn = unit_data.weapons[?"unarmed"];
            }
            else
            {
                ds_map_replace(item_map, in_slot, -1);
            }
        }
        // EXIT
        exit;
    }
    
    // EQUIPMENT SLOTS IF NONE GIVEN
    if in_slot == -1 || new_item[? "itemtype"] == itemtype.turret
    {
        // NEW ITEM TYPE
        var type = ds_map_find_value(new_item, "itemtype");
        
        if type == itemtype.weapon {in_slot = eqp.weapon;}
        if type == itemtype.armor {in_slot = eqp.torso;}
        if type == itemtype.headgear {in_slot = eqp.head;}
        if type == itemtype.implant1 {in_slot = eqp.implant1;}
        
        if type == itemtype.turret {in_slot = eqp.weapon;}
    }
    
    // NEW ITEM TYPE
    var type = ds_map_find_value(new_item, "itemtype");
    
    // IF TURRET, TREAT AS WEAPON
    if type == itemtype.turret 
    { 
        type = itemtype.weapon; 
    }
    
    // CURRENT EQUIPPED ITEMS
    var equipped = ds_map_find_value(item_map, in_slot);
    
    // SLOT OCCUPIED?
    if equipped != -1// && equipped[? "itemtype"] != -1
    {
        // TO INVENTORY
        to_inventory(equipped);
        // REMOVE STATS
        update_item_stats(equipped, false);
        // EMPTY THE SLOT
        ds_map_replace(item_map, in_slot, -1);
    }
    
    // WEAPON
    if type == itemtype.weapon 
    || type == itemtype.turret
    {
        // EQUIP WEAPON
        new_weapon(new_item);
    }
    
    // EQUIP ARMOR
    if type == itemtype.armor
    {        
        // EQUIP NEW ONE
        ds_map_replace(item_map, in_slot, new_item);
        // EQUIPMENT LINK
        eq_armor = new_item;
        
        // UPDATE STATS
        update_item_stats(new_item, true);
    }
    
    // EQUIP IMPLANT
    if type == itemtype.implant1
    {
        // EQUIP NEW IMPLANT
        ds_map_replace(item_map, in_slot, new_item);
        
        // SLOT 1 / 2
        if in_slot == itemtype.implant1
        {
            eq_implant_01 = new_item;
        }
        else
        {
            eq_implant_02 = new_item;
        }
        
        // UPDATE STATS
        update_item_stats(new_item, true);
    }
        
    //DONT DELETE UNARMED
    if new_item[? "itemtype"] != -1
    {
        // REMOVE FROM INVENTORY
        var list = global.inventory[| new_item[? "itemtype"]];
        var pos = ds_list_find_index(list, new_item);
        ds_list_delete(list, pos);
    }
