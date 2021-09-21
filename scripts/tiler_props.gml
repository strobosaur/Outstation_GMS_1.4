///tiler_props(grid, trigger, cellsize, object, odds);

    // INPUT
    
    var grid = argument0;
    var trigger = argument1;
    var cell = argument2;
    var prop = argument3;
    var odds = argument4;
    
    // LOCAL
    
    var gw = ds_grid_width(grid);
    var gh = ds_grid_height(grid);
    
    var xx = 0;
    var yy = 0;
    
    // LOOP
    
    for(var cx = 1; cx <= gw; cx++)
    {
        for(var cy = 1; cy <= gh; cy++)
        {
        
        if grid[# cx-1, cy-1] == trigger
        {
            if random(1) < odds
            {
                xx = irandom_range(cx*cell,cx*cell+cell);
                yy = irandom_range(cy*cell,cy*cell+cell);
                
                //DECORATIVE TILE
                instance_create(xx, yy, prop);
            }
        }
    }
}
