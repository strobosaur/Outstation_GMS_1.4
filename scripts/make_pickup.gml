///make_pickup(x, y, item)

    var xx = argument0;
    var yy = argument1;
    var item = argument2;
    
    var inst = instance_create(xx, yy, oPickup);
    with inst
    {
        contained_item = item;
        name_text = item[?"name"];
    }
    
    return inst;
