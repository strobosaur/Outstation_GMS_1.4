///get_ac(who, armor, base armor)

    var owner = argument0;
    var armor = argument1;
    var b_armor = argument2;
    
    var amr_total = 0;
    
    amr_total += owner.stats_a[?"base ac"];
    if armor != -1
    {
        amr_total += armor[?"amr_ac"];
    }
    
    amr_total += b_armor[?"amr_ac"];
    
    return amr_total;
