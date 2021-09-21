///init_roompool(argument0)
    
    // =================================================================
    
    // TYPE I super boring 3x3
    
    // xxx
    // x?x
    // xxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 5;
    rm_h = 5;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 4, 4, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 3, 3, mapcode.ground);
    
    ds_grid_set(room_grid, 2, 2, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 2;
    door_at[2,1] = 4;
    
    door_at[3,0] = 4;
    door_at[3,1] = 2;
    
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
    
    // TYPE I super boring 3x3
    
    // #x#
    // xxx
    // #x#
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 5;
    rm_h = 5;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 4, 4, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 3, 3, mapcode.wall2);
    ds_grid_set_region(room_grid, 1, 2, 3, 2, mapcode.ground);
    ds_grid_set_region(room_grid, 2, 1, 2, 3, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 2;
    door_at[2,1] = 4;
    
    door_at[3,0] = 4;
    door_at[3,1] = 2;
    
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
    
    // TYPE I super boring 3x3
    
    // xxxx
    // x??x
    // xxxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 6;
    rm_h = 5;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 5, 4, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 4, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 2, 2, 3, 2, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 3;
    door_at[2,1] = 4;
    
    door_at[3,0] = 5;
    door_at[3,1] = 2;
    
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
    
    // TYPE I super boring 3x3
    
    // xxxx
    // x??x
    // x??x
    // xxxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 6;
    rm_h = 6;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 5, 5, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 4, 4, mapcode.ground);
    ds_grid_set_region(room_grid, 2, 2, 3, 3, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 3;
    door_at[2,1] = 5;
    
    door_at[3,0] = 5;
    door_at[3,1] = 3;
    
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
    
    // TYPE I island

    // ..x..
    // .xxx.
    // xx?xx
    // .xxx.
    // ..x..
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 5, mapcode.hole);
    ds_grid_set_region(room_grid, 2, 2, 4, 4, mapcode.ground);
    
    ds_grid_set(room_grid, 1, 3, mapcode.ground)
    ds_grid_set(room_grid, 5, 3, mapcode.ground)
    ds_grid_set(room_grid, 3, 1, mapcode.ground)
    ds_grid_set(room_grid, 3, 5, mapcode.ground)
    
    ds_grid_set(room_grid, 3, 3, mapcode.canbeall)
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 3;
    door_at[0,1] = 0;
    
    door_at[1,0] = 0;
    door_at[1,1] = 3;
        
    door_at[2,0] = 3;
    door_at[2,1] = 6;
    
    door_at[3,0] = 6;
    door_at[3,1] = 3;
    
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
    
    // =================================================================
    
    // TYPE I super boring 5x5
    
    // ?xxx?
    // xxxxx
    // xx?xx
    // xxxxx
    // ?xxx?
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 5, mapcode.ground);
    
    ds_grid_set(room_grid, 3, 3, mapcode.canbehole);
    ds_grid_set(room_grid, 1, 1, mapcode.canbehole);
    ds_grid_set(room_grid, 1, 5, mapcode.canbehole);
    ds_grid_set(room_grid, 5, 1, mapcode.canbehole);
    ds_grid_set(room_grid, 5, 5, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 3;
    
    door_at[1,0] = 3;
    door_at[1,1] = 0;
    
    door_at[2,0] = 3;
    door_at[2,1] = 6;
    
    door_at[3,0] = 6;
    door_at[3,1] = 3;
    
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
    
    // =================================================================
    
    // TYPE I super boring 5x5
    
    // #xxx#
    // xxxxx
    // xx?xx
    // xxxxx
    // #xxx#
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 5, mapcode.ground);
    
    ds_grid_set(room_grid, 3, 3, mapcode.canbehole);
    
    ds_grid_set(room_grid, 1, 1, mapcode.wall2);
    ds_grid_set(room_grid, 1, 5, mapcode.wall2);
    ds_grid_set(room_grid, 5, 1, mapcode.wall2);
    ds_grid_set(room_grid, 5, 5, mapcode.wall2);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 3;
    
    door_at[1,0] = 3;
    door_at[1,1] = 0;
    
    door_at[2,0] = 3;
    door_at[2,1] = 6;
    
    door_at[3,0] = 6;
    door_at[3,1] = 3;
    
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
    
    // =================================================================
    
    // TYPE I super boring 5x5
    
    // ##x##
    // ##x##
    // xxxxx
    // ##x##
    // ##x##
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 5, mapcode.ground);
    
    ds_grid_set_region(room_grid, 1, 1, 2, 2, mapcode.wall2);
    ds_grid_set_region(room_grid, 1, 4, 2, 5, mapcode.wall2);
    ds_grid_set_region(room_grid, 4, 1, 5, 2, mapcode.wall2);
    ds_grid_set_region(room_grid, 4, 4, 5, 5, mapcode.wall2);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 3;
    
    door_at[1,0] = 3;
    door_at[1,1] = 0;
    
    door_at[2,0] = 3;
    door_at[2,1] = 6;
    
    door_at[3,0] = 6;
    door_at[3,1] = 3;
    
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
    
    // =================================================================
    
    // TYPE I super boring 7x7
    
    // ???x???
    // ?xxxxx?
    // ?xxxxx?
    // xxx?xxx
    // ?xxxxx?
    // ?xxxxx?
    // ???x???
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 9;
    rm_h = 9;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 8, 8, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 7, 7, mapcode.canbehole);
    
    ds_grid_set_region(room_grid, 2, 2, 6, 6, mapcode.ground);
    
    ds_grid_set(room_grid, 4, 4, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 4;
    
    door_at[1,0] = 4;
    door_at[1,1] = 0;
    
    door_at[2,0] = 4;
    door_at[2,1] = 8;
    
    door_at[3,0] = 8;
    door_at[3,1] = 4;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 2)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 3)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE II 2 platforms
    
    // xxx
    // xxx
    // xxx
    // -x-
    // xxx
    // xxx
    // xxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 5;
    rm_h = 9;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 4, 8, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 3, 7, mapcode.ground);
    
    ds_grid_set(room_grid, 1, 4, mapcode.canbehole);
    ds_grid_set(room_grid, 3, 4, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 2;
    door_at[0,1] = 0;
    
    door_at[1,0] = 0;
    door_at[1,1] = 2;
    
    door_at[2,0] = 4;
    door_at[2,1] = 2;
    
    door_at[3,0] = 4;
    door_at[3,1] = 6;
    
    door_at[4,0] = 2;
    door_at[4,1] = 8;
    
    door_at[5,0] = 0;
    door_at[5,1] = 6;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 1)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 5)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE II 2 platforms
    
    // -x-
    // -x-
    // xxx
    // xxx
    // xxx
    // -x-
    // -x-
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 5;
    rm_h = 9;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 4, 8, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 3, 7, mapcode.hole);
    
    ds_grid_set_region(room_grid, 1, 3, 3, 5, mapcode.ground);
