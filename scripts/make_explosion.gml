///make_explosion(x, y, size, dir, dust 0-1)

    var xx = argument0;
    var yy = argument1;
    var size = argument2;
    var dir = argument3;
    var dust = argument4;
    
    // HITFX
    make_boom(xx, yy, size);
    make_sprite(xx, yy, sfxBoom64, rnd(size * 0.8, size * 0.125), 0.5, fade_out(rnd(0.75, 0.1)), 0);
    // DIRT
    make_dust(xx, yy, round(size / 5), size, dir, dust);
    
    // MAKE SHOCKWAVE
    with instance_create(xx, yy, oShockwave)
    {
        wave_spd = round(size / 16);
        wave_dist = size*0.5;
    }
    
    repeat (3 + irandom(3) + round(size / 4))
    {
        var pos = random_radius(xx, yy, lerp(size * 0.5, 16, 0.5));
        // BLASTS
        with instance_create(pos[0], pos[1], fxPuff)
        {
            sprite_index = sfxBoom32_02;
            image_xscale = image_scale_pixels(rnd(lerp(size * 0.5, 16, 0.5), size * 0.1), sfxBoom32_02);
            image_yscale = image_xscale;
            image_speed = rnd(0.4, 0.15);
        }
    }
