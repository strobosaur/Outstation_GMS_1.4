///make_boom(x, y, size)

    var xx = argument0;
    var yy = argument1;
    var size = argument2;
    
    if size > 56
    {
        with instance_create(xx, yy, fxBoom01)
        {
            sprite_index = sfxBoom64;
            image_xscale = size / 64;
            image_yscale = image_xscale;
        }
    }
    else if size > 40
    {
        with instance_create(xx, yy, fxBoom01)
        {
            sprite_index = sfxBoom48;
            image_xscale = size / 48;
            image_yscale = image_xscale;
        }
    }
    else if size > 28
    {
        with instance_create(xx, yy, fxBoom01)
        {
            sprite_index = sfxBoom32;
            image_xscale = size / 32;
            image_yscale = image_xscale;
        }
    }
    else if size > 20
    {
        with instance_create(xx, yy, fxBoom01)
        {
            sprite_index = sfxBoom24;
            image_xscale = max(0.5, size / 24);
            image_yscale = image_xscale;
        }
    }
    else
    {
        with instance_create(xx, yy, fxBoom01)
        {
            sprite_index = sfxBoom16;
            image_xscale = max(0.75, size / 16);
            image_yscale = image_xscale;
        }
    }
