///creep_look_out()

    // ENEMY EXISTS
    if instance_exists(enemy)
    {
        var nearest = instance_nearest(x, y, enemy);
        var dist = point_distance(x, y, nearest.x, nearest.y);
        var wp_range = eq_wpn[?"range"];
        var sight = stats_a[?"sight"];
     
        // IN SIGHT   ?
        if dist <= sight
        {
            // NEW TARGET
            target = nearest;
            dir = point_direction(x, y, target.x, target.y);
            
            // IF IN RANGE; STOP AND SHOOT
            if dist <= wp_range
            && grid_collision_line(global.bullet_grid, x, y, target.x, target.y, CELL) == false
            {
                fight_state();
                spd = 0;
                moveto_x = x;
                moveto_y = y;
            }
            // PURSUE TARGET
            else
            {
                // IF CAN CHASE
                if timers[timer.dash01] <= 0
                {
                    timers[timer.dash01] = room_speed * rnd(7.5, 2.5);
                    timers[timer.dash02] = room_speed * rnd(2, 0.5);
                    
                    state = creep_hunt_state;
                    moveto_x = target.x;
                    moveto_y = target.y;
                    spd = 1;
                }
                // ELSE STALK
                else
                {
                    state = creep_hunt_state;
                    moveto_x = target.x;
                    moveto_y = target.y;
                    spd = 0.65;
                }
            }
        }
        else
        {
            dir = mdir;
            spd = 0.5;
        }
    }
    else
    {
        dir = mdir;
        spd = 0.5;
    }
