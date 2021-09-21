///turret_attack
        
    // WEAPON PARAMETERS
    var wp_range = get_range(eq_wpn, attack_modifier_list, id);

    if instance_exists(target)
    {
        // IF NOT IN FIRE ANGLE, EXIT
        if abs(angle_difference(d_dir, todir)) > fire_angle
        {
            target = noone;
            state = turret_mounted;
            exit;
        }
        
        var dist = point_distance(x, y, target.x, target.y);
        
        // IN RANGE & COOLDOWN
        if (dist <= wp_range) //eq_wpn[? "range"])
        {
            var wp_spread = get_spread(eq_wpn, attack_modifier_list, id);
            tgtx = target.x + lengthdir_x(wp_spread * 0.05, dir);
            tgty = target.y + lengthdir_y(wp_spread * 0.05, dir);
            todir = point_direction(x, y, target.x, target.y);
            
            if abs(angle_difference(dir, todir)) <= 10
            {
                fight_state();
            }
            else
            {
                state = turret_mounted;
            }
        }
        else
        {
            state = turret_mounted;
        }
    }
    else
    {
        state = turret_mounted;
    }
