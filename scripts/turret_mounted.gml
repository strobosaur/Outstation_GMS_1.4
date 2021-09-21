///turret_mounted
    
    // LOOK FOR ENEMY
//    if timers[timer.save01] <= 0
//    {
//        timers[timer.save01] += 10;
        mounted_look_out();
//    }

    // RANDOM TURRET DIRECTION
    if timers[timer.state] <= 0
    {
        if random(1) < 0.75
        {
            todir = rnd(mount.d_dir, mount.fire_angle);
        }
        
        state = turret_mounted;
        timers[timer.state] = (1 + random(1)) * room_speed;
    }
