///tile_blob_digger(target grid, start x, start y, turn_chance, brush width max, blob odds, tile type, tiles before turn, tile count, repeats)

    var grid = argument0
    var x1 = argument1;
    var y1 = argument2;
    var odds = argument3;
    var bw = argument4;
    var blob_odds = argument5;
    var type = argument6;
    var turn_count = argument7;
    var count = argument8;
    var repeats = argument9;
    
    var dir = irandom(3);
    
    // REPEAT & RESET PARAMETERS
    repeat(repeats)
    {
        tile_count = count;
    
        xx = round(rnd(x1, ((ds_grid_width(grid)-1) div 3)));
        yy = round(rnd(y1, ((ds_grid_height(grid)-1) div 3)));
        
        turn_at = turn_count;
        
        // LOOP UNTIL TILES ARE SPENT
        for (var i = 0; i <= tile_count; i++)
        {
            
//            grid[# xx, yy] = type;
            
            xx += lengthdir_x(1, dir*90);
            yy += lengthdir_y(1, dir*90);
            
            // REGULAR PAINT
            if grid[# xx, yy] == type 
            {
                if turn_at > 0 { turn_at--;}
                
                if random(1) < odds && turn_at == 0
                {
                    dir = (dir + 1) mod 4;
                    turn_at += turn_count;
                }
            
                xx += lengthdir_x(1, dir*90);
                yy += lengthdir_y(1, dir*90);
            }
            // BLOB PAINT
            else
            {
                grid[# xx, yy] = type;
                
                if random(1) < blob_odds
                {
                    if irandom(1) == 0
                    {
                        ds_grid_set_disk(grid, xx, yy, irandom(bw), type);
                    }
                    else
                    {
                        var wid = round(random(bw / 2))
                        ds_grid_set_region(grid, xx - wid, yy - wid, xx + wid, yy + wid, type);
                    }
                }
            }
            
            // STAY INSIDE GRID
            while xx > ds_grid_width(grid) || xx < 0 || yy > ds_grid_height(grid) || yy < 0
            {
                xx -= lengthdir_x(1, dir*90);
                yy -= lengthdir_y(1, dir*90);
            }
            
            if turn_at > 0 { turn_at--;}
            
            if random(1) < odds && turn_at == 0
            {
                dir = (dir + 1) mod 4;
                turn_at += turn_count;
            }
        }
    }
