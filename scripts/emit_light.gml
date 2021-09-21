///emit_light(x, y, radius, intensity, color)

    var xx = argument0;
    var yy = argument1;
    var radius = argument2 * sys_light.light_pulse;
    var intensity = argument3 * sys_light.light_pulse;
    var col = argument4;
    
    surface_set_target(sys_light.light_surf);
    draw_set_blend_mode(bm_subtract);
    draw_set_alpha(intensity);
    draw_circle_colour(x, y, radius, col, c_black, false);
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    surface_reset_target();
