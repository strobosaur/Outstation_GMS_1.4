///fast_collission(solid);

    if collision_line(x , y, xprevious, yprevious, argument0, false, true) 
    {
        x = xprevious;    
        y = yprevious;
        
        move_contact_all(point_direction(xprevious, yprevious, x, y), point_distance(xprevious, yprevious, x, y));
    }
