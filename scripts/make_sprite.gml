///make_sprite(x, y, sprite, size, speed, fade time sec., image angle)

    var xx = argument0;
    var yy = argument1;
    var sprite = argument2;
    var size = argument3;
    var spd = argument4;
    var fade = argument5;
    var angle = argument6;
    
    var object = instance_create(xx, yy, fxAnim);
    with object
    {
        sprite_index = sprite;
        image_xscale = image_scale_pixels(size, sprite_index);
        image_yscale = image_xscale;
        image_speed = spd;
        decr = fade;
        if angle != -1
        {
            image_angle = angle;
        }
    }
    
    return object;

    
