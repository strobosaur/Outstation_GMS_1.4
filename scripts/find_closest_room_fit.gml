///find_closest_room_fit(grid, x, y, room)

    var grid = argument0;
    var x0 = argument1;
    var y0 = argument2;
    var rgrid = argument3;
    
    // LOCAL
    var gridw = ds_grid_width(grid);
    var gridh = ds_grid_height(grid);
    var rw = ds_grid_width(rgrid);
    var rh = ds_grid_height(rgrid);
    
    var xx = x0;
    var yy = y0;
    
    var x1 = round(xx - rw / 2);
    var y1 = round(yy - rh / 2);
    
    var len = 1;
    var dir = 0;
    var dist = 0;
    
    var inside = false;
    var free = false;
    var found_spot = false;
    
    var tries = 0;
    
    // RETURN ARRAY
    var ret = array_create(0);
    
    ret[0] = x1;
    ret[1] = y1;
    
    // WHILE NO FIT
    while found_spot == false
    {      
        x1 = clamp(round(xx - rw / 2), 1, gridw-1);
        y1 = clamp(round(yy - rh / 2), 1, gridh-1);
        
        // CHECK INSIDE GRID
        if room_inside_grid(grid, x1, y1, rgrid)
        {
            inside = true;
        }
        else
        {
            inside = false;
        }
        // CHECK GRID FREE
        if !ds_grid_value_exists(grid, x1-1, y1-1, x1-1 + rw-1, y1-1 + rh-1, mapcode.ground)//ds_grid_get_mean(grid, x1-1, y1-1, x1-1 + rw-1, y1-1 + rh-1) == mapcode.void
        && !ds_grid_value_exists(grid, x1, y1, x1-2 + rw-1, y1-2 + rh-1, mapcode.wall)
        && ds_grid_get_mean(grid, x1, y1, x1-2 + rw-1, y1-2 + rh-1) == mapcode.void
        {
            free = true;
        }
        else
        {
            free = false;
        }
        
        // SPOT FOUND?
        if free == true && inside == true
        {
            found_spot = true;
        
            // UPDATE COORD ARRAY
            ret[0] = round(x1);
            ret[1] = round(y1);
            
            xx = round(xx);
            yy = round(yy);
            
            dist = point_distance(xx, yy, x0, y0);
        }
        else
        {
            free = false;
            inside = false;
        
            // NEW POSITION
            xx += lengthdir_x(len, dir);
            yy += lengthdir_y(len, dir);
        
            // CIRCLE OUTWARDS
            dir += 360/16;
            if round(dir mod 360) == 0
            {
                len++;
            }
    
/*            // SQUARE SPIRAL
            for (var i = 1; i < (gridw*gridh); i++)
            {
                tries++;
                
                x1 = round(xx - (rw / 2));
                y1 = round(yy - (rh / 2));
                
                // CHECK INSIDE GRID
                if room_inside_grid(grid, x1, y1, rgrid)
                {
                    inside = true;
                }
                else
                {
                    inside = false;
                }
                // CHECK GRID FREE
                if !ds_grid_value_exists(grid, x1-1, y1-1, x1-1 + rw-1, y1-1 + rh-1, mapcode.ground)//ds_grid_get_mean(grid, x1-1, y1-1, x1-1 + rw-1, y1-1 + rh-1) == mapcode.void
                && !ds_grid_value_exists(grid, x1, y1, x1-2 + rw-1, y1-2 + rh-1, mapcode.wall)
                && ds_grid_get_mean(grid, x1, y1, x1-2 + rw-1, y1-2 + rh-1) == mapcode.void
                {
                    free = true;
                }
                else
                {
                    free = false;
                }
                
                // SPOT FOUND?
                if free == true && inside == true
                {
                    found_spot = true;
                
                    // UPDATE COORD ARRAY
                    ret[0] = round(x1);
                    ret[1] = round(y1);
                    
                    xx = round(xx);
                    yy = round(yy);
                    
                    dist = point_distance(xx, yy, x0, y0);
                    break;
                }
                // SQUARE I
                repeat(i)
                {                    
                    xx += lengthdir_x(1, dir * 90);
                    yy += lengthdir_y(1, dir * 90);
            
                    x1 = clamp(round(xx - rw / 2), 1, gridw-1);
                    y1 = clamp(round(yy - rh / 2), 1, gridh-1);
                }
                    
                dir = ((dir + 1) mod 4);
                
                // SQUARE II
                repeat(i)
                {
                    xx += lengthdir_x(1, dir * 90);
                    yy += lengthdir_y(1, dir * 90);
            
                    x1 = clamp(round(xx - rw / 2), 1, gridw-1);
                    y1 = clamp(round(yy - rh / 2), 1, gridh-1);
                }
                    
                dir = ((dir + 1) mod 4);
            }*/
        }
        tries++;  
        
        // FAILSAFE
        if tries > 100 {return -1}
    }
    
    // FIND COORD SETS TO LOOP THRU
    var xdist = round(abs(xx - x0));
    var ydist = round(abs(yy - y0));
    
    // LOOP COORDS
    for (var i = 1; i <= xdist; i++)
    {
        for (var j = 1; j <= ydist; j++)
        {        
            // UPDATE COORDS
            x1 = round(xx+i - (rw / 2));
            y1 = round(yy+j - (rh / 2));
            
            // NEW DISTANCE
            var ndist = point_distance(xx+i, yy+j, x0, y0);
            
            // INSIDE ROOM & EMPTY & BETTER DIST, UPDATE R COORDS
            if (room_inside_grid(grid, x1, y1, rgrid))
            && !ds_grid_value_exists(grid, x1-1, y1-1, x1-1 + rw-1, y1-1 + rh-1, mapcode.ground)
            && !ds_grid_value_exists(grid, x1, y1, x1-2 + rw-1, y1-2 + rh-1, mapcode.wall)
            {
                // IF BETTER DIST
                if  ndist < dist
                {
                    dist = ndist;
                    
                    // UPDATE ARRAY WITH BEST COORDS
                    ret[0] = round(x1);
                    ret[1] = round(y1);
                }
            }
        }
    }
    
    // RETURN ARRAY
    return ret;
        
    
    
    
