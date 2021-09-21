///tunnel_type_until(grid, x, y, dir, trig, new t., steps, maxsteps, odds)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var dir = argument3;
    var trigger = argument4;
    var new_type = argument5;
    var steps = argument6;
    var maxsteps = argument7;
    var odds = argument8;
    
    var start_dir = argument3;
    
    var trigger_found = false;
    
    var tunneled = 0;
    
    // CHECK FOR TRIGGER CELL TYPE
    for(var i = 0; i <= steps; i++)
    {
        if grid[#xx-1, yy-1] != trigger
        {
            xx += lengthdir_x(1, dir*90);
            yy += lengthdir_y(1, dir*90);
        }
        else
        {
            trigger_found = true;
            break;
        }
    }
    
    if trigger_found == false
    {
        return false;
    }
    else
    {
        // WHILE COORD IS NOT VOID, CHANGE TRIGGER TO NEW TYPE
        while (grid[#xx-1, yy-1] != mapcode.void)
        && tunneled <= maxsteps
        {
            xx += lengthdir_x(1, dir*90);
            yy += lengthdir_y(1, dir*90);
            
            if grid[#xx-1, yy-1] == trigger
            {
                tunneled++;
                grid[#xx-1, yy-1] = new_type;
            }
            
            if random(1) < odds
            {
                dir = choose(start_dir-1, start_dir, start_dir+1);
            }
        }
        
        // RETURN VOID COORD
        var pos = array_create(1);
        
        pos[0] = xx;
        pos[1] = yy;
        
        return pos;
    }
