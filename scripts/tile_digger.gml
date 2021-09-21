///tile_digger(target grid, start x, start y, turn_chance, tile type, tiles before turn, tile count, repeats)

    var grid = argument0
    var x1 = argument1;
    var y1 = argument2;
    var odds = argument3;
    var type = argument4;
    var turn_at = argument5;
    var tile_count = argument6;
    var repeats = argument7;
    
    var dir = irandom(3);
    
    repeat(repeats)
    {
        tile_count = argument6;
    
        xx = round(rnd(x1, ((ds_grid_width(grid)-1) div 3)));
        yy = round(rnd(y1, ((ds_grid_height(grid)-1) div 3)));
        
        turn_at = argument5;
        
        for (var i = 0; i <= tile_count; i++)
        {
            
            grid[# xx, yy] = type;
            
            xx += lengthdir_x(1, dir*90);
            yy += lengthdir_y(1, dir*90);
            
            if grid[# xx, yy] == type 
            {
                if turn_at > 0 { turn_at--;}
                
                if random(1) < odds && turn_at == 0
                {
                    dir = (dir + 1) mod 4;
                    turn_at += argument5;
                }
            
                xx += lengthdir_x(1, dir*90);
                yy += lengthdir_y(1, dir*90);
            }
            else
            {
                grid[# xx, yy] = type;
            }
            
            while xx > ds_grid_width(grid) || xx < 0 || yy > ds_grid_height(grid) || yy < 0
            {
                xx -= lengthdir_x(1, dir*90);
                yy -= lengthdir_y(1, dir*90);
            }
            
            if turn_at > 0 { turn_at--;}
            
            if random(1) < odds && turn_at == 0
            {
                dir = (dir + 1) mod 4;
                turn_at += argument5;
            }
        }
    }
