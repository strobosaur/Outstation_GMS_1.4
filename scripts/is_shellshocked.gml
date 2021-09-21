///is_shellshocked()
    
    // IS SUPRESSED
    var t2 = timers[timer.suppressed]
    if t2 > 0
    {
        supmod = 0.5;
    }
    else
    {
        supmod = 1;
    }
    // IS SHELLSHOCKED
    var t = timers[timer.shellshock];
    if t > 0
    {
        shockmod = max(0.5, 0.25 + lerp(0.25, 0.15 + (1 / (t+1)), 0.25));
    }
    else
    {
        shockmod = 1;
    }
