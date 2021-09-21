///shoot_splash(dir, falloff, knockback)

//    var radius = argument1;
    var foff = argument1;
    var knock = argument2;
    
    // RETURN
    var hit_return = -1;
    var ret_this_shot = 0;
    var hit_damage = 0;
    var hitbox = BULLET_HITBOX;
    
    // HAS HIT LIST
    ds_list_clear(has_hit);
    
    // FIRE X & Y
    var mzdir = random(360);
    var mzdist = random(2.5);
    fire_x = (x + lengthdir_x(8.5, dir)) + lengthdir_x(mzdist, mzdir);
    fire_y = ((y-1.75) + lengthdir_y(5, dir)) + lengthdir_y(mzdist, mzdir);

    // WEAPON STATS & ATTACK PARAMETERS    
    var wp_acc = get_spread(eq_wpn, attack_modifier_list, id);
    var wp_pen = ceil(get_penetration(eq_wpn, attack_modifier_list, id));
    var wp_range = ceil(min(get_range(eq_wpn, attack_modifier_list, id), point_distance(fire_x, fire_y, tgtx, tgty)));
    wp_range = wp_range + (wp_range * (random(0.02 * wp_acc)));
    
//    var wp_swarm = ceil(eq_wpn[? "swarm"] + check_bonus_list(attack_modifier_list, "swarm"))
    var wp_multiplier = stats_a[?"base multiplier"] + eq_wpn[?"multiplier"] + check_bonus_list(attack_modifier_list, "multiplier", id)
    // SPLASH DAMAGE
    var wp_splash = eq_wpn[? "splash"] + check_bonus_list(attack_modifier_list, "splash", id)
    var wp_radius = eq_wpn[? "radius"] + check_bonus_list(attack_modifier_list, "radius", id)
    // KNOCKBACK AND SUPPRESSION
    var wp_knock = (eq_wpn[? "knock"] + check_bonus_list(attack_modifier_list, "knock", id)) * (1 + (0.5 * critical_hit));
    var wp_suppr = eq_wpn[? "suppr"] + check_bonus_list(attack_modifier_list, "suppr", id)
    var wp_shock = eq_wpn[? "shock"] + check_bonus_list(attack_modifier_list, "shock", id)
    
    // RADIUS
    var rad = (rnd(wp_radius, wp_radius * 0.125));
    
    // SHOOT BULLET
//    repeat(wp_swarm)
    {
        // SHOOT        
        var sdir = argument0 + rnd(0, wp_acc);
        ret_this_shot = 0;
    
        // TRAIL        
        for(var i = 0; i <= ceil(wp_range)+1; i++)
        {
            var xx = fire_x + lengthdir_x(i, sdir);
            var yy = fire_y + lengthdir_y(i, sdir);
            
            // PARTICLES
            if random(1) < approach(0, 1, ease_in_sine(i / 128, 0, 1, 1)) * 0.65 
            { 
                part_particles_create(global.ps, xx, yy, global.pt_x2, 3); 
            }
            
            // MISS
            if i >= floor(wp_range) 
            || global.bullet_grid[# (xx div CELL)-1, (yy div CELL)-1] == 1
            {
                // DAMAGE CALCULATION
                hit_damage = get_damage(eq_wpn, attack_modifier_list, id);
                if critical_hit {hit_damage *= wp_multiplier;}
                
                // SPLASH DMG
                ret_this_shot += splash_damage(xx, yy, rad, enemy, hit_damage * wp_splash, foff);
                make_shockwave(xx, yy, wp_radius * 1.35, enemy, wp_knock, wp_suppr, wp_shock);
                // EXPLOSION
                make_explosion(xx, yy, wp_radius, sdir, 1);
                // SHADER FLASH
                sh_chrome_shake(3, 3.5, 7, 2.5 + (ret_this_shot / 250));
                
                // RETURN DAMAGE COUNT
                hit_return += ret_this_shot;
                
                break;
            }
            
            // HIT
            var inst = collision_rectangle(xx-(hitbox/2), yy-(hitbox/2), xx+(hitbox/2), yy+(hitbox/2), enemy, false, true);
            if inst != noone
            {
                // CHECK IF ALREADY HAS BEEN HIT
                if ds_list_find_index(has_hit, inst) == -1 
                && inst.stats_a[?"hp"] > 0
                {
                    // ADD TO HIT LIST
                    ds_list_add(has_hit, inst);
                    hit_return = 0;
                    // GET DAMAGE
                    hit_damage = get_damage(eq_wpn, attack_modifier_list, id);
                    if critical_hit {hit_damage *= wp_multiplier;}
                    
                    // CHANCE TO HIT
                    if tohit_roll(id, inst) 
                    {
                        // SPLASH DMG
                        ret_this_shot += do_damage(hit_damage, id, inst);
                    }
                    // MAX PENETRATION
                    if ds_list_size(has_hit) >= wp_pen
                    {
                        // SPLASH DMG
                        ret_this_shot += splash_damage(xx, yy, rnd(wp_radius, wp_radius * 0.125), enemy, hit_damage * wp_splash, foff)
                        // SHOCKWAVE
                        make_shockwave(xx, yy, wp_radius * 1.5, enemy, wp_knock, wp_suppr, wp_shock);
                        
                        // BLOOD?
                        spill_blood(xx, yy, ret_this_shot, dir);
                        // EXPLOSION
                        make_explosion(xx, yy, wp_radius + lerp(hit_damage, 4, 0.85), sdir, 1);
                        // SHADER FLASH
                        sh_chrome_shake(4, 4.5, 8, 3.5 + (ret_this_shot / 250));
            
                        // BOOM SOUND
                        audio_play_sound(choose(sndBoom03), 25, false);
                        
                        // RETURN
                        hit_return += ret_this_shot;
                        
                        break;
                    }
                }
            }
        }
    }
            
    // BOOM SOUND
    audio_play_sound(choose(sndBoom03), 25, false);
    
    // RETURN
    return hit_return;
