///fightstate()
        
    var hit_return = -1;
    
    var wp_shots = ceil(eq_wpn[? "shots"] + check_bonus_list(attack_modifier_list, "shots", id));
    var wp_swarm = ceil(eq_wpn[? "swarm"] + check_bonus_list(attack_modifier_list, "swarm", id));
    var wp_atkspd1 = get_atkspd(eq_wpn, attack_modifier_list, id);
    var wp_atkspd2 = eq_wpn[? "atkspd2"] + check_bonus_list(attack_modifier_list, "atkspd2", id);

    // CAN ATTACK? ===== ===== ===== ===== ===== ===== ===== =====
    if (stats_a[?"shots fired"] < wp_shots) 
//    && (timers[timer.wp01] <= 0)
    && (timers[timer.wp02] <= 0) 
    {
        // SHOT SOUND
        weapon_sound();
    
        // MUZZLE
        if !eq_wpn[?"melee"]
        {
            var mzdir = random(360);
            var mzdist = random(2.5);
            fire_x = (x + lengthdir_x(6.5, dir)) + lengthdir_x(mzdist, mzdir);
            fire_y = ((y-1.75) + lengthdir_y(4, dir)) + lengthdir_y(mzdist, mzdir);
            
            make_muzzle(depth);
        }
        
        // SET TIMERS TO RELOAD / BURST
        timers[timer.wp02] = wp_atkspd2
        timers[timer.wp01] = wp_atkspd1
        
        // SWARM BEHAVIOUR
        repeat(ceil(wp_swarm))
        {
            // HAS CRITICAL HIT? / CRITICAL CHANCE
            if critical_hit == false 
            { 
                critical_hit = get_critical(eq_wpn, attack_modifier_list, id);
            }
            
            // ACT IS FIGHTING
            act = FIGHT;
            
            // ACT FIGHTING / WEAPON ANIMATION
            if instance_exists(o_weapon)
            {
                o_weapon.act = FIGHT;
                image_speed = 0.5;
            }
            else
            {
                act = FIGHT;
                image_speed = 0.5;
            }
            
            // ATTACK TYPE
            switch(eq_wpn[? "type"])
            {
                case 0:
                hit_return = melee_attack();
                break;
                
                case 1:
                hit_return = shoot(dir);
                break;
                
                case 2:
                shoot_obj(oBullet01);
                break;
                
                case 3:
                hit_return = shoot_splash(dir, 0, 1);
                break;
                
                case 4:
                shoot_grenade(oGrenade01, 0.25, rnd(0.025, 0.0002), false);
                break;
                
                case 5:
                shoot_grenade(oGrenade01, 0.25, rnd(0.025, 0.0002), true);
                break;
            }
        
            // CRITICAL RESET
            critical_hit = false;
        }
        
        // SHOT HAS BEEN FIRED
        stats_a[?"shots fired"]++;
    }
    
    // HIT BLIP
    if hit_return > 0
    {       
        // HITSOUND
        audio_play_sound(choose(sndHit06), 5, false);
    }
    
    // RETURN
    return hit_return;
