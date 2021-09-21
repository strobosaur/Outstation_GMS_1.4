///place_room_prefab(grid, door x, door y, room pool)

    var grid = argument0;
    do_door_x = argument1;
    do_door_y = argument2;
    var room_pool = argument3;
                
    var mirror_h = false;
    var mirror_v = false;
    
    // GET ROOM MAP
    ds_list_shuffle(room_pool);
    var room_map = ds_list_find_value(room_pool, 0);
    
    // CHECK IF ROOM ALREADY USED
/*    while (ds_list_find_index(used_rooms, room_map) != -1)
    {
        // GET ROOM MAP
        ds_list_shuffle(room_pool);
        room_map = ds_list_find_value(room_pool, 0);
    }*/
    
    // MIRROR DIR?
    //mirror_h = irandom(1);
    //mirror_v = irandom(1);
    
    // ROOM GRID
    var room_grid = room_map[?"grid"];
    
    // ROOM MAP VARIABLES
    var roomw = room_map[?"width"]
    var roomh = room_map[?"height"]
    
    var rm_grid = ds_grid_create(roomw, roomh);
    ds_grid_copy(rm_grid, room_grid);
    
    var door_at = room_map[?"door array"]
    var dtypes = room_map[?"choices"]
    var rdoor = irandom(dtypes);
    var found_spot = false;
    
    // MIRRORED HOR / VERT?
    if mirror_h || mirror_v
    {
        ds_grid_mirror(rm_grid, mirror_h, mirror_v);
    }
    
    // CHECK DOOR CONFIGS
    for (var j = 0; j <= dtypes; j++)
    {
        var door_x = abs((mirror_h * (roomw-1)) - (door_at[(rdoor+j) mod (dtypes+1), 0]));
        var door_y = abs((mirror_v * (roomh-1)) - (door_at[(rdoor+j) mod (dtypes+1), 1]));
        
        var x1 = do_door_x - door_x;
        var y1 = do_door_y - door_y;
        
        // SPOT IS ONLY VOID?
        var is_empty = (ds_grid_get_mean(grid, x1-1 + 1, y1-1 + 1, x1-1 + roomw-1 - 1, y1-1 + roomh-1 - 1) == mapcode.void) 
        && (ds_grid_get_mean(grid, x1-1 + 1, y1-1 + 1, x1-1 + roomw-1 - 1, y1-1 + roomh-1 - 1) == mapcode.void);
        // NO GROUND IN MID?
        var is_free = (!ds_grid_value_exists(grid, x1-1, y1-1, x1-1 + roomw-1, y1-1 + roomh-1, mapcode.ground)) 
        && (!ds_grid_value_exists(grid, x1-1, y1-1, x1-1 + roomw-1, y1-1 + roomh-1, mapcode.ground));
        // IS INSIDE GRID?
        var is_inside = room_inside_grid(grid, x1, y1, rm_grid)
        
        // CHECK GRID FREE
        if is_empty && is_free && is_inside
        {
            // FOUND SPOT FOR ROOM
//            found_spot = true;
    
            // ADD ROOM TO USED LIST
//            ds_list_add(used_rooms, room_map);
            
            // NOT SAME AS ENTRANCE
            var k = irandom(dtypes);
            while k == j { k = irandom(dtypes);}
            
            var door_x_out = door_at[k, 0];
            var door_y_out = door_at[k, 1];
            
            // NEW EXIT CELL
            var outx = x1 + door_x_out;
            var outy = y1 + door_y_out;
           
            // STOP LOOP
            found_spot = true;
            break;
        }
        else
        {                    
            // FAIL
//            return false;
        }
    }
    
    // IF FOUND SPOT
    if found_spot = false
    {
        return false;
    }
    else
    {
        
        // COPY ROOM GRID UNTO LEVEL GRID
        ds_grid_set_grid_region(grid, rm_grid, 0, 0, roomw-1, roomh-1, x1-1, y1-1);
        rooms_placed++;
        
        // CHECK RANDOM CELLS
        find_random_cells(grid, x1, y1, x1+roomw-1, y1+roomh-1);
        
        // PUNCH IN DOOR
        grid[#do_door_x-1, do_door_y-1] = mapcode.door;
        
        // ADD DOOR COORDS TO LIST
        for (var i = 0; i <= dtypes; i++)
        {
            var dx = abs((mirror_h * (roomw-1)) - door_at[i, 0]);
            var dy = abs((mirror_v * (roomh-1)) - door_at[i, 1]);
            
            if (dx == door_x && dy == door_y)
            || (dx == door_x_out && dy == door_y_out)
            {
                continue;
            }
            else
            {
                open_end = array_create(0);
                open_end[0] = x1 + dx;
                open_end[1] = y1 + dy;
                
                ds_list_add(local_open_ends, open_end);
            }
        }
        
        
        return true;
    }
