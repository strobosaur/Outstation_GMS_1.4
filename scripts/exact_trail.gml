///exact_trail(ps, pt, xx, yy);

    // LOCAL
    
    var _ps = argument0;
    var _pt = argument1;
    var x0 = argument2;
    var y0 = argument3;

    // FIRST PARTICLE

    part_particles_create(_ps, x0, y0, _pt, 1);
    
    // FILL BACKWARDS

    var dist = ceil(speed);
    var dir = (point_direction(x + hspeed, y + vspeed, x, y));
    
    // LOOP
    
    for(var px = 0; px <= dist; px++)
    {
        var xx = x0 + lengthdir_x(px, dir);
        var yy = y0 + lengthdir_y(px, dir);
        
        part_particles_create(_ps, xx, yy, _pt, 1);
    }