//    ds_grid_set_region(room_grid, 2, 1, 2, 7, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 2;
    door_at[0,1] = 0;
    
    door_at[1,0] = 0;
    door_at[1,1] = 4;
    
    door_at[2,0] = 4;
    door_at[2,1] = 4;
    
    door_at[3,0] = 2;
    door_at[3,1] = 8;
    
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
    
    // =================================================================
    
    // TYPE II 2 platforms
    
    // xxx.xxx
    // xxxxxxx
    // xxx.xxx

    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 9;
    rm_h = 5;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 8, 4, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 7, 3, mapcode.ground);
    
    ds_grid_set(room_grid, 4, 1, mapcode.canbehole);
    ds_grid_set(room_grid, 4, 3, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 8;
    door_at[1,1] = 2;
    
    door_at[2,0] = 2;
    door_at[2,1] = 0;
    
    door_at[3,0] = 2;
    door_at[3,1] = 4;
    
    door_at[4,0] = 6;
    door_at[4,1] = 0;
    
    door_at[5,0] = 6;
    door_at[5,1] = 4;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 1)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 5)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE II 2 platforms
    
    // ..xxx..
    // xxxxxxx
    // ..xxx..

    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 9;
    rm_h = 5;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 8, 4, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 7, 3, mapcode.hole);
    
    ds_grid_set_region(room_grid, 3, 1, 5, 3, mapcode.ground);
