///sh_colors(color, mix amount 0-1)

    shader_set(shMixColor);
    var color = shader_get_uniform(shMixColor, "color01");
    var mixc_u = shader_get_uniform(shMixColor, "u_vMixColor");
    
    var rs = colour_get_red(argument0) / 255;
    var gs = colour_get_green(argument0) / 255;
    var bs = colour_get_blue(argument0) / 255;
    
    shader_set_uniform_f(color, rs, gs, bs);
    shader_set_uniform_f(mixc_u, argument1);
    draw_self();
    shader_reset();
