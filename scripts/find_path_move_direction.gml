///find_path_move_direction(to x, to y, path snip x&y where)

    var xx = argument0;
    var yy = argument1;
    var psnip = argument2
    
    // FIND PATH WITH MP GRID
    if find_path_to_target(xx, yy)// && timers[timer.path01] <= 0
    {
        moveto_x = xx;
        moveto_y = yy;
        
        var plength = path_get_length(path);
        
        // IF PAHT LONG ENOUGH
        if path_get_number(path) >= 1 //plength > psnip
        {
            // SET MOVE DIRECTION TO PATH POINT
            var px = path_get_point_x(path, 1);
            var py = path_get_point_y(path, 1);
        
            if plength >= 1
/*            {
                var qx = path_get_point_x(path, 2);
                var qy = path_get_point_y(path, 2);
                mdir = lerp(point_direction(x, y, px, py), point_direction(x, y, qx, qy), 0.5);
            }
            else*/
            {
                mdir = point_direction(x, y, px, py);
            }
        }
        else
        {
            path_end();
        }
    }
/*    else
    {
        todir = point_direction(x, y, xx, yy);
    }
