///turret_new_state

    if mount.deployed == true { turret_look_out(); }

    if timers[timer.state] <= 0
    {
        if random(1) < 0.75
        {
            todir = dir + rnd(0, 45);
        }
        
        state = turret_new_state;
        
        timers[timer.state] = (1 + random(1)) * room_speed;
    }
