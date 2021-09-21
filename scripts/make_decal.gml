///make_decal(target surface);

    var surface = argument0;
    
    if surface_exists(surface)
    {
        surface_set_target(surface);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
        surface_reset_target();
    }
