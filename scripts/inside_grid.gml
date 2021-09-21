///inside_grid(what grid, x0, y0);

    // INPUT

    var bgrid = argument0;
    var x0 = argument1;
    var y0 = argument2;
    
    // LOCAL
    
    var grw = ds_grid_width(bgrid);
    var grh = ds_grid_height(bgrid);
    
    // RUN SCRIPT
    
    if (x0 > 1) && (x0 < grw-2) && (y0 > 1) && (y0 < grh-2)
    {
        return true;
    }
        else
    {
        return false;
    }

