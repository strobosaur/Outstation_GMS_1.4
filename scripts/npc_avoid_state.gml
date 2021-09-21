///npc_avoid_state()
    
    // IF STILL HAS TARGET
    if instance_exists(target)
    {
        collidable = false;
        // GET STATS
        var hp_amount = stats_a[?"hp"] / stats_a[?"hpmax"]
        var adir = point_direction(target.x, target.y, x, y);
        var dist = point_distance(x, y, target.x, target.y)
        get_range(eq_wpn, attack_modifier_list, id);
        
        var xx = target.x + lengthdir_x(dist, adir);
        var yy = target.y + lengthdir_y(dist, adir);
        
        // SET MOVE COORD AWAY FROM TARGET
        moveto_x = x + lengthdir_x(CELL*2, adir);
        moveto_y = y + lengthdir_y(CELL*2, adir);
        
        // IF CELL IS BLOCKED, SEEK LEADER
        if grid_place_meeting(global.collision_grid, moveto_x, moveto_y)
        && instance_exists(global.leader)
        {
            moveto_x = global.leader.x + lengthdir_x((CELL*7)*(1-hp_amount), point_direction(global.leader.x, global.leader.y, global.start_x1, global.start_y1));
            moveto_y = global.leader.y + lengthdir_y((CELL*7)*(1-hp_amount), point_direction(global.leader.x, global.leader.y, global.start_x1, global.start_y1));
        }
        
        // MOVE SPEED
        spd = clamp((0.55 * (56 / dist)), 0, 1) + (0.75 * (1 - hp_amount));
    }
    
    state = new_state;
    
    look_out();
    movestate();
    npc_distance_to_leader();
    npc_fire_at_will();
