///move(hspd, vspd);

    var h_spd = argument0;
    var v_spd = argument1;
    
    // UNSTUCKER
    if grid_place_meeting(global.collision_grid, x, y)
    {
        find_place_free_circle(global.collision_grid, x, y, 0.1);
    }
    
    // HORIZONTAL GRID COLLISION
    if grid_place_meeting(global.collision_grid, x + h_spd, y)
    {
        while !grid_place_meeting(global.collision_grid, x+sign(h_spd), y)
        {
            x += sign(h_spd);
        }
        
        h_spd = 0;
    }
    
    // VERTICAL GRID COLLISION
    if grid_place_meeting(global.collision_grid, x, y + v_spd)
    {
        while !grid_place_meeting(global.collision_grid, x, y+sign(v_spd))
        {
            y += sign(v_spd)
        }
        
        v_spd = 0;
    }
    
    x += h_spd;
    y += v_spd;
