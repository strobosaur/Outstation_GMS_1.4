///npc_stationed_state()

    npc_fire_at_will();
    
    if !instance_exists(target)
    {
        if timers[timer.state] <= 0
        {
            timers[timer.state] = (1.5 + random(1.5)) * room_speed;
            
            switch (irandom(3))
            {
                case 0:
                case 1:
                case 2:
                if random(1) < 0.5
                {
                    dir = random(360);
                }
                break;
                
                case 3:
                var pos = random_radius(stationed_x, stationed_y, 40);
                
                moveto_x = pos[0];
                moveto_y = pos[1];
                
                break;
            }
        }
    }

    if instance_exists(enemy)
    {
        var nearest = instance_nearest(x, y, enemy);
        var sight = stats_a[?"sight"];
        var dist = point_distance(x, y, nearest.x, nearest.y);
        var wp_range = eq_wpn[?"range"] + check_bonus_list(attack_modifier_list, "range", id);
        
        if dist < sight
        {
            target = nearest;
            
            tgtx = nearest.x;
            tgty = nearest.y;
            
            if dist < wp_range
            {
                moveto_x = x;
                moveto_y = y;
                
                fight_state();
            }
            else
            {
                moveto_x = target.x;
                moveto_y = target.y;
                
                spd = 0.65;
            }
        } 
    }
