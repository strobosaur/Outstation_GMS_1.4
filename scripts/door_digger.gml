///door_digger(grid, room width, room_height)

    var grid = argument0;
    var width = argument1;
    var height = argument2;
    
    var len = 0;
    
    // PUNCH DOOR
    grid[#xx-1, yy-1] = mapcode.door;
    
    // HOR / VERT?
    if dir == 0
    || dir == 2
    {
        len = irandom_range(2, width-2);
    }
    else
    {
        len = irandom_range(2, height-2);
    }
    
    // FIND TURNING SPOT
    for (var i = 0; i <= len; i++)
    {
        xx += lengthdir_x(1, dir);
        yy += lengthdir_y(1, dir);
        
        grid[# xx-1, yy-1] = mapcode.ground;
    }
    
    // DIRECTION
    dir += irandom_range(-1, 1);
    
    // TUNNEL OUT
    for (var i = 0; i < max(width, height); i++)
    {
        xx += lengthdir_x(1, dir);
        yy += lengthdir_y(1, dir);
        
        // FINDS VOID, EXIT
        if grid[#xx-1, yy-1] == mapcode.void
        {
            do_door_x = xx;
            do_door_y = yy;
            
            exit;
        }
        // ELSE MAKE GROUND
        else
        {
            grid[#xx-1, yy-1] = mapcode.ground;
        }
    }
