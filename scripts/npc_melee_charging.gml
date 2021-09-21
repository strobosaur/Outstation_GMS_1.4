///npc_melee_charging()

    var hit_return = -1;
    var dist = 0;
    var wp_range = get_range(eq_wpn, attack_modifier_list, id);
    
    dist = point_distance(x, y, tgtx, tgty);
    dir = point_direction(x, y, tgtx, tgty);
    
    // TIMER
    if round(timers[timer.charge01]) mod 3 == 0  
    trail_hue(0.9, 0.7, rnd(145, 25));
    
    collidable = false;
    
    // REACHED TARGET?
    if dist < wp_range/2 //2 
    || timers[timer.charge01] <= 0
    {
        // FREE CRIT
        collidable = true;
        critical_hit = true;
        // RESET TIMER
        timers[timer.charge01] = 0;
        
        // DO ATTACK
        hit_return = melee_attack_check();
        // RESET STATE
        state = new_state;
        
        if global.leader == id
        {
            sh_chrome_shake(0.75, 0.75, 0.3, 0.1); 
            global.vibrate += max(0, (0.2 + (hit_return * 0.00075)));
        }
        
        return hit_return;
    }
