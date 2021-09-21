///split_line(x1, y1, x2, y2, divide by, mid or edge F/T);

    var x1 = argument0;
    var y1 = argument1;
    var x2 = argument2;
    var y2 = argument3;
    var splits = argument4;
    var mid = argument5;
    
    var dist = point_distance(x1, y1, x2, y2);
    var dir = point_direction(x1, y1, x2, y2);
    
    var xx = x1;
    var yy = y1;
    
    // THE EASY WAY
    if mid == false
    {
        position_array[0, 0] = x1;
        position_array[0, 1] = y1;
        
        for (var i = 0; i < splits; i++)
        {
            position_array[i, 0] = x1 + lengthdir_x(i * (dist / splits), dir);
            position_array[i, 1] = y1 + lengthdir_y(i * (dist / splits), dir);
        }
    }
    // THE FUN WAY
    else
    {
        var piece = (dist / splits);
        var new_dist = (1 - (1 / splits)) * dist;
        
        var new_x1 = x1 + lengthdir_x(piece/2, dir);
        var new_y1 = y1 + lengthdir_y(piece/2, dir);
        
        position_array[0, 0] = new_x1;
        position_array[0, 1] = new_y1;
        
        for (var j = 0; j < splits; j++)
        {
            position_array[j, 0] = new_x1 + lengthdir_x(j * (new_dist / splits), dir);
            position_array[j, 1] = new_y1 + lengthdir_y(j * (new_dist / splits), dir);
        }
    }
    // DONE
    return position_array;
