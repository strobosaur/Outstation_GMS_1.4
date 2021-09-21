///tohit_roll(attacker, defender)

    var attacker = argument0;
    var defender = argument1;
    
    // GET DEFENDER DEFENSE MATRIX
//    var deqp = get_statsmap(defender, statstype.stats_i, -1);
//    var def_armor = deqp[eqp.torso];

    // BASE AC
    var def_ac = defender.stats_a[?"base ac"];
    
    // ARMOR EXTRA AC
    if ds_exists(defender.eq_armor, ds_type_map)
    {
        def_ac += defender.eq_armor[?"amr_ac"];
    }
    
    // DICE
    var toh_rolls = attacker.eq_wpn[? "th_rolls"] + attacker.stats_a[?"base th_rolls"];
//    var toh_dice = attacker.eq_wpn[? "th_sides"];
    var toh_dice = 20;
    var toh_plus = attacker.eq_wpn[? "th_plus"] + attacker.stats_a[?"base th_plus"] + check_bonus_list(attack_modifier_list, "th_plus", attacker);
    
    // ROLL DICE
    repeat(ceil(toh_rolls))
    {
        var d_roll = dice_roll(1, ceil(toh_dice))
        
        if (d_roll + toh_plus) > def_ac
        {
            // HIT
            return true;
        }
    }
    
    // MISS
    return false;

