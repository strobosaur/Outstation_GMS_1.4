///generate_item(type, base/name, quality, min q., max q.)

    var type = argument0;
    var template = argument1;
    var quality = argument2;
    var min_quality = round(argument3);
    var max_quality = round(argument4);
    
    if min_quality != -1
    && max_quality != -1
    {
        do
        {
            quality = weighted_random(50, 35, 10, 5, 3, 2, 1, 0.5, 0.25, 0.125);
        }
        until quality >= min_quality && quality <= max_quality
    }
    else if quality == -1
    {
        quality = weighted_random(50, 35, 10, 5, 3, 2, 1, 0.5, 0.25, 0.125);
    }
    else
    {
        return -1;
    }
    
    // IF NO TYPE AND NO TEMPLATE CHOSEN
    if type == -1
    && template == -1
    {
        type = choose(itemtype.weapon, itemtype.armor, itemtype.implant1);
    }
    
    // GET BONUS POOL DATA
    item_bonus_pool = unit_data.item_bonus_pool;
    
    // RANDOM QUALITY
    if quality == -1
    {
            quality = weighted_random(50, 35, 10, 5, 3, 2, 1, 0.5, 0.25, 0.125);
    }
        
    var item = ds_map_create();
    var base = argument1;
    
    // WEAPON ===== ===== ===== ===== ===== ===== ===== ===== =====
    if type == itemtype.weapon 
    || type == itemtype.melee_weapon
    || type == itemtype.ranged_weapon
    || type == itemtype.turret
    {
        if template == -1
        {
            // RANDOM TEMPLATE BY WEAPON TYPE
            switch type
            {
                case itemtype.weapon:
                template = choose("machinegun", "shotgun", "rifle", "powerfist", "blade", "blaster", "g. launcher");
                break;
                
                case itemtype.melee_weapon:
                template = choose("powerfist", "blade");
                break;
                
                case itemtype.ranged_weapon:
                template = choose("machinegun", "shotgun", "rifle", "blaster", "g. launcher");
                break;
                
                case itemtype.turret:
                template = choose("turret", "f. grenade", "auto cannon", "gun post", "anti tank");
                break;
            }
            
            // GET ITEM BASE MAP
            base = unit_data.weapons[? template];
        }
        else
        {
            // ITEM TEMPLATE
            base = unit_data.weapons[? template];
        }

        // QUALITY
        var points_total = quality * 3;
        var points_spent = 0;
        var bonus_list = ds_list_create();
        
        // COPY TEMPLATE
        ds_map_copy(item, base);
        
        // CHANGE NAME
        if quality > 0 
        { 
            item[? "name"] = (template + " +" + string(quality)); 
        }
        else
        {
            item[? "name"] = (template);
        }
        
        if type == itemtype.ranged_weapon { type = itemtype.weapon;}
        if type == itemtype.melee_weapon { type = itemtype.weapon;}
        
        // ITEM TYPE
        item[? "itemtype"] = type;
        
        // NEW ITEM STATS
        while (points_spent < points_total)
        {
            var bonus_array = ds_list_find_value(item_bonus_pool, irandom(ds_list_size(item_bonus_pool)-1));            
            var bonus_value = bonus_array[itembonus.value];
            
            // WHILE POINTS TOO HIGH            
            while ((points_spent + bonus_value) > points_total)
            {
                var bonus_array = ds_list_find_value(item_bonus_pool, irandom(ds_list_size(item_bonus_pool)-1));
                var bonus_value = bonus_array[itembonus.value];
            }
                
            var bonus_type = bonus_array[itembonus.type];
            var bonus_text = bonus_array[itembonus.name];
            var text_in_list = false;
            
            // CHECK BONUS OPERATION
            switch bonus_array[itembonus.operation]
            {
                // ADDITION
                case operation.add:
                item[? bonus_type] += bonus_array[itembonus.amount];
                break;
                
                // SUBTRACTION
                case operation.subtract:
                item[? bonus_type] -= bonus_array[itembonus.amount];
                break;

                // MULTIPLICATION
                case operation.multiply:
                item[? bonus_type] += item[? bonus_type] * bonus_array[itembonus.amount];
                break;

                // DIVISION
                case operation.divide:
                item[? bonus_type] -= item[? bonus_type] * bonus_array[itembonus.amount];
                break;
            }
            
            // BONUS TEXT ADD / REPLACE
            for (var i = 1; i <= ds_list_size(bonus_list); i++)
            {
                var list_text = bonus_list[| i-1];
                if string_letters(list_text) == string_letters(bonus_text)
                {
                    text_in_list = true;
                    bonus_list[| i-1] = list_text + "+";
                }
            }
            // ADD TO LIST
            if text_in_list = false
            {
                ds_list_add(bonus_list, bonus_text);
            }
            
            // SPEND POINT VALUE
            points_spent += bonus_value;
        }
            
        ds_map_add(item, "bonus list", bonus_list);
    }
    
    // ARMOR ========================================
    if argument0 == itemtype.armor
    {
        // ITEM TEMPLATE
        if template == -1
        {
            template = choose("kevlar", "type I", "type II");
            base = unit_data.armors[? template];
        }
        else
        {
            base = unit_data.armors[? template];
        }
        
        var bonus_list = ds_list_create();
        
        // CHANGE NAME
        if quality > 0 
        { 
            item[? "name"] = (template + " +" + string(quality)); 
        }
        else
        {
            item[? "name"] = (template);
        }
        
        // STATS
        item[? "amr_ac"] = round(base[? "amr_ac"] * (1 + rnd((quality / 5), quality / 50)));
        item[? "amr_pts"] = round(base[? "amr_pts"] * (1 + rnd((quality / 6), quality / 60)));
        item[? "amr_bonus"] = round(base[? "amr_bonus"] * (1 + rnd((quality / 6), quality / 60)));
        item[? "amr_prc"] = round(base[? "amr_prc"] * (1 + rnd((quality / 6), quality / 60)));
        item[? "amr_knockback"] = round(base[? "amr_knockback"] + (quality * 4 * (1 + rnd((quality / 5), quality / 50))));
        item[? "amr_hpmax"] = round(base[? "amr_hpmax"] * (1 + rnd((quality / 5), quality / 50)));
        item[? "amr_total"] = round(base[? "amr_total"] * (1 + rnd((quality / 5), quality / 50)));
        
        // ITEM TYPE
        item[? "itemtype"] = itemtype.armor;
        
        // BONUS LIST
        ds_map_add(item, "bonus list", bonus_list);
    }
    
    // GENERATE IMPLANT ========================================
    if argument0 == itemtype.implant1
    {
        // ITEM TEMPLATE

        // QUALITY
        if template == -1 {template = "implant";}
        
        quality++;
        var points_total = quality * 1;
        var points_spent = 0;
        var bonus_list = ds_list_create();
        var array_list = ds_list_create();
        
        // COPY TEMPLATE
        
        // CHANGE NAME
        if quality > 0 
        { 
            item[? "name"] = (template + " +" + string(quality)); 
        }
        else
        {
            item[? "name"] = (template);
        }
        
        // ITEM TYPE
        item[? "itemtype"] = argument0;
        
        // ARRAY COUNTER
        var bonus_count = 0;
        
        // NEW ITEM STATS
        while (points_spent < points_total)
        {
            bonus_count++;
            
            var bonus_array = ds_list_find_value(item_bonus_pool, irandom(ds_list_size(item_bonus_pool)-1));            
            var bonus_value = bonus_array[itembonus.value];
            var text_in_list = false;
            
            // COPY ARRAY TO ITEM MAP
            ds_list_add(array_list, bonus_array);
            
            var bonus_type = bonus_array[itembonus.type];
            var bonus_text = bonus_array[itembonus.name];
            
            // BONUS TEXT ADD / REPLACE
            for (var i = 1; i <= ds_list_size(bonus_list); i++)
            {
                var list_text = bonus_list[| i-1];
                if string_letters(list_text) == string_letters(bonus_text)
                {
                    text_in_list = true;
                    bonus_list[| i-1] = list_text + "+";
                }
            }
            // ADD TO LIST
            if text_in_list = false
            {
                ds_list_add(bonus_list, bonus_text);
            }
            
            // SPEND POINT VALUE
            points_spent += bonus_value;
        }
            
        ds_map_add(item, "bonus list", bonus_list);
        ds_map_add(item, "array list", array_list);
    }
    
    // RETURN ITEM MAP
    return item;
