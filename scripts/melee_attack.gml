///melee_attack

    // TARGET CHECK
    if is_undefined(target) 
    || !instance_exists(target)
    || target.stats_a[?"hp"] <= 0
    {
        melee_attack_check();
    }
    
    var hit_return = 0;
    var ret_this_shot = 0;
    var hit_damage = 0;
    var hitbox = BULLET_HITBOX;
    
    // HAS HIT LIST
    ds_list_clear(has_hit);

    // WEAPON STATS & ATTACK PARAMETERS    
    var wp_acc = get_spread(eq_wpn, attack_modifier_list, id);
    var wp_pen = ceil(get_penetration(eq_wpn, attack_modifier_list, id));
    var wp_range = ceil(min(get_range(eq_wpn, attack_modifier_list, id), point_distance(fire_x, fire_y, tgtx, tgty)) * (1.2 + random(0.02 * get_spread(eq_wpn, attack_modifier_list, id))));
    var wp_swarm = ceil(eq_wpn[? "swarm"] + check_bonus_list(attack_modifier_list, "swarm", id))
    var wp_multiplier = stats_a[?"base multiplier"] + eq_wpn[?"multiplier"] + check_bonus_list(attack_modifier_list, "multiplier", id)
    // SPLASH DAMAGE
    var wp_splash = eq_wpn[? "splash"] + check_bonus_list(attack_modifier_list, "splash", id)
    var wp_radius = eq_wpn[? "radius"] + check_bonus_list(attack_modifier_list, "radius", id)
    // KNOCKBACK AND SUPPRESSION
    var wp_knock = (eq_wpn[? "knock"] + check_bonus_list(attack_modifier_list, "knock", id)) * (1 + (0.75 * critical_hit));
    var wp_suppr = eq_wpn[? "suppr"] + check_bonus_list(attack_modifier_list, "suppr", id)
    var wp_shock = eq_wpn[? "shock"] + check_bonus_list(attack_modifier_list, "shock", id)
                    
    // DAMAGE AMOUNT
    hit_damage = get_damage(eq_wpn, attack_modifier_list, id) * wp_multiplier
    
    // LOOP
//    repeat(wp_swarm)
    {
        dir = point_direction(x, y, target.x, target.y);
        var sdir = dir;
        // RESET SHOT DAMAGE COUNTER
        ret_this_shot = 0;
        
        // LOOP THRU RANGE
        for(var i = 0; i <= ceil(wp_range)+1; i++)
        {
            var xx = x + lengthdir_x(i, sdir);
            var yy = y + lengthdir_y(i, sdir);
            
            // MISS / HITS WALL / OUT OF RANGE
            if i >= ceil(wp_range) 
            || global.bullet_grid[# (xx div CELL)-1, (yy div CELL)-1] == 1
            {
                // SPLASH?
                if wp_splash > 0 {ret_this_shot += splash_damage(xx, yy, wp_radius, enemy, hit_damage * wp_splash, 0); }
                // SHOCKWAVE
                make_shockwave(xx, yy, wp_radius, enemy, wp_knock*0.5, wp_suppr, wp_shock);
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
                    var dist = point_distance(x, y, inst.x, inst.y);
            
                    var hit_x = x + lengthdir_x(dist * 0.75, sdir);
                    var hit_y = y + lengthdir_y(dist * 0.75, sdir);
                    
                    // ADD TO HIT LIST
                    ds_list_add(has_hit, inst);
                    
                    // CHANCE TO HIT
                    if tohit_roll(id, inst) 
                    {
                        // DO DAMAGE
                        ret_this_shot += do_damage(hit_damage, id, inst);
                        
                        // BLOOD?
                        spill_blood(xx, yy, ret_this_shot, sdir);
                        // HITFX
                        make_boom(xx, yy, min(wp_radius + 16, wp_radius + ret_this_shot * 0.0625));
                        // CRITICAL FX
                        if critical_hit
                        {
                            make_critical_fx(fire_x, fire_y, hit_damage, inst);
                        }
        
                        // KNOCKBACK
                        knockback(inst, sdir, wp_knock);
                        // KICKBACK
                        knockback(id, point_direction(x, y, x + hspd, y + vspd) + 180, ((abs(hspd) + abs(vspd)) * 0.125) / eq_wpn[? "swarm"])//wpn[wp.pwr] * 0.0075);        
                        // SPLASH DAMAGE?
                        if eq_wpn[? "sklt"] == wpntype.bw || eq_wpn[? "sklt"] == wpntype.fw
                        {
                            // KNOGMACKA
                            make_explosion(hit_x, hit_y, 4 * lerp(0.75, ret_this_shot * 0.05, 0.15), sdir, 0.05);
                            with instance_create(hit_x, hit_y, oShockwave)
                            {
                                wave_spd = other.eq_wpn[?"radius"] / 24;
                                wave_dist = other.eq_wpn[?"radius"] / 3.5;
                            }
                            
                            // FIST
                            if eq_wpn[? "sklt"] == wpntype.fw
                            {
                                repeat(2)
                                {
                                    var spr_dir = rnd(sdir, 30);
                                    var spr_dir = rnd(sdir, 10);
                                    var fx_size = round(rnd(10, 2.5));
                                    var fx_x = x + lengthdir_x(dist * rnd(0.75, 0.125), spr_dir);
                                    var fx_y = y + lengthdir_y(dist * rnd(0.75, 0.125), spr_dir);
                                    var fx_sprite = sfxBoom32;
                                    
                                    var hit_effect = make_sprite(fx_x, fx_y, fx_sprite,fx_size, 0.5, fade_out(rnd(1.65, 0.25)), -1);
                                    with hit_effect 
                                    {
                                        depth = other.depth - CELL*3;
                                    }
                                }
                            }
                            // BLADE
                            if eq_wpn[? "sklt"] == wpntype.bw
                            {
                                repeat(1)
                                {
                                    var spr_dir = rnd(sdir, 10);
                                    var fx_size = round(rnd(20, 2) + min(20,(ret_this_shot * 0.1)));
                                    var fx_x = x + lengthdir_x(dist * rnd(0.75, 0.125), spr_dir);
                                    var fx_y = y + lengthdir_y(dist * rnd(0.75, 0.125), spr_dir);
                                    var fx_sprite = choose(sfxSlash96, sfxSlash03_32, sfxSlash05_32);
                                    
                                    var hit_effect = make_sprite(fx_x, fx_y, fx_sprite, fx_size, 0.5, fade_out(rnd(1.65, 0.25)), rnd(spr_dir, 45));
                                    with hit_effect 
                                    {
                                        depth = other.depth - CELL*3;
                                    }
                                }
                            }
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
    
    // RETURN DAMAGE AMOUNT
    return hit_return;
        

