///make_fx(x, y, dir, size, sprite, image speed)

    var xx = argument0;
    var yy = argument1;
    var dir = argument2;
    var size = argument3;
    var sprite = argument4;
    
    with instance_create(argument0, argument1, fxBoom01)
    {
        sprite_index = argument4;
        image_speed = argument5;
        image_angle = argument2;
        image_xscale = argument3 / sprite_get_width(argument4);
        image_yscale = image_xscale;
    }
    
    
