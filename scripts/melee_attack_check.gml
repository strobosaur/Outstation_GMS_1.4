///npc_melee_attack_check()

    if eq_wpn[?"melee"] != true {exit;}

    if instance_exists(enemy)
    {
        // WEAPON RANGE
        var wp_range = get_range(eq_wpn, attack_modifier_list, id);
        
        // IF TARGET IS NOT ALIVE
        if is_undefined(target) || !instance_exists(target)
        {
            target = instance_nearest(x, y, enemy);
        }
        
        // DISTANCE TO TARGET & DIRECTION
        var dist = point_distance(x, y, target.x, target.y);
        todir = point_direction(x, y, target.x, target.y);
        
        // IF TARGET IS WITHIN RANGE & 90 DEGREES
        if dist < wp_range // && abs(angle_difference(dir, todir)) <= 45
        {
            return fight_state(); //fight_state();
        }
    }
    
    return false;
