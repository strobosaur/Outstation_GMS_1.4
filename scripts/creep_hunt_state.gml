///creep_hunt_state

    movestate();
    
    var sight = stats_a[?"sight"];
    
    // IF TARGET EXISTS & IN SIGHT
    if instance_exists(target) 
    {
        var dist = point_distance(x, y, target.x, target.y);
        var wp_range = get_range(eq_wpn, attack_modifier_list, id);
        dir = point_direction(x, y, target.x, target.y);
        moveto_x = target.x;
        moveto_y = target.y;
        
        // IN SIGHT?
        if dist < sight
        {
            // IF IN RANGE, ATTACK
            if dist < wp_range
            {
                state = creep_fight_state;
            }
        }
        // RESET STATE
        else
        {
            state = creep_idle_state;
        }
    }
    // RESET STATE
    else
    {
        state = creep_idle_state;
    }
        
    // CHASE TIMER UP
    if timers[timer.dash02] <= 0
    {
        state = creep_idle_state;
    }
