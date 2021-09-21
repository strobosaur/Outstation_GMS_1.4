///mounted_look_out

    if instance_exists(enemy)
    {
        var nearest = instance_nearest(x, y, enemy);
        var dist = point_distance(x, y, nearest.x, nearest.y);
        var wp_range = get_range(eq_wpn, attack_modifier_list, id);
        var wp_spread = get_spread(eq_wpn, attack_modifier_list, id);
        
        // IN SIGHT?
        if dist <= wp_range //eq_wpn[? "range"]
        {
            if timers[timer.save01] <= 0
            {
                timers[timer.save01] = 10 + irandom(5);
                
                var list = collision_cone(x, y, wp_range, enemy, d_dir, fire_angle);
                if list != noone
                {
                    target = nearest_in_list(x, y, list);
                    ds_list_destroy(list);
                    
                    tgtx = target.x + lengthdir_x(wp_spread * 0.05, dir);
                    tgty = target.y + lengthdir_y(wp_spread * 0.05, dir);
                    todir = point_direction(x, y, target.x, target.y);
                    
                    // STATE
                    state = turret_attack;
    //                turret_attack();
                }
            }
        }
    }
