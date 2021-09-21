///creep_fight_state()

    if instance_exists(target)
    {
        var dist = point_distance(x, y, target.x, target.y);
        var wp_range = eq_wpn[?"range"];
        
        if dist < wp_range
        && timers[timer.wp01] <= 0
        {
            act = FIGHT;
            
            fight_state();
        }
        else
        {
            state = creep_idle_state;
        }
    }
    else
    {
        state = creep_idle_state;
    }
