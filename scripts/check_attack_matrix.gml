///check_attack_matrix(eq. weapon, a. matrix, bonus type)

    var wpn_map = argument0;
    var atk_amx = argument1;
    var b_type = argument2;
    var wp_type = wpn_map[? "sklt"];
    
    if wp_type == skills.skl_rw {wp_type = skills.skl_lw;}
    if wp_type == skills.skl_fw {wp_type = skills.skl_mw;}
    if wp_type == skills.skl_bw {wp_type = skills.skl_mw;}
    
    if b_type
    
    var ret = 0;
    
    // ATTACK SPEED IS MULTIPLIED
    if b_type == amx.atk_spd
    {
        ret = wpn_map[? "atkspd"]
        // CHECK MATRIX    
        for (var i = 0; i < wpntype.stop; i++)
        {
            if wp_type == i
            {
                ret *= (1 + atk_amx[i, b_type]);
            }
        }
        // RANGED / MELEE
        if wpn_map[? "melee"]
        {
            ret *= (1 + atk_amx[wpntype.mlw, b_type]);
        }
        else
        {
            ret *= (1 + atk_amx[wpntype.rngw, b_type]);
        }
        // ALL WEAPON BONUSES
        ret *= (1 + atk_amx[wpntype.allw, b_type]);
    }
    // NOT MULTIPLIED
    else
    {
        // CHECK MATRIX    
        for (var i = 0; i < wpntype.stop; i++)
        {
            if wp_type == i
            {
                ret += atk_amx[i, b_type];
            }
        }
        // RANGED / MELEE
        if wpn_map[? "melee"]
        {
            ret += atk_amx[wpntype.mlw, b_type];
        }
        else
        {
            ret += atk_amx[wpntype.rngw, b_type];
        }
        // ALL WEAPON BONUSES
        ret += atk_amx[wpntype.allw, b_type];
    }
    
    return ret;
 
