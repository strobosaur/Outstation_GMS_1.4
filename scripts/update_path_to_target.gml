///update_path_to_target(timer)

    var p_time = argument0;
    
    // PATHING
    if timers[timer.path01] <= 0 && point_distance(x, y, moveto_x, moveto_y) >= 4
    {
        // CHECK FOR PATH TO TARGET
        if find_path_to_target(moveto_x, moveto_y) && timers[timer.path01] <= 0 //&& has_movetgt
        {
            var plen = path_get_length(path);
            
            timers[timer.path01] += round(rnd(p_time, p_time*0.2));
            
            // IF NOT THERE YET
            if plen > 16
            {
                var point = 16 / plen;
                var path_x = path_get_x(path, point);
                var path_y = path_get_y(path, point);
                
//                has_movetgt = true;
                mdir = point_direction(x, y, path_x, path_y);
            }
            else
            {
                mdir = point_direction(x, y, moveto_x, moveto_y);
                path_end();
                spd = 0;
            }
        }
        // NO PATH TO TARGET
        else
        {
            spd = 0;
        }
    }

    
