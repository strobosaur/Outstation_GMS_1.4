///turret_look_out

    if instance_exists(enemy)
    {
        var nearest = instance_nearest(x, y, enemy);
        var dist = point_distance(x, y, nearest.x, nearest.y);
        var wp_range = get_range(eq_wpn, attack_modifier_list, id);
        
        // IN SIGHT?
        if dist <= wp_range//eq_wpn[? "range"]//stats_a[?"sight"]
        {
            target = nearest;
            todir = point_direction(x, y, target.x, target.y);
            
            // IN WEAPON RANGE?
            if (dist <= wp_range) && (abs(angle_difference(dir, todir)) <= 4)
            {
                // STATE
                state = turret_attack;
            }
        }
    }
