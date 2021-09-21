///fast_col(object);

    var inst = collision_line(x, y, x + lengthdir_x(len, dir), y + lengthdir_y(len, dir), argument0, false, false);
    var incr = 0;
    
    if (inst != noone)
    {    
       while (!place_meeting(x, y, inst)) && (incr <= len)
       {       
          x += lengthdir_x(1, dir);
          y += lengthdir_y(1, dir);
          incr++;          
       }
    }
