///place_map_door_objects(door list, magnify by)

    var doorlist = argument0;
    var magnify = argument1;
    
    var templist = ds_list_create();
    
    ds_list_copy(templist, doorlist);

    // PARSE DOOR COORD LIST
    for(var i = 1; i <= ds_list_size(doorlist); i++)
    {
        // DOOR PARAMETERS
        var door_at = doorlist[| i-1];
        
        var xx = door_at[0];
        var yy = door_at[1];
        var horizontal = door_at[2];
        
        var dx = (xx-1)*(magnify)*CELL;
        var dy = (yy-1)*(magnify)*CELL;
        
        // CREATE INSTANCE
        with instance_create(dx, dy, oDoor)
        {
            // HORIZONTAL DOOR
            if horizontal
            {
                y += 24;
                
                depth = -y;
                
                ay = y div CELL;
                by = y div CELL;
                cy = y div CELL;
                
                ax = x div CELL;
                bx = (x+16) div CELL;
                cx = (x+32) div CELL;
                
                // SET RIGHT SPRITE
                sprite_index = sDoor01_hor;
                opening_sprite = sDoor01_hor_opening;
                
                horizontal = true;
                collidable = true;
        
                // MARK IN COLLISION GRID
                global.collision_grid[#ax-1, ay-1] = 1;
                global.collision_grid[#bx-1, ay-1] = 1;
                global.collision_grid[#cx-1, ay-1] = 1;
                
                // MARK IN BULLET GRID
                global.bullet_grid[#ax-1, ay-1] = 1;
                global.bullet_grid[#bx-1, ay-1] = 1;
                global.bullet_grid[#cx-1, ay-1] = 1;
            }
            // VERTICAL DOOR
            else
            {
                x += 24;
                
                depth = -y - CELL
                
                ax = x div CELL;
                bx = x div CELL;
                cx = x div CELL;
                
                ay = y div CELL;
                by = (y+16) div CELL;
                cy = (y+32) div CELL;
                
                sprite_index = sDoor01_vert;
                opening_sprite = sDoor01_vert_opening;
                horizontal = false;
                collidable = true;
        
                // MARK IN COLLISION GRID
                global.collision_grid[#ax-1, ay-1] = 1;
                global.collision_grid[#ax-1, by-1] = 1;
                global.collision_grid[#ax-1, cy-1] = 1;
                
                // MARK IN BULLET GRID
                global.bullet_grid[#ax-1, ay-1] = 1;
                global.bullet_grid[#ax-1, by-1] = 1;
                global.bullet_grid[#ax-1, cy-1] = 1;
            }
        }
    }
    
    // MAKE START DOOR ==========================================================
    
    door_at = start_door;
    
    xx = door_at[0];
    yy = door_at[1];
    horizontal = door_at[2];
    
    dx = (xx-1)*(magnify)*CELL;
    dy = (yy-1)*(magnify)*CELL;
    
    // CREATE INSTANCE
    with instance_create(dx, dy, oDoor_start)
    {
        // HORIZONTAL DOOR
        if horizontal
        {
            y += 24;
            
            depth = -y;
            
            ay = y div CELL;
            by = y div CELL;
            cy = y div CELL;
            
            ax = x div CELL;
            bx = (x+16) div CELL;
            cx = (x+32) div CELL;
            
            // SET RIGHT SPRITE
            sprite_index = sDoor01_hor;
            opening_sprite = sDoor01_hor_opening;
            
            horizontal = true;
            collidable = true;
    
            // MARK IN COLLISION GRID
            global.collision_grid[#ax-1, ay-1] = 1;
            global.collision_grid[#bx-1, ay-1] = 1;
            global.collision_grid[#cx-1, ay-1] = 1;
            
            // MARK IN BULLET GRID
            global.bullet_grid[#ax-1, ay-1] = 1;
            global.bullet_grid[#bx-1, ay-1] = 1;
            global.bullet_grid[#cx-1, ay-1] = 1;
        }
        // VERTICAL DOOR
        else
        {
            x += 24;
            
            depth = -y - CELL
            
            ax = x div CELL;
            bx = x div CELL;
            cx = x div CELL;
            
            ay = y div CELL;
            by = (y+16) div CELL;
            cy = (y+32) div CELL;
            
            sprite_index = sDoor01_vert;
            opening_sprite = sDoor01_vert_opening;
            horizontal = false;
            collidable = true;
    
            // MARK IN COLLISION GRID
            global.collision_grid[#ax-1, ay-1] = 1;
            global.collision_grid[#ax-1, by-1] = 1;
            global.collision_grid[#ax-1, cy-1] = 1;
            
            // MARK IN BULLET GRID
            global.bullet_grid[#ax-1, ay-1] = 1;
            global.bullet_grid[#ax-1, by-1] = 1;
            global.bullet_grid[#ax-1, cy-1] = 1;
        }
    }
