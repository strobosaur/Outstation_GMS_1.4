///find_furthest_coord(grid, x, y, list of arrays / array)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var clist = argument3;
    
    var size = ds_list_size(clist);
    var coords = 0;
    
    var best = 0;
    var ret = 0;
//    var ret = array_create(0);
    var dist = 0;
    
    for (var i = 0; i <= size-1; i++)
    {
        coords = ds_list_find_value(clist, i);
        dist = point_distance(xx, yy, coords[0], coords[1]);
        
        //NOW HAS BEST DIST
        if dist > best || best == 0
        { 
            best = dist;
            ret = coords;
//            ret[0] = coords[0]
//            ret[1] = coords[1]
        }
        
    }
    
    // RETURN ARRAY W COORDS
    return ret;
