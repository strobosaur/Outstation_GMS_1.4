///update_timers()
    
    // UPDATE TIMERS
    for (var i = 0; i < timer.flash; i++)
    {
        if timers[i] > 0 
        { 
            timers[i]--; 
        }
        else
        {
            timers[i] = 0;
        }
    }
    
    // FLASH TIMER
    for (var i = timer.flash; i < timer.stop; i++)
    {
        if timers[i] > 0 
        { 
            timers[i] *= 0.85; 
        }
        else
        {
            timers[i] = 0;
        }
    }
        
