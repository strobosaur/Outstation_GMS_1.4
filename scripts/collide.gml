///collide(x, y, obj);

    if (place_meeting(argument0, argument1, argument2))
    {
        if (x == other.x && y == other.y)
        {
            move(sign(other.id - id), 0);
        }
        
        if spd > other.spd
        {
            var cdir = point_direction(other.x, other.y, x, y);
            var xspd = lengthdir_x(1, cdir);
            var yspd = lengthdir_y(1, cdir);
            
            move(xspd, yspd);
        }
    }
