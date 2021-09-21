///look_out()
    
    // LOOK FOR (NEAREST) ENEMY
    if instance_exists(enemy)
    {
        // GET STATS
        var sight = stats_a[?"sight"]
        var nearest = instance_nearest(x, y, enemy);
        var dist = point_distance(x, y, nearest.x, nearest.y);
        var wp_range = get_range(eq_wpn, attack_modifier_list, id);
        var wp_melee = eq_wpn[?"melee"] == true;
        var wp_shots = ceil(eq_wpn[? "shots"] + check_bonus_list(attack_modifier_list, "shots", id));
        var hp_amount = stats_a[?"hp"] / stats_a[?"hpmax"]
        
        // IN SIGHT?
        if dist <= sight
        {
            // IF LOW HEALTH & MELEE
            if hp_amount < 0.5
            && wp_melee
            {
                state = npc_avoid_state;
                exit;
            }
            
            // IN WEAPON RANGE?
            if dist <= wp_range 
            && wp_melee == false
            {
                // STAY AT DISTANCE IF RANGED
                if ((dist < 48) || (dist < wp_range-32))
                || ((timers[timer.wp01] > 0) && (stats_a[?"shots fired"] >= wp_shots) && (hp_amount != 1))
                {
                    state = npc_avoid_state;
                }
                else
                {
                    // STOP MOVEMENT
                    spd = 0;
                }
            }
            else
            {
                state = npc_engage_state;
            }
        }
        // FACE MOVE DIRECTION
        else
        {
            todir = mdir;
            dir = mdir;
        }
    }
    // FACE MOVE DIRECTION
    else
    {
        todir = mdir;
        dir = mdir;
    }
