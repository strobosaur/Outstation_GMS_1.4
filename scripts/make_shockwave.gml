///make_shockwave(x, y, r, target, amount, suppress, shellshock)

    var xx = argument0;
    var yy = argument1;
    var r = argument2;
    var target = argument3;
    var amount = argument4;
    var t_suppression = argument5;
    var t_shellshock = argument6 * 0.75;
    var falloff = 1 //argument5;
    
    // GET LIST
    var list = collision_list_circle(xx, yy, r, target, false, true);
    if list == noone
    {
        exit;
    }
    
    // LOOP THROUGH LIST
    while !ds_list_empty(list)
    {
        var inst = ds_list_find_value(list, 0);
        ds_list_delete(list, 0);
        
        var dist = point_distance(xx, yy, inst.x, inst.y);
        
        var knockdir = point_direction(xx, yy, inst.x, inst.y) + rnd(0, 24);
        var shock = amount * max(0.1, (1 - ((dist / (r + 8)) * falloff)));
        
        // KNOCKBACK
        knockback(inst, knockdir, shock);
        // MAKE STATUS
        inst.timers[timer.suppressed] += seconds(0.5) * t_suppression;
        // MAKE STATUS
        inst.timers[timer.shellshock] += seconds(0.5) * t_shellshock;
//        inst.timers[timer.shellshock] = seconds(2.5);
//        inst.timers[timer.suppressed] = seconds(4.5);
    }
    
    // CLEANUP
    ds_list_destroy(list);

    
