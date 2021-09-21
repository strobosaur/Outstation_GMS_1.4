///collision_cone(x, y, rad, target, dir, angle difference)

    var xx = argument0;
    var yy = argument1;
    var rad = argument2;
    var target = argument3;
    var dir = argument4;
    var angle = argument5;

    var list = collision_list_circle(xx, yy, rad, target, false, true);
    var list2 = noone;
    
    if list != noone
    {
        list2 = ds_list_create();
        
        for(var i = 1; i <= ds_list_size(list); i++)
        {
            var inst = list[|i-1]//ds_list_find_value(list, i);
            var idir = point_direction(xx, yy, inst.x, inst.y);
            
            if abs(difference_angle(dir, idir)) < angle
            {
                ds_list_add(list2, inst);
            }
        }
        
        if ds_list_empty(list2)
        {
            ds_list_destroy(list2);
            list2 = noone;
        }
    }
        
    // CLEANUP
    ds_list_destroy(list);
    
    return list2;
