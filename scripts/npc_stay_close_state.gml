///npc_stay_close_state()
    
    npc_fire_at_will();
    movestate();

    var dist = 20;
    dist += 24 * (stats_a[?"hp"] / stats_a[?"hpmax"])
    dist += 24 * eq_wpn[?"melee"];
    
    if !is_undefined(global.leader) && instance_exists(global.leader)
    {
        // DISTANCE TO LEADER?
        if (point_distance(x, y, global.leader.x, global.leader.y) > dist)
        {
            // SPEED BY DISTANCE TO PLAYER
            spd = 0.125 + max(0, 0.01 * (point_distance(x, y, global.leader.x, global.leader.y) - 32));
            
            // EXTRA SPEED IF LOW HP
            if stats_a[?"hp"] / stats_a[?"hpmax"] < 0.4
            spd *= 1 + ((stats_a[?"hpmax"] / stats_a[?"hp"]) * 0.05);
            
            // FIND PATH TO LEADER
            if timers[timer.path_stay_close] <= 0
            {
                find_path_move_direction(global.leader.x, global.leader.y, 1);
                timers[timer.path_stay_close] = room_speed*0.25;
            }
        }
        else
        {
            state = new_state;
        }
    }
    else
    {
        state = new_state;
    }
