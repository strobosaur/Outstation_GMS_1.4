///shoot(stats array, weapons array, dir);

//    var s_array = argument0;
//    var w_array = argument1;
//    var s_dir = argument2;
    
    // RETURN
    var hit_return = 0;
    var hit_damage = 0;
    var ret_this shot = 0;
    var hitbox = BULLET_HITBOX;
    
    // HAS HIT LIST
    ds_list_clear(has_hit);
    
    // FIRE X & Y
    var mzdir = random(360);
    var mzdist = random(2.5);
    fire_x = (x + lengthdir_x(6.5, dir)) + lengthdir_x(mzdist, mzdir);
    fire_y = ((y-1.75) + lengthdir_y(4, dir)) + lengthdir_y(mzdist, mzdir);

    // WEAPON STATS & ATTACK PARAMETERS    
    var wp_acc = get_spread(eq_wpn, attack_modifier_list, id);
    var wp_pen = ceil(get_penetration(eq_wpn, attack_modifier_list, id));
    var wp_range = ceil(min(get_range(eq_wpn, attack_modifier_list, id), point_distance(fire_x, fire_y, tgtx, tgty)))
    wp_range = wp_range + (wp_range * random(0.025 * wp_acc))

    var wp_swarm = ceil(eq_wpn[? "swarm"] + check_bonus_list(attack_modifier_list, "swarm", id))
    var wp_multiplier = stats_a[?"base multiplier"] + eq_wpn[?"multiplier"] + check_bonus_list(attack_modifier_list, "multiplier", id)
    // SPLASH DAMAGE
    var wp_splash = eq_wpn[? "splash"] + check_bonus_list(attack_modifier_list, "splash", id)
    var wp_radius = eq_wpn[? "radius"] + check_bonus_list(attack_modifier_list, "radius", id)
    // KNOCKBACK AND SUPPRESSION
    var wp_knock = (eq_wpn[? "knock"] + check_bonus_list(attack_modifier_list, "knock", id)) * (1 + (0.5 * critical_hit));
    var wp_suppr = eq_wpn[? "suppr"] + check_bonus_list(attack_modifier_list, "suppr", id)
    var wp_shock = eq_wpn[? "shock"] + check_bonus_list(attack_modifier_list, "shock", id)
    
    // SHOOT BULLET    
//    repeat(wp_swarm)
    {
        // SHOOT        
        var sdir = argument0 + rnd(0, wp_acc);
        
        //RESET DAMAGE COUNT
        ret_this_shot = 0;
        
        // TURRET RANDOM
        if eq_wpn[? "itemtype"] == itemtype.turret { wp_range *= random_range(0.8, 1.2); }
    
        // TRAIL        
        for(var i = 0; i <= ceil(wp_range)+1; i++)
        {
            var xx = fire_x + lengthdir_x(i, sdir);
            var yy = fire_y + lengthdir_y(i, sdir);
            
            // TRACE PARTICLES
            if random(1) < approach(0, 1, ease_in_sine(i / 75, 0, 1, 1)) * 0.5 
            { 
                part_particles_create(global.ps, xx, yy, global.pt_x, 1); 
            }
            // FLASH PARTICLES
            part_particles_create(global.ps, xx, yy, global.pt_shot2, 1);
            
            // MISS / HITS WALL / OUT OF RANGE
            if i >= ceil(wp_range) 
            || global.bullet_grid[# (xx div CELL)-1, (yy div CELL)-1] == 1
            {
//                instance_create(xx, yy, oMissfx01);

                // DAMAGE
                hit_damage = get_damage(eq_wpn, attack_modifier_list, id)
                if critical_hit { hit_damage *= wp_multiplier; }
                // SPLASH?
                if wp_splash > 0 {ret_this_shot += splash_damage(xx, yy, wp_radius, enemy, hit_damage * wp_splash, 0); }
                make_boom(xx, yy, wp_radius);
                make_dust(xx, yy, 2 + round(hit_return / 10), 4 + round(hit_return / 10), sdir, random(0.75))
                // KNOCKBACK
                make_shockwave(xx, yy, wp_radius, enemy, wp_knock*0.5, wp_suppr, wp_shock);
                
                // RETURN DAMAGE COUNT
                hit_return += ret_this_shot;
                
                break;
            }
            
            // HIT
            var inst = collision_rectangle(xx-(hitbox/2), yy-(hitbox/2), xx+(hitbox/2), yy+(hitbox/2), enemy, false, true);
            if inst != noone //instance_place(xx, yy, enemy)
            {
                // CHECK IF ALREADY HAS BEEN HIT
                if ds_list_find_index(has_hit, inst) == -1 
                && inst.stats_a[?"hp"] > 0
                {
                    // ADD TO HIT LIST
                    ds_list_add(has_hit, inst);
                    
                    // DEAL DAMAGE
                    hit_damage = get_damage(eq_wpn, attack_modifier_list, id)
                    if critical_hit { hit_damage *= wp_multiplier;}
                    
                    // CHANCE TO HIT
                    if tohit_roll(id, inst) 
                    {
                        // DO DAMAGE
                        ret_this_shot += do_damage(hit_damage, id, inst);
                        
                        // KNOCKBACK
                        knockback(inst, dir, wp_knock);
                        // HITFX
                        make_boom(xx, yy, min(wp_radius + 16, wp_radius + ret_this_shot * 0.0625) * rnd(1, 0.1));
                        // BLOOD?
                        spill_blood(xx, yy, ret_this_shot, sdir);
                        // CRITICAL FX
                        if critical_hit
                        {
                            make_critical_fx(fire_x, fire_y, hit_damage, inst);
                        }
                    }
                    // MAX PENETRATION
                    if ds_list_size(has_hit) >= wp_pen
                    {
                        make_shockwave(xx, yy, wp_radius, enemy, wp_knock*0.5, wp_suppr, wp_shock);
                        // SPLASH?
                        if wp_splash > 0 {ret_this_shot += splash_damage(xx, yy, wp_radius, enemy, hit_damage * wp_splash, 0); }
                        
                        // RETURN
                        hit_return += ret_this_shot;
                        
                        break;
                    }
                }
            }
        }
    }
    
    // RETURN DAMAGE
    return hit_return;
