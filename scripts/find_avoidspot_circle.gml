///find_avoidspot_circle(x, y, r, inst. type, dist interval, max dist)

    var xx = argument0;
    var yy = argument1;
    var r = argument2;
    var target = argument3;
    var interval = argument4;
    var max_dist = argument5;
    
    var rx = xx;
    var ry = yy;
    var len = 0;
    var dir = irandom(360);
    var dist = 0;
    var i = noone;
    
    repeat(3)
    {
        // INTERVAL BELOW MAX DISTANCE
        while dist <= max_dist
        {
            // ANYONE THERE?
            i = collision_circle(rx, ry, r, target, false, true);
            
            if i != noone
            {
                // NEXT CIRCLE
                dir++;
                rx = xx + lengthdir_x(len, dir);
                ry = yy + lengthdir_y(len, dir);
                
                if dir mod 360 == 0 || len == 0
                {
                    dist += interval;
                }
            }
            else
            {
                // RETURN ARRAY
                ret[0] = rx;
                ret[1] = ry;
                
                return ret;
            }
        }
        
        // LOWER RADIUS
        r *= 0.75
    }
    
    // NO GOOD SPOT
    return noone;
