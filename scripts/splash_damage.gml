///splash_damage(x, y, radius, target, damage, falloff 0-1)

    var xx = argument0;
    var yy = argument1;
    var r = argument2;
    var target = argument3;
    var dmg = argument4;
    var falloff = argument5;
    
    var alldmg = 0;
    var basedmg = 0;
    
    // GET LIST
    var list = collision_list_circle(xx, yy, r, target, false, true);
    if list == noone
    {
        return alldmg;
    }
    
    // LOOP THROUGH LIST
    while !ds_list_empty(list)
    {
        var inst = ds_list_find_value(list, 0);
        ds_list_delete(list, 0);
        
        var dist = point_distance(xx, yy, inst.x, inst.y);
        
        var knockdir = point_direction(xx, yy, inst.x, inst.y) + rnd(0, 24);
        basedmg = dmg * clamp(max(0.01, (1 - ((dist / (r + 8)) * falloff))), 0, 1);
        
        // DEAL DAMAGE
        if tohit_roll(id, inst) 
        {
            alldmg += do_damage(basedmg, id, inst);
            
            // CRITICAL FX
            if critical_hit
            {
                make_critical_fx(xx, yy, basedmg, inst);
            }
        }
    }
    
    // CLEANUP
    ds_list_destroy(list);
    
    // RETURN
    return alldmg;
