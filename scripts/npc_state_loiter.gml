///loiter();

    look_out();    
    movestate();

    spd = 0;
    
    moveto_x = x;
    moveto_y = y;

    if random(1) < 0.25
    {
        todir = random(360);
    }
    
    state = new_state;
