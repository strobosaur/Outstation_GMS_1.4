///state_flee
    
    image_alpha = global.alpha * rnd(0.5, 0.25);
    
    // FLASH SHADER
    if timers[timer.flash] <= 5
    {
        timers[timer.flash] = 90;
    }
    
    // CHECK HEALTH
    if (stats_a[?"hp"] / stats_a[?"hpmax"]) < 0.75
    {
        // SEEK LEADER
        var dist = point_distance(x, y, global.leader.x, global.leader.y)
        if !is_undefined(global.leader) && point_distance(x, y, global.leader.x, global.leader.y) > 28
        {
            find_path_move_direction(global.leader.x, global.leader.y, 1);
//            mdir = point_direction(x, y, global.leader.x, global.leader.y);
            dir = mdir;
            spd = 1 + min(1, (stats_a[?"hpmax"] / stats_a[?"hp"]) * 0.1);
        }
        else
        {
            // AVOID ENEMY
            var inst = instance_nearest(x, y, enemy);
            if instance_exists(inst)
            {
                var edist = point_distance(x, y, inst.x, inst.y);
                mdir = (point_direction(x, y, inst.x, inst.y) + 180) mod 360;
                dir = mdir;
                
                spd = max(0, min(1, (edist - 32) * 0.05));
            }
            else
            {
                spd = 0;
            }
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
    
    movestate()
