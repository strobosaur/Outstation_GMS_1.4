///npc_engage_state()

    look_out();
    movestate();
    collidable = true;

    // IF ENEMY EXISTS
    if instance_exists(target)
    {
        todir = point_direction(x, y, target.x, target.y);
        var nearest = instance_nearest(x, y, enemy);
        var dist = point_distance(x, y, nearest.x, nearest.y);
        
        var sight = stats_a[?"sight"];
        var wp_range = get_range(eq_wpn, attack_modifier_list, id);
        var wp_melee = eq_wpn[?"melee"] == true;
        var hp_amount = stats_a[?"hp"] / stats_a[?"hpmax"];
        
        // IF CAN SEE ENEMY
        if dist <= sight
        {
            // TARGET & TURN TO FACE
//            target = nearest;
//            todir = point_direction(x, y, target.x, target.y);
            
            // IF WITHIN RANGE, STOP APPROACHING
            // IF MELEE WEAPON
            if wp_melee == true
            {
                // IF ENEMY IN RANGE, STAND STILL
                if dist < wp_range
                {
                    moveto_x = x;
                    moveto_y = y;
                    spd = 0;
                    
                    // IF WEAPON RECHARGING & NOT FULL HP, AVOID
                    if timers[timer.wp01] > 0 
                    && stats_a[?"hp"] != stats_a[?"hpmax"]
                    {
                        state = npc_avoid_state;
                    }
                }
                else
                // TARGET OUTSIDE RANGE, APPROACH
                if dist > wp_range
                {
                    moveto_x = target.x;
                    moveto_y = target.y;
                    spd = 1
                }
            }
            else
            // IF RANGED WEAPON
            if wp_melee == false
            {
                // ENEMY WITHIN RANGE, STOP APPROACHING
                if dist < wp_range-4
                && !grid_collision_line(global.bullet_grid, x, y, target.x, target.y, CELL)
                {
                    moveto_x = x;
                    moveto_y = y;
                    spd = 0;
                }
                // IF BELOW RANGE, KEEP DISTANCE
                else if (dist < (wp_range-24))
                || (dist < 48)
                {
                    state = npc_avoid_state;
                }
                else
                // TARGET OUTSIDE RANGE, APPROACH
                if dist > wp_range
                || grid_collision_line(global.bullet_grid, x, y, target.x, target.y, CELL)
                {
                    moveto_x = target.x;
                    moveto_y = target.y;
                    spd = 1
                }
            }
        }
        else
        {
            state = new_state;
        }
    }
    // NEW STATE IF NOTHING TO HUNT
    else
    {
        state = new_state;
    }

    // STAY CLOSE & FIRE AT WILL
    npc_distance_to_leader();
    npc_fire_at_will();
