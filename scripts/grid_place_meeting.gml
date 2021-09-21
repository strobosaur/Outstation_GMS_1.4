///grid_place_meeting(grid, x,y)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    
    var xp = x;
    var yp = y;

    x = xx;
    y = yy;
    
    var x_meeting = (grid[# (bbox_left div CELL)-1, (bbox_top div CELL)-1] || grid[# (bbox_right div CELL)-1, (bbox_top div CELL)-1]) == 1
    var y_meeting = (grid[# (bbox_left div CELL)-1, (bbox_bottom div CELL)-1] || grid[# (bbox_right div CELL)-1, (bbox_bottom div CELL)-1]) == 1
    var c_meeting = grid[# (xx div CELL)-1, (yy div CELL)-1] == 1
    
//    var stuck = (grid[# (xp div CELL)-1, (yp div CELL)-1] == 1);
    
//    if stuck {find_place_free_circle(grid, xx, yy, 1);}
    
    x = xp;
    y = yp;
    
    return x_meeting || y_meeting || c_meeting
