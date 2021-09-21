///playermove();

    get_input();

    // DIR
    
    // RIGHT STICK
    if state == player_aiming
    {
        // AIMING
        if RSamp > 0.75
        {
            dir += turn_to_ease(dir, RSdir, (min(60, abs(angle_difference(dir, RSdir))) / 60) * 1.75, 0.75);
        }
        
        // LEFT STICK
        if LSamp != 0
        {
            mdir = LSdir;
        }    
        else if LSamp == 0
        {
            spd = 0;
        }
    }
    else 
    {
        if RSamp != 0
        {   
            if point_distance(x, y, cross.x, cross.y) > 20
            {
                dir = point_direction(x, y, cross.x, cross.y);
            } 
            else if LSamp != 0 
            {
                dir = LSdir;
            }
        }
        
        // LEFT STICK
        if LSamp != 0
        {
            mdir = LSdir;
            
            if RSamp == 0 { dir = LSdir; }
        }    
        else if LSamp == 0
        {
            spd = 0;
        }
    }
    
    // LEN    
    if len > 0
    {    
        // ACT        
        act = MOVE;
        
        // MOVE        
        image_speed = ((0.25 * len) + 0.1) / 2; // ANIMATION SPEED
        
        // DUST        
        if len > 0.75 
        {
            // MOVEDUST
            movedust(4 + (len * 1.25), len * 0.1, fxPuff);
        }
    }
    
    // NO MOVEMENT    
    if len == 0
    {
        act = IDLE;
    }
