///tiles_convert_area(grid, x1, y1, x2, y2, trigger, convert to)

    var grid = argument0;
    var x1 = argument1;
    var y1 = argument2;
    var x2 = argument3;
    var y2 = argument4;
    var trigger = argument5;
    var new_type = argument6;
    
    var width = abs(x1-x2);
    var height = abs(y1-y2);
    
    for (var i = x1; i <= x2; i++)
    {
        for (var j = y1; j <= y2; j++)
        {
            
            if grid[#i-1, j-1] == trigger
            {
                grid[#i-1, j-1] = new_type;
            }
        }
    }
