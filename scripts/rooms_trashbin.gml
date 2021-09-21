///rooms_trashbing


    
    /*
    
    // =================================================================
    
    // TYPE I 2 platforms with crooked bridge
    
    // ..xxx
    // xxxxx
    // x.xxx
    // x....
    // x.Xxx 
    // xxXXX
    // ..XXX
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 9;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 8, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 7, mapcode.hole);
    
    ds_grid_set_region(room_grid, 3, 1, 5, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 3, 5, 5, 7, mapcode.ground);
    
    ds_grid_set_region(room_grid, 1, 2, 1, 6, mapcode.ground);
    
    ds_grid_set(room_grid, 2, 2, mapcode.ground);
    ds_grid_set(room_grid, 2, 6, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 6;
    door_at[0,1] = 2;
    
    door_at[1,0] = 4;
    door_at[1,1] = 0;
    
    door_at[2,0] = 4;
    door_at[2,1] = 6;
    
    door_at[3,0] = 4;
    door_at[3,1] = 8;
    
    door_at[4,0] = 0;
    door_at[4,1] = 4;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 1)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 3)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    
    
    // TYPE I 2 platforms
    
    // xxx
    // xxx
    // .x.
    // xxx
    // xxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 5;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 4, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 3, 5, mapcode.ground);
    ds_grid_set(room_grid, 1, 3, mapcode.hole);
    ds_grid_set(room_grid, 3, 3, mapcode.hole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 2;
    door_at[0,1] = 0;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 4;
    door_at[2,1] = 2;
    
    door_at[3,0] = 4;
    door_at[3,1] = 4;
    
    door_at[4,0] = 2;
    door_at[4,1] = 6;
    
    door_at[5,0] = 0;
    door_at[5,1] = 4;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 0)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 5)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    
    
    // =================================================================
    
    
    // TYPE I 2 platforms
    
    // xxx
    // xxx
    // xxx
    // .x.
    // xxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 5;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 4, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 3, 5, mapcode.ground);
    
    ds_grid_set(room_grid, 1, 4, mapcode.canbehole);
    ds_grid_set(room_grid, 3, 4, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 2;
    door_at[0,1] = 0;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 4;
    door_at[2,1] = 2;
    
    door_at[3,0] = 2;
    door_at[3,1] = 6;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 0)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 3)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    
    
    // =================================================================
    
    // TYPE I 2 platforms
    
    // xx.xx
    // xxxxx
    // xx.xx

    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 5;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 4, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 3, mapcode.ground);
    ds_grid_set(room_grid, 3, 1, mapcode.canbehole);
    ds_grid_set(room_grid, 3, 3, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 6;
    door_at[1,1] = 2;
    
    door_at[2,0] = 2;
    door_at[2,1] = 0;
    
    door_at[3,0] = 2;
    door_at[3,1] = 4;
    
    door_at[4,0] = 4;
    door_at[4,1] = 0;
    
    door_at[5,0] = 4;
    door_at[5,1] = 4;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 0)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 5)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    
    
    // =================================================================
    
    // TYPE I 2 platforms with crooked bridge
    
    // .xxxxx.
    // .x...x.
    // xxx.xxx
    // xxx.xxx
    // xxx.xxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 9;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 8, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 7, 5, mapcode.hole);
    
    ds_grid_set_region(room_grid, 1, 3, 3, 5, mapcode.ground);
    ds_grid_set_region(room_grid, 5, 3, 7, 5, mapcode.ground);
    
    ds_grid_set_region(room_grid, 2, 1, 6, 1, mapcode.ground);
    
    ds_grid_set(room_grid, 2, 2, mapcode.ground);
    ds_grid_set(room_grid, 6, 2, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 4;
    
    door_at[1,0] = 2;
    door_at[1,1] = 6;
    
    door_at[2,0] = 8;
    door_at[2,1] = 4;
    
    door_at[3,0] = 6;
    door_at[3,1] = 6;
    
    door_at[4,0] = 4;
    door_at[4,1] = 0;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 1)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 4)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    
    
    // =================================================================
    
    // TYPE I 2 platforms with crooked bridge
    
    // xxx.xxx
    // xxx.xxx
    // xxx.xxx
    // .x...x.
    // .xxxxx.
    // .......
    // ..xxx..
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 9;
    rm_h = 9;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 8, 8, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 7, 7, mapcode.hole);
    
    ds_grid_set_region(room_grid, 1, 1, 3, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 5, 1, 7, 3, mapcode.ground);
    
    ds_grid_set_region(room_grid, 2, 5, 6, 5, mapcode.ground);
    ds_grid_set_region(room_grid, 3, 7, 5, 7, mapcode.ground);
    
    ds_grid_set(room_grid, 2, 4, mapcode.ground);
    ds_grid_set(room_grid, 6, 4, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 8;
    door_at[2,1] = 2;
    
    door_at[3,0] = 6;
    door_at[3,1] = 0;
    
    door_at[4,0] = 4;
    door_at[4,1] = 8;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 1)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 4)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
