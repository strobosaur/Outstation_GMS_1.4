///pick_random_door(grid, x1, y1, x2, y2, border)

    var grid = argument0;
    var x1 = argument1;
    var y1 = argument2;
    var x2 = argument3;
    var y2 = argument4;
    var border = argument5;
        
    var randomizer = irandom(3);
    
    var door_x = 0;
    var door_y = 0;
    
    var width = max(x1, x2) - min(x1, x2);
    var height = max(y1, y2) - min(y1, y2);
    
    // DOOR OUT SPOT
    for (var j = 0; j <= 3; j++)
    {
        switch (j + randomizer) mod 4
        {
            //DOOR ON HORIZONTAL SIDE
            case 0:
            door_x = x1 + irandom_range(border, width-border);
            door_y = y1;
            
            if door_y == do_door_y
            {
                continue;
            }
            else
            {
                var pos = array_create(1);
                
                pos[0] = door_x;
                pos[1] = door_y;
                
                return pos;
            }
            
            //DOOR ON HORIZONTAL SIDE
            case 1:
            door_x = x1 + irandom_range(border, width-border);
            door_y = y1 + height;
            
            if door_out_y == do_door_y
            {
                continue;
            }
            else
            {
                var pos = array_create(1);
                
                pos[0] = door_x;
                pos[1] = door_y;
                
                return pos;
            }
            
            // DOOR ON VERTICAL SIDE
            case 2:
            door_x = x1;
            door_y = y1 + irandom_range(border, height-border);
            
            if door_x == do_door_x
            {
                continue;
            }
            else
            {
                var pos = array_create(1);
                
                pos[0] = door_x;
                pos[1] = door_y;
                
                return pos;
            }
            
            // DOOR ON VERTICAL SIDE
            case 3:
            door_x = x1 + width;
            door_y = y1 + irandom_range(border, height-border);
            
            if door_x == do_door_x
            {
                continue;
            }
            else
            {
                var pos = array_create(1);
                
                pos[0] = door_x;
                pos[1] = door_y;
                
                return pos;
            }
        }
    }
