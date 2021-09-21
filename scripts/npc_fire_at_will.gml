///npc_fire_at_will()

    if instance_exists(enemy)
    {
        var nearest = instance_nearest(x, y, enemy);
        var dist = point_distance(x, y, nearest.x, nearest.y);
        var sight = stats_a[?"sight"];
        var wp_range = get_range(eq_wpn, attack_modifier_list, id);
        var charge_range = (lerp(wp_range * 4, wp_range + 64, 0.5));
        var wp_melee = eq_wpn[?"melee"];
        
        // SET NEW TARGET
        target = nearest;
        
//        todir = point_direction(x, y, target.x, target.y);
        
        // IN SIGHT RANGE?
        if dist <= sight 
        && instance_exists(target)
        {
            // TURN TO AIM
            target = nearest;
            todir = point_direction(x, y, target.x, target.y);
            
            tgtx = target.x;
            tgty = target.y;
            
            // TURN TOWARDS TARGET DIRECTION
            if (dir != todir)// && (global.leader != id)
            {
                dir += turn_to(dir, todir, turnspd);
            }
            
            var dir_dif = abs(angle_difference(dir, todir));
            
            // RANGED ATTACK, IN RANGE?
            if dist <= wp_range 
            && !eq_wpn[?"melee"]
            && !grid_collision_line(global.bullet_grid, x, y, target.x, target.y, CELL)
            {
                // WEAPON ANIMATION
                if enemy == par_enemy
                {
                    o_weapon.act = FIGHT;
                }
                
                // STANDARD RANGED ATTACK
                if eq_wpn[?"melee"] == false
                && dir_dif <= 3
                {
                    return fight_state();
                }
            }
            
            // MELEE ATTACK, IN CHARGE RANGE?
            if dist < charge_range
            && eq_wpn[?"melee"]
            && !grid_collision_line(global.bullet_grid, x, y, target.x, target.y, CELL)
            {
                // MELEE CHARGE ATTACK
                if eq_wpn[?"charges"] > 0
                {
                    return npc_melee_charge();
                }
                // STANDARD MELEE ATTACK
                else
                {
                    return fight_state();
                }
            }
        }
        // FACE MOVE DIRECTION
        else
        {
            todir = mdir;
            dir = mdir;
        }
    }
    // FACE MOVE DIRECTION
    else
    {
        todir = mdir;
        dir = mdir;
    }
