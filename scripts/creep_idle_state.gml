///creep_idle_state()

    movestate();
    creep_look_out();

    if point_distance(x, y, base_x, base_y) > 24
    {
        moveto_x = base_x;
        moveto_y = base_y;
    }
    else
    {
        moveto_x = x;
        moveto_y = y;
    }
