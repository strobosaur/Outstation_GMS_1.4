///send_statsmap(id, a. type, attribute, amount);

    var attribute = argument2;
    var amount = argument3;
    // STATSBOOK ID
    var id_obj = ds_map_find_value(global.statsbook, argument0);
    // STATS ATR ARRAY
    var st_obj = ds_map_find_value(id_obj, argument1);
    // SINGLE ATTRIBUTE
    
    if amount == -1
    {
        // REPLACE WHOLE ARRAY
        ds_map_delete(id_obj, argument1);
        ds_map_add(id_obj, argument1, argument2);
    }
    else
    {
        // UPDATE THE STATS & REPLACE
        st_obj[argument2] += argument3;//? argument2] += argument3;
        
        ds_map_delete(id_obj, argument1);
        ds_map_add(id_obj, argument1, st_obj);
    }
    
    debug = 0;
    
/*    if argument2 == -1 { return id_obj = ds_map_find_value(global.statsbook, argument0); }
    else { return ds_list_find_value(global.statsbook, argument2); }

    
