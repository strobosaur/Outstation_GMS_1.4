///past_col(object)

    var x0 = x - lengthdir_x(speed, direction);
    var y0 = y - lengthdir_y(speed, direction);

    var inst = collision_line(x0, y0, x, y, argument0, false, false);
    
    if (inst != noone) && (inst != shooter) {
    
        x = x0;
        y = y0;
    
        while (!place_meeting(x, y, inst))
        {
            x += lengthdir_x(1, direction);
            y += lengthdir_y(1, direction);
        }
        //COLLISION CODE HERE
    }
