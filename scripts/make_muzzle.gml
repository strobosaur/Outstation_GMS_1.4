///make_muzzle(depth)

    var dpt = argument0;
    
    if face == UP
    {
        dpt++;
    }
    else
    {
        dpt--;
    }
    
    // CREATE MUZZLE
    with instance_create(fire_x, fire_y, fxMzl01)
    {
        dir = other.dir;
        depth = dpt;
        if other.face == UP {depth = other.depth+3; }
        else { depth = other.depth-3; }
        scale = rnd(1, 0.05) //max(1, (0.85 + (other.eq_wpn[wp.pwr] * 0.035)));
    }
    
    // CASING
    with instance_create(fire_x, fire_y, fxCasing01)
    {
        dir = rnd(other.dir-90, 20);
    }
