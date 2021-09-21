///timer_ends()

    // FLEEING
    if (timers[timer.flee_limit] <= 0) && fleeing
    {
        timers[timer.flee_cd] = room_speed * 45;
        image_alpha = 1;
        fleeing = false;
        state = new_state;
    }
    
    // RESET PRESS COUNT
    if timers[timer.flee_press] == 0 
    {
        flee_count = 0; 
    }
        
    // RESET CHARGE COUNT
    if timers[timer.charge02] <= 0
    {
        stats_a[?"charges"] = 0;
    }
    
    if !mounted
    {
        // RELOAD COUNTER
        if timers[timer.wp01] <= 0
        {
            stats_a[?"shots fired"] = 0;
        }
    }