//    ds_grid_set_region(room_grid, 1, 2, 7, 2, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 8;
    door_at[1,1] = 2;
    
    door_at[2,0] = 4;
    door_at[2,1] = 0;
    
    door_at[3,0] = 4;
    door_at[3,1] = 4;
    
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
    
    // =================================================================
    
    // TYPE II super boring 7x7
    
    // xxxxxxx
    // xxxxxxx
    // xx???xx
    // xx???xx
    // xx???xx
    // xxxxxxx
    // xxxxxxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 9;
    rm_h = 9;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 8, 8, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 7, 7, mapcode.ground);
    
    ds_grid_set_region(room_grid, 3, 3, 5, 5, mapcode.canbehole);
    
    ds_grid_set_region(room_grid, 3, 4, 5, 4, mapcode.ground);
    ds_grid_set_region(room_grid, 4, 3, 4, 5, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 4;
    
    door_at[1,0] = 4;
    door_at[1,1] = 0;
    
    door_at[2,0] = 4;
    door_at[2,1] = 8;
    
    door_at[3,0] = 8;
    door_at[3,1] = 4;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 2)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 3)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE I hallway x7
    
    // ??x??
    // ?xxx?
    // ?xxx?
    // ?xxx?
    // ?xxx?
    // ?xxx?
    // ??x??
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 9;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 8, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 7, mapcode.canbehole);
    
    ds_grid_set_region(room_grid, 2, 2, 4, 6, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 4;
    
    door_at[1,0] = 3;
    door_at[1,1] = 0;
    
    door_at[2,0] = 6;
    door_at[2,1] = 4;
    
    door_at[3,0] = 3;
    door_at[3,1] = 8;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 2)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 3)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE II hallway x9
    
    // ??x??
    // ?xxx?
    // ?xxx?
    // ?xxx?
    // ?xxx?
    // ?xxx?
    // ?xxx?
    // ?xxx?
    // ??x??
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 11;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 10, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 9, mapcode.canbehole);
    
    ds_grid_set_region(room_grid, 2, 2, 4, 8, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 3;
    
    door_at[1,0] = 3;
    door_at[1,1] = 0;
    
    door_at[2,0] = 6;
    door_at[2,1] = 3;
    
    door_at[3,0] = 3;
    door_at[3,1] = 10;
    
    door_at[4,0] = 0;
    door_at[4,1] = 7;
    
    door_at[5,0] = 6;
    door_at[5,1] = 7;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 2)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 5)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE I hallway x7
    
    // ???????
    // ?xxxxx?
    // xxxxxxx
    // ?xxxxx?
    // ???????
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 9;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 8, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 7, 5, mapcode.canbehole);
    
    ds_grid_set_region(room_grid, 2, 2, 6, 4, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 3;
    
    door_at[1,0] = 4;
    door_at[1,1] = 0;
    
    door_at[2,0] = 4;
    door_at[2,1] = 6;
    
    door_at[3,0] = 8;
    door_at[3,1] = 3;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 2)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 3)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE II hallway x9
    
    // ?????????
    // ?xxxxxxx?
    // ?xxxxxxx?
    // ?xxxxxxx?
    // ?????????
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 11;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 10, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 9, 5, mapcode.canbehole);
    
    ds_grid_set_region(room_grid, 2, 2, 8, 4, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 3;
    
    door_at[1,0] = 3;
    door_at[1,1] = 0;
    
    door_at[2,0] = 3;
    door_at[2,1] = 6;
    
    door_at[3,0] = 10;
    door_at[3,1] = 3;
    
    door_at[4,0] = 7;
    door_at[4,1] = 0;
    
    door_at[5,0] = 7;
    door_at[5,1] = 6;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 2)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 5)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE I 2 platforms with crooked bridge
    
    // xxx.xxx
    // xxx.xxx
    // xxx.xxx
    // .x...x.
    // .xxxxx.
    
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
    
    ds_grid_set_region(room_grid, 1, 1, 3, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 5, 1, 7, 3, mapcode.ground);
    
    ds_grid_set_region(room_grid, 2, 5, 6, 5, mapcode.ground);
    
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
    door_at[4,1] = 6;
    
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
    
    // xxx..
    // xxxXx
    // xxx.x
    // ....X
    // Xxx.X 
    // XXXXX
    // XXX..
    
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
    
    ds_grid_set_region(room_grid, 1, 1, 3, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 1, 5, 3, 7, mapcode.ground);
    
    ds_grid_set_region(room_grid, 5, 2, 5, 6, mapcode.ground);
    
    ds_grid_set(room_grid, 4, 2, mapcode.ground);
    ds_grid_set(room_grid, 4, 6, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 0;
    door_at[2,1] = 6;
    
    door_at[3,0] = 2;
    door_at[3,1] = 8;
    
    door_at[4,0] = 6;
    door_at[4,1] = 4;
    
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
    // X.....X
    // X.XXX.X
    // XXXXXXX
    // ..XXX..
    
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
    ds_grid_set_region(room_grid, 3, 5, 5, 7, mapcode.ground);
    
    ds_grid_set_region(room_grid, 1, 4, 1, 6, mapcode.ground);
    ds_grid_set_region(room_grid, 7, 4, 7, 6, mapcode.ground);
    ds_grid_set_region(room_grid, 1, 6, 7, 6, mapcode.ground);
    
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
    
    // =================================================================
    
    // TYPE I 2 platforms with crooked bridge
    
    // xxxxxx.
    // xxx..x.
    // xxx.xxx
    // ....xxX
    // XxX.xxX
    // XXX..x.
    // xxXXXx.
    
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
    ds_grid_set_region(room_grid, 1, 5, 3, 7, mapcode.ground);
    ds_grid_set_region(room_grid, 5, 3, 7, 5, mapcode.ground);
    
    ds_grid_set_region(room_grid, 4, 1, 6, 1, mapcode.ground);
    ds_grid_set_region(room_grid, 4, 7, 6, 7, mapcode.ground);
    ds_grid_set_region(room_grid, 6, 1, 6, 7, mapcode.ground);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 2;
    door_at[2,1] = 8;
    
    door_at[3,0] = 0;
    door_at[3,1] = 6;
    
    door_at[4,0] = 8;
    door_at[4,1] = 4;
    
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
    
    // TYPE I 4 platforms with little walkways
    
    // xxx.xxx
    // xxxxxxx
    // xxx.xxx
    // .x...x.
    // xxx.xxx
    // xxxxxxx
    // xxx.xxx
    
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
    ds_grid_set_region(room_grid, 1, 5, 3, 7, mapcode.ground);
    ds_grid_set_region(room_grid, 5, 1, 7, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 5, 5, 7, 7, mapcode.ground);
    
    ds_grid_set(room_grid, 2, 4, mapcode.ground);
    ds_grid_set(room_grid, 4, 2, mapcode.ground);
    ds_grid_set(room_grid, 6, 4, mapcode.ground);
    ds_grid_set(room_grid, 4, 6, mapcode.ground);
    
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
        
    door_at[4,0] = 0;
    door_at[4,1] = 6;
    
    door_at[5,0] = 2;
    door_at[5,1] = 8;
    
    door_at[6,0] = 8;
    door_at[6,1] = 6;
    
    door_at[7,0] = 6;
    door_at[7,1] = 8;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 2)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 7)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE I tricky walkway
    
    // xxx
    // x?x
    // xxx
    // ?x?
    // ?x?
    // xxx
    // x?x
    // xxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 5;
    rm_h = 10;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 4, 9, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 3, 8, mapcode.hole);
    
    ds_grid_set_region(room_grid, 1, 1, 3, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 1, 6, 3, 8, mapcode.ground);
    
    ds_grid_set_region(room_grid, 2, 4, 2, 5, mapcode.ground);
    
    ds_grid_set_region(room_grid, 1, 4, 1, 5, mapcode.canbeall);
    ds_grid_set_region(room_grid, 3, 4, 3, 5, mapcode.canbeall);
    
    ds_grid_set(room_grid, 2, 7, mapcode.canbehole);
    ds_grid_set(room_grid, 2, 2, mapcode.canbehole);
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 0;
    door_at[0,1] = 2;
    
    door_at[1,0] = 2;
    door_at[1,1] = 0;
    
    door_at[2,0] = 4;
    door_at[2,1] = 2;
    
    door_at[3,0] = 0;
    door_at[3,1] = 7;
    
    door_at[4,0] = 2;
    door_at[4,1] = 9;
    
    door_at[5,0] = 4;
    door_at[5,1] = 7;
    
    // ADD TO FINAL MAP
    ds_map_add(room_map, "width", rm_w)
    ds_map_add(room_map, "height", rm_h)
    ds_map_add(room_map, "size", 1)
    ds_map_add(room_map, "rotation", 0)
    ds_map_add(room_map, "grid", room_grid)
    ds_map_add(room_map, "door array", door_at)
    ds_map_add(room_map, "choices", 5)
    
    // ADD FINAL MAP TO POOL
    ds_list_add(argument0, room_map);
    
    // =================================================================
    
    // TYPE I S walkway

    // xxx.xxxx.
    // xxx.x..x.
    // xxx.x.xxx
    // .x..x.xxx
    // .xxxx.xxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 11;
    rm_h = 7;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 10, 6, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 9, 5, mapcode.hole);
    
    ds_grid_set_region(room_grid, 1, 1, 3, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 7, 3, 9, 5, mapcode.ground);
    
    ds_grid_set_region(room_grid, 2, 5, 5, 5, mapcode.ground);
    ds_grid_set_region(room_grid, 5, 1, 8, 1, mapcode.ground);
    ds_grid_set_region(room_grid, 5, 1, 5, 5, mapcode.ground);
    
    ds_grid_set(room_grid, 2, 4, mapcode.ground)
    ds_grid_set(room_grid, 8, 2, mapcode.ground)
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 2;
    door_at[0,1] = 0;
    
    door_at[1,0] = 0;
    door_at[1,1] = 2;
        
    door_at[2,0] = 8;
    door_at[2,1] = 6;
    
    door_at[3,0] = 10;
    door_at[3,1] = 4;
    
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
    
    // =================================================================
    
    // TYPE I S walkway

    // xxx..
    // xxxxx
    // xxx.x
    // ....x
    // xxxxx
    // x....
    // x.xxx
    // xxxxx
    // ..xxx
    
    var room_map = ds_map_create();
    
    // SIZE STARTING FROM 1
    rm_w = 7;
    rm_h = 11;

    // CREATE GRID
    var room_grid = ds_grid_create(rm_w, rm_h);
    // PAINT GRID
    ds_grid_clear(room_grid, mapcode.void);
    
    ds_grid_set_region(room_grid, 0, 0, 6, 10, mapcode.wall);
    ds_grid_set_region(room_grid, 1, 1, 5, 9, mapcode.hole);
    
    ds_grid_set_region(room_grid, 1, 1, 3, 3, mapcode.ground);
    ds_grid_set_region(room_grid, 3, 7, 5, 9, mapcode.ground);
    
    ds_grid_set_region(room_grid, 5, 2, 5, 5, mapcode.ground);
    ds_grid_set_region(room_grid, 1, 5, 1, 8, mapcode.ground);
    ds_grid_set_region(room_grid, 1, 5, 5, 5, mapcode.ground);
    
    ds_grid_set(room_grid, 4, 2, mapcode.ground)
    ds_grid_set(room_grid, 2, 8, mapcode.ground)
    
    // STORE DOOR / EXIT COORDS / DIRECTION
    var door_at = array_create(0);
        
    door_at[0,0] = 2;
    door_at[0,1] = 0;
    
    door_at[1,0] = 0;
    door_at[1,1] = 2;
        
    door_at[2,0] = 6;
    door_at[2,1] = 8;
    
    door_at[3,0] = 4;
    door_at[3,1] = 10;
    
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
