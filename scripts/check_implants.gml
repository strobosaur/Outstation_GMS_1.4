///check_implants(bonus type, bonus list)

    var bonus_type = argument0;
    var bonus_list = argument1;

//    var implant_01 = item_map[? eqp.implant1]
//    var implant_02 = item_map[? eqp.implant2]
    
    var bonus_array = 0;
    
    // CHECK BONUS LIST FOR BONUS TYPE
    for (var i = 0; i <= ds_list_size(bonus_list)-1; i++)
    {
        bonus_array = ds_list_find_value(bonus_list, i);
    
//        var bonus_array = implant_01[? "bonus 1"];
        
        // IF HAS BONUS TYPE
        if bonus_array[itembonus.type] == bonus_type//ds_map_exists(implant_01, bonus_type)
        {
            var stat_type = bonus_array[itembonus.statstype];
            var return_value = 0;
            var base_amount = 0;
        
            // CHECK WEAPON TYPE
            var weapon_type = bonus_array[itembonus.wpntype];
            if weapon_type != wpntype.allw
            {
                // IF WRONG TYPE; RETURN 0
                if weapon_type != eq_wpn[? "sklt"]
                {
                    return 0;
                }
            }
            
            // GET BASE VALUE FROM STATS TYPE
            switch stat_type
            {
                case statstype.stats_w:
                base_amount = eq_wpn[? bonus_type];
                break;
                
                case statstype.stats_b:
                base_amount = b_stats[bonus_type];
                break;
                
                case statstype.stats_am:
                base_amount = a_matrix[wpntype.allw, bonus_type];
                break;
                
                case statstype.stats_dm:
                base_amount = d_matrix[bonus_type];
                break;
                
                case statstype.stats_a:
                base_amount = a_stats[bonus_type];
                break;
            }
            
            // CHECK BONUS OPERATION
            switch bonus_array[itembonus.operation]
            {
                // ADDITION
                case operation.add:
                return_value += implant_01[? bonus_type];
                break;
                
                // SUBTRACTION
                case operation.subtract:
                return_value -= implant_01[? bonus_type];
                break;

                // MULTIPLICATION
                case operation.multiply:
                return_value += base_value * implant_01[? bonus_type];
                break;

                // DIVISION
                case operation.divide:
                return_value -= return_value * implant_01[? bonus_type];
                break;
            }
        }
    }
    
    // RETURN VALUE
    return return_value;
