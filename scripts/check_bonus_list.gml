///check_bonus_list(bonus list, bonus type, for who)

    var bonus_list = argument0;
    var bonus_type = argument1;
    var bonus_owner = argument2;
    
    var bonus_array = 0;
    var return_value = 0;
    var bonus_value = 0;
            
    return_value = 0;
    
    // IF LIST OR OWNER DOES NOT EXIST, RETURN 0
    if !ds_exists(bonus_list, ds_type_list)
    || !instance_exists(bonus_owner)
    {
        return 0;
    }
    
    // CHECK BONUS LIST FOR BONUS TYPE
    for (var i = 0; i <= ds_list_size(bonus_list)-1; i++)
    {
        if bonus_type == "atkspd2" { bonus_type = "atkspd";}
        bonus_array = ds_list_find_value(bonus_list, i);
        
        // IF HAS BONUS TYPE
        if bonus_array[itembonus.type] == bonus_type
        {
            var stat_type = bonus_array[itembonus.statstype];
            var base_value = 0;
        
            // CHECK WEAPON TYPE
            var weapon_type = bonus_array[itembonus.wpntype];
            var equipped_type = bonus_owner.eq_wpn[?"sklt"];
            
            // IF TYPE IS NOT ALL WEAPONS
            if weapon_type != wpntype.allw
            {
                // RIFLE, BLADE, FIST
                if equipped_type == wpntype.fw {equipped_type = wpntype.mlw; }
                if equipped_type == wpntype.bw {equipped_type = wpntype.mlw;}
                if equipped_type == wpntype.rw {equipped_type = wpntype.lw;}
                
                // IF WEAPON RIGHT TYPE, PROCEED
                if weapon_type == wpntype.rngw && bonus_owner.eq_wpn[?"melee"] == false
                || weapon_type == wpntype.mlw && bonus_owner.eq_wpn[?"melee"] == true
                || weapon_type == equipped_type
                {
//                    continue;
                }
                else
                {
                // IF WRONG TYPE; RETURN 0
                    return 0;
                }
            }
            
            if argument1 == "atkspd2" { bonus_type = "atkspd2";}
            // GET BASE VALUE FROM STATS TYPE
            switch stat_type
            {
                case statstype.stats_w:
                base_value = bonus_owner.eq_wpn[? bonus_type];
                break;
                
                case statstype.stats_b:
                base_value = bonus_owner.b_stats[bonus_type];
                break;
                
                case statstype.stats_am:
                base_value = bonus_owner.a_matrix[wpntype.allw, bonus_type];
                break;
                
                case statstype.stats_dm:
                base_value = bonus_owner.d_matrix[bonus_type];
                break;
                
                case statstype.stats_a:
                base_value = bonus_owner.a_stats[? bonus_type];
                break;
            }
            
            // RESET
            bonus_value = 0;
            // CHECK BONUS OPERATION
            switch bonus_array[itembonus.operation]
            {
                // ADDITION
                case operation.add:
                bonus_value += bonus_array[itembonus.amount];
                break;
                
                // SUBTRACTION
                case operation.subtract:
                bonus_value -= bonus_array[itembonus.amount];
                break;

                // MULTIPLICATION
                case operation.multiply:
                bonus_value += (base_value * bonus_array[itembonus.amount]);
                break;

                // DIVISION
                case operation.divide:
                if return_value == 0
                {
                    bonus_value -= (base_value * bonus_array[itembonus.amount]);
                }
                else
                {
                    bonus_value -= (return_value * bonus_array[itembonus.amount]);
                }
                break;
            }
            
            // ADD TO RETURN VALUE
            return_value += bonus_value;
            bonus_value = 0;
        }
    }
    
    // RETURN VALUE
    return return_value;
