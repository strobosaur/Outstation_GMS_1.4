///nearest_in_list(xx, yy, list)

    var xx = argument0;
    var yy = argument1;
    var list = argument2;
    
    if ds_list_empty(list)
    {
        return noone;
    }
    
    var inst = list[|0]//ds_list_find_value(list, 0);;
    var best = point_distance(xx, yy, inst.x, inst.y);
    var ret = inst;
    var dist = 0;
    
    for(var i = 1; i <= ds_list_size(list); i++)
    {
        inst = list[|i-1] //ds_list_find_value(list, i);
        dist = point_distance(xx, yy, inst.x, inst.y)
        if dist < best
        {
            best = dist;
            ret = list[|i-1]//ds_list_find_value(list, i);
        }
    }
    
//    ds_list_destroy(list);
    
    return ret;
