///get_statsmap(id, attribute type, attribute/-1);

    // STATSBOOK ID
    var id_obj = ds_map_find_value(global.statsbook, argument0);
    // ARRAY ATTRIBUTE TYPES
    var st_obj = ds_map_find_value(id_obj, argument1);
    // SINGLE STAT FROM ARRAY
    
    if argument2 == -1 
    { 
        return st_obj; 
    }
    else 
    { 
        var atr = st_obj[argument2];
        return atr; 
    }
