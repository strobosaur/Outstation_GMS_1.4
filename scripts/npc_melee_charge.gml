///npc_melee_charge()

    if instance_exists(enemy)
    {
        // TARGET
        var nearest = instance_nearest(x, y, enemy);
        var dist = point_distance(x, y, nearest.x, nearest.y);
        var wp_range = get_range(eq_wpn, attack_modifier_list, id);
        var charge_range = (lerp(wp_range * 4, wp_range + 64, 0.5));
        
        target = nearest;
        
        tgtx = target.x;
        tgty = target.y;
        
        // RANGE & SPEED
        var charge_spd = ease_out_cubic(dist, 0, 3, charge_range) / room_speed;
        var kick_spd = lerp(3, dist / 20, 0.25);
        
        // CHARGE COUNT / LIMIT
        var wp_shots = eq_wpn[? "shots"] + check_bonus_list(attack_modifier_list, "shots", id);
        var wp_charge_count = stats_a[?"charges"];
        var wp_charge_limit = eq_wpn[?"charges"];
        
        // DIRECTION
        dir = point_direction(x, y, tgtx, tgty);
        
        // IF ENOUGH CHARGES & TIMER 0, DO CHARGE
        if timers[timer.charge01] <= 0
        && timers[timer.charge02] <= 0
        && timers[timer.wp01] <= 0
        && wp_charge_count <= wp_charge_limit
        && dist <= charge_range
        {
            // TIMERS SET BY DISTANCE
            timers[timer.charge01] = dist * 0.5;
            stats_a[?"charges"]++;
            
            // SET CHARGE COOLDOWN
            if stats_a[?"charges"] >= wp_charge_limit
            && timers[timer.charge02] <= 0
            {
                timers[timer.charge02] = get_atkspd(eq_wpn, attack_modifier_list, id)*5;
            }
            
            // KICK SPEED
            hspd = lengthdir_x(kick_spd, dir);
            vspd = lengthdir_y(kick_spd, dir);
            
            // CHARGE STATE
            state = npc_melee_charging;
        }
        else
        {
            return melee_attack_check();
        }
    }
