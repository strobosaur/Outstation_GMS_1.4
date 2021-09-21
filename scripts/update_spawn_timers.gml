///update_spawn_timers()
    
    // UPDATE TIMERS
    for (var i = 0; i < spawntimer.stop; i++)
    {
        if t[i] > 0 
        { 
            t[i]--; 
        }
        else
        {
            t[i] = 0;
        }
    }
    
