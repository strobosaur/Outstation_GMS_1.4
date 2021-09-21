///movestate();
    
    // LEN & SPD
    
    // STOP ANIMATION?
/*    if act == FIGHT && animation_end()
    {
        act = IDLE;
        image_speed = 0;
        image_index = 0;
    }*/

    // IF MOVING
    if len > 0
    {
        // ACT
        act = MOVE
        // IMAGE SPEED
        image_speed = ((0.45 * len) + 0.2) / 2;
        // MOVEDUST
        if len > 0.5 { movedust(6 + (len * 6), len * 0.5, fxPuff); }
    }
    else if len == 0 // NOT MOVING
    {
        act = IDLE;
        image_speed = 0;
        image_index = 0;
    }
        
