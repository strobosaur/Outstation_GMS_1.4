///player_melee

    var hit = -1;

    var prox = collision_list_circle(x, y, eq_wpn[? "range"], enemy, false, true);
    
    if prox != noone
    {            
        var inst = ds_list_find_value(prox, 0);
        var dist = point_distance(x + lengthdir_x(eq_wpn[? "range"] * 0.75, dir), y + lengthdir_y(eq_wpn[? "range"] * 0.75, dir), inst.x, inst.y);
        var best = dist;
        target = inst;
        
        while !ds_list_empty(prox)
        {                    
            dist = point_distance(x + lengthdir_x(eq_wpn[? "range"] * 0.75, dir), y + lengthdir_y(eq_wpn[? "range"] * 0.75, dir), inst.x, inst.y);
            if dist < best 
            { 
                best = dist;
                target = inst;
            }
            ds_list_delete(prox, 0);
        }
        ds_list_destroy(prox);
        
        hit = fight_state();
    }

    return hit;
