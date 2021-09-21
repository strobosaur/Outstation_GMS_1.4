///find_random_cells(room grid, x1, y1, x2, y2)

    var grid = argument0;
    
    var x1 = argument1;
    var y1 = argument2;
    var x2 = argument3;
    var y2 = argument4;
    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    // DECIDE CELL STATES
    var rhole = choose(mapcode.ground, mapcode.hole);
    var rwall = choose(mapcode.ground, mapcode.wall);
    var rall = choose(mapcode.ground, mapcode.hole, mapcode.wall);
    
    // LOOP THRU ROOM
    for (var i = x1; i <= x2; i++)
    {
        for (var j = y1; j <= y2; j++)
        {
            // HOLE
            if grid[# i-1, j-1] == mapcode.canbehole
            {
                grid[# i-1, j-1] = rhole;
            }
            // WALL
            if grid[# i-1, j-1] == mapcode.canbewall
            {
                grid[# i-1, j-1] = rwall;
            }
            // CAN BE ALL
            if grid[# i-1, j-1] == mapcode.canbeall
            {
                grid[# i-1, j-1] = rall;
            }
        }
    }
