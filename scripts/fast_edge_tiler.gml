///fast_edge_tiler(source grid, tile type, neighbour type, tile sheet, depth)

    var grid = argument0;
    var trigger_type = argument1;
    var n_type = argument2;
    var sheet = argument3;
    var tile_dpt = argument4;
    
    var sw = background_get_width(sheet);    
    var sh = background_get_height(sheet);
    
    var r = 0;
    
    var tile_types_w = floor(((sw div CELL)-1) div 3);
    var tile_types_h = floor(((sh div CELL)-1) div 3);
    
    for (var i = 0; i < ds_grid_width(grid); i++)
    {
        for (var j = 0; j < ds_grid_height(grid); j++)
        {
            if grid[# i, j] == trigger_type
            {
                if cellR1(grid, i, j, n_type, false) > 0
                {
                    tile_add(sheet, irandom(tile_types_w)*48, irandom(tile_types_h)*48, 48, 48, (i * CELL) - CELL, (j * CELL) - CELL, tile_dpt);
                }
            }
        }
    }
        
