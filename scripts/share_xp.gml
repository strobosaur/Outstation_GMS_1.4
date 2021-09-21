///share_xp(x, y, radius, share to, amount);

    var xx = argument0;
    var yy = argument1;
    var r = argument2;
    var target = argument3;
    var amount = argument4;
    
    // GET LIST
    var list = collision_list_circle(xx, yy, r, target, false, false);
    if list == noone
    {
        exit;
    }
    
    var split = ds_list_size(list) * 0.85;
    
    // SPLIT
    amount = amount / split;
    
    // LOOP THROUGH LIST
    while !ds_list_empty(list)
    {
        var inst = ds_list_find_value(list, 0);
        ds_list_delete(list, 0);
        
        inst.stats_a[?"xp total"] += amount;
        inst.stats_a[?"xp progress"] += amount;
        
//        skill_pts(inst, argument4 * rnd(0.1, 0.05));
    }
    
    // CLEANUP
    ds_list_destroy(list);
