///npc_state_wander();

    look_out();
    movestate();

    if global.leader != noone
    && instance_exists(global.leader)
    {
        var pos = random_radius_between(global.leader.x, global.leader.y, 32, 16);
    }
    else
    {
        var pos = random_radius(x, y, 32);
    }
        
    moveto_x = pos[0];
    moveto_y = pos[1];
    
    spd = 0.125 + rnd(0, 0.1);    
    
    state = new_state;
