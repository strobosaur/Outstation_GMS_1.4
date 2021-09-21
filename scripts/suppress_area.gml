///suppress_area(x, y, r, target, suppression amount, shellshock amount)

    var xx = argument0;
    var yy = argument1;
    var r = argument2;
    var target = argument3;
    var suppress = argument4;
    var shellshock = argument5;
    var falloff = 0.5;
//    var kb = argument6;
    
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
        amount = 1 * max(0.1, (1 - ((dist / (r + 8)) * falloff)));
        
        // MAKE STATUS
        inst.timers[timer.suppressed] = seconds(1) * suppress * amount;
        // MAKE STATUS
        inst.timers[timer.shellshock] = seconds(1) * shellshock * amount;
    }
    
    // CLEANUP
    ds_list_destroy(list);

    
