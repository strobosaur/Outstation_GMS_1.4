///npc_distance_to_leader()
    
    // STAY CLOSE N ALL THAT
    if instance_exists(global.leader) && state != npc_melee_charging
    {
        // STAY CLOSE
        if global.leader != id && fleeing == false
        {
            var dist = 20;
            var dist2 = point_distance(x, y, global.leader.x, global.leader.y);
            var hp_ratio = stats_a[?"hp"] / stats_a[?"hpmax"];
            
            dist += min(60, 128 * hp_ratio);
            dist += (32 * eq_wpn[? "melee"]) * (hp_ratio);
            
            if (dist2 > dist && fleeing == false && timers[timer.engage] <= 0) 
            || (dist2 > dist && fleeing == false && timers[timer.engage] != 0 
            && timers[timer.wp01] != 0)
            {
                state = npc_stay_close_state;
            }
            
            // FLEE
            if (hp_ratio < 0.25) 
            && (fleeing == false) 
            && (timers[timer.flee_cd] == 0)
            {
                timers[timer.flee_limit] = room_speed * 10;
                fleeing = true;
                state = state_flee;
            }
        }
    }

