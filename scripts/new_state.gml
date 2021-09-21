///new_state();

    // IF LEADER
    if global.leader == id && !deployed 
    { 
        if state == state_flee
        {
            state = player_flee;
        }
        else
        {
            state = idle_state; 
            exit; 
        }
    }
    // IF LEADER AND DEPLOYED
    else if global.leader == id && deployed 
    { 
        state = player_mounted; 
    }
    
    // IF MOUNTED
    if mounted 
    { 
        state = mount_new_state;        
        if deployed { turret.state = turret_mounted; }        
        exit;
    }
    
    // ======== ======== ======== ========
    
    // IF NOT
    look_out()    
    movestate();

    if timers[timer.state] <= 0
    {
        state = choose(npc_state_wander, npc_state_loiter, npc_state_loiter, npc_state_loiter);
        timers[timer.state] = (1.5 + random(1.5)) * room_speed;
    }
    
    npc_distance_to_leader();
    npc_fire_at_will();
