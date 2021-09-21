///player_flee()

    get_input();
    playermove();
    
    // TARGET
    target = cross;
    tgtx = cross.x;
    tgty = cross.y;
    sdir = point_direction(x, y, tgtx, tgty);
    
    // CAMERA POSITION
    camera.close = 0.15;
    
    // CROSSHAIR
    cross.visible = false;
    
    // ALPHA
    image_alpha = global.alpha * rnd(0.75, 0.25);
    
    // FLASH SHADER
    if timers[timer.flash] <= 5
    {
        timers[timer.flash] = 90;
    }
    
    // SPEED BONUS
    spd = mean(LSamp, 1 + min(1, (stats_a[?"hpmax"] / stats_a[?"hp"]) * 0.1));
    
    // CHECK HEALTH
    if (stats_a[?"hp"] / stats_a[?"hpmax"]) < 0.75
    {
        var inst = instance_nearest(x, y, enemy);
        
        if instance_exists(inst)
        {
            var edist = point_distance(x, y, inst.x, inst.y);
            if LSamp != 0
            {
                mdir = lerp(LSdir, (point_direction(x, y, inst.x, inst.y) + 180) mod 360, 0.25);
            }
            else
            {
                mdir = (point_direction(x, y, inst.x, inst.y) + 180) mod 360;
            }
            //spd = max(0, min(1, (edist - 40) * 0.05));
        }
    }
    else
    // STOP FLEEING
    {
        timers[timer.flee_cd] = room_speed * 10;
        image_alpha = 1;
        fleeing = false;
        state = new_state;
    }
        
