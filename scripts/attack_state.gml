///attack_state();

/*    movestate()
    
    var hit = -1;
    
    if instance_exists(target)
    {
//        act = IDLE;
        // WEAPON ANIMATION
        if enemy == par_enemy
        {
            o_weapon.act = FIGHT;
        }
        // IN RANGE?
        var dist = point_distance(x, y, target.x, target.y);
        // CAN CHARGE?
        if eq_wpn[? "sklt"] == wpntype.bw || eq_wpn[? "sklt"] == wpntype.fw
        {
            if (dist < lerp(eq_wpn[? "range"] * 1.5, eq_wpn[? "range"] + 24, 0.5)) 
            && timers[timer.charge] == 0
            {
                //collidable = true;
                melee_charge();
            }
        }
        // IN RANGE?   
        if (dist < eq_wpn[? "range"] && abs(angle_difference(dir, todir)) <= 4 && timers[timer.charge] == 0) 
        || (timers[timer.charge] != 0 && dist < eq_wpn[? "range"] * 0.2 && eq_wpn[? "melee"])
        {
            // TARGET
            tgtx = target.x;
            tgty = target.y;
            
            hit = fight_state();
            return hit;
        }
        else
        {
            //act = IDLE;
            timers[timer.state] = 2 + random(2); 
            state = new_state;
        }
    }
    else
    {
        //act = IDLE;
        timers[timer.state] = 2 + random(2); 
        state = new_state;
    }
