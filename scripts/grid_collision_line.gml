///grid_collision_line(grid, x1, y1, x2, y2, cell size)

    var grid = argument0;
    var x1 = argument1;
    var y1 = argument2;
    var x2 = argument3;
    var y2 = argument4;
    var cell = argument5;
    
    var dist = point_distance(x1, y1, x2, y2);
    var dir = point_direction(x1, y1, x2, y2);
    var xx = x1;
    var yy = y1;
    
    for (var i = 0; i < dist; i++)
    {
        if grid[# (xx div cell)-1, (yy div cell)-1] == 1 { return true; }
        
        xx += lengthdir_x(1, dir);
        yy += lengthdir_y(1, dir);
    }
    
    return false;
