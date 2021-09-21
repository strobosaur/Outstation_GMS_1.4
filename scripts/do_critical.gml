///do_critical(x, y, damage amount, attacker, target)
    
    var xx = argument0;
    var yy = argument1;
    var damage_amount = argument2;
    var attacker = argument3;
    var defender = argument4;
    
    var target = attacker.enemy;
    var hit_return = -1;
    
    // ATTACK MATRIX
    var crt_multiplier = 2 + check_attack_matrix(eq_wpn, a_matrix, amx.crt_multiplier);
    
    // CRIT MODIFIERS   
    var crt_splash = 0;
    var crt_knock = 0;
    var crt_suppr = 0;
    var crt_shock = 0;
    var crt_lifesteal = 0;
    var crt_explosive = 0;
    
    // ATTACK PARAMETERS
    var wp_knock = eq_wpn[? "knock"] + check_attack_matrix(eq_wpn, a_matrix, amx.knock);
    var wp_suppr = eq_wpn[? "suppr"] + check_attack_matrix(eq_wpn, a_matrix, amx.suppr);
    var wp_shock = eq_wpn[? "shock"] + check_attack_matrix(eq_wpn, a_matrix, amx.shock);
    
    var wp_splash = eq_wpn[? "splash"] + check_attack_matrix(eq_wpn, a_matrix, amx.splash);
    var wp_radius = eq_wpn[? "radius"] + check_attack_matrix(eq_wpn, a_matrix, amx.splash_r);
    
    // CRIT BONUSES
    if !is_undefined(crt_matrix)
    {
        // CHECK EACH WEAPON TYPE
        for (var i = 0; i < wpntype.stop; i++)
        {
            // CRIT MULTIPLIER
            if crt_matrix[i, crts.multiplier] != 0
            {
                crt_multiplier += crt_matrix[i, crts.multiplier];
            }
            // SPLASH DAMAGE
            if crt_matrix[i, crts.splash] != 0
            {
                crt_splash += crt_matrix[i, crts.splash];
            }
            // SPLASH DAMAGE
            if crt_matrix[i, crts.knock] != 0
            {
                crt_knock += crt_matrix[i, crts.knock];
            }
            // SPLASH DAMAGE
            if crt_matrix[i, crts.shock] != 0
            {
                crt_shock += crt_matrix[i, crts.shock];
            }
            // SPLASH DAMAGE
            if crt_matrix[i, crts.lifesteal] != 0
            {
                crt_splash += crt_matrix[i, crts.lifesteal];
            }
            // EXPLOSIVE DAMAGE
            if crt_matrix[i, crts.explosive] != 0
            {
                crt_explosive += crt_matrix[i, crts.explosive];
            }
        }
    }
    
    // BLOOD DIRECTION
    var blood_dir = point_direction(attacker.x, attacker.y, defender.x, defender.y);
    
    // MULTIPLY DAMAGE
    damage_amount *= crt_multiplier;
    
    // SPLASH DAMAGE
    if crt_splash > 0 || eq_wpn[?"splash"] > 0
    {
        hit_return += splash_damage(xx, yy, eq_wpn[? "radius"], target, damage_amount, min(2, crt_splash + eq_wpn[?"splash"]));
        // MAKE BLOOD DUST
        var blood_amount = min(damage_amount, defender.b_stats[b_stats.hpmax] * 2);
        repeat(1)
        {
            make_blood_dust(defender.x, defender.y-4, 3 + round(damage_amount / 20), eq_wpn[?"radius"] * 0.8, rnd(dir, 20), 1, true);
        }
    }
    
    // EXPLOSIVE DAMAGE
    if crt_explosive > 0
    {
        hit_return += splash_damage(xx, yy, eq_wpn[? "radius"], target, damage_amount, min(2, crt_splash + eq_wpn[?"splash"]));
        // SHOCKWAVE
        make_shockwave(xx, yy, wp_radius * 1.5, enemy, wp_knock, wp_suppr, wp_shock);
        // BLOOD?
        spill_blood(xx, yy, hit_return, dir);
        // EXPLOSION
        make_explosion(xx, yy, wp_radius + lerp(damage, 4, 0.85), sdir, 1);
        // SHADER FLASH
        sh_chrome_shake(4, 4.5, 8, 3.5 + (hit_return / 250));
        // MAKE BLOOD DUST
        var blood_amount = min(damage_amount, defender.b_stats[b_stats.hpmax] * 2);
        repeat(1)
        {
            make_blood_dust(defender.x, defender.y-4, 3 + round(damage_amount / 20), eq_wpn[?"radius"] * 0.8, rnd(dir, 20), 1, true);
        }
    }
    // KNOCKBACK
    if crt_knock > 0
    {
        knockback(defender, blood_dir, crt_knock);
    }
    // SUPPRESSION AND SHOCK
    if crt_suppr > 0 || crt_shock > 0
    {
        make_shockwave(xx, yy, eq_wpn[? "radius"], target, 0, crt_suppr, crt_shock);
    }
    // LIFESTEAL
    if crt_lifesteal > 0
    {
        var steal = min(damage_amount * crt_lifesteal, defender.b_stats[b_stats.hp]);
        b_stats[b_stats.hp] = approach(b_stats[b_stats.hp], b_stats[b_stats.hpmax], steal);
    }
        
    // MAKE BLOOD DUST
    var blood_amount = min(damage_amount, defender.b_stats[b_stats.hpmax] * 2);
    repeat(1)
    {
        make_blood_dust(defender.x, defender.y-4, 3 + round(damage_amount / 20), 14 + round(damage_amount / 10), rnd(blood_dir, 20), 1, true);
    }
    
    // DEAL DAMAGE
    hit_return = do_damage(damage_amount, attacker, defender);
    
    // RETURN CRIT DAMAGE
    return hit_return;
