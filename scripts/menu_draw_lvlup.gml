///menu_draw_lvlup
    
    // DRAW WINDOW
    draw_set_alpha(global.alpha3);
    draw_set_colour(c_black);
    draw_rectangle(margin_x, margin_y, margin_x + size_x, room_height - margin_y, false);
    draw_set_alpha(1);
    // FONT
    draw_set_font(MONOBIT12);
    draw_set_colour(c_white);
    draw_set_alpha(global.alpha);
    
    // LOCAL VARIABLES
//    var length = array_height_2d(stats_up)-1;
    var length = ds_list_size(stats_up)-1;
    
    // ALPHA
    draw_set_alpha(global.alpha);
    
    if instance_exists(menu_gpl1)
    {
        // L1
        menu_gpl1.x = margin_x + size_x * 0.36; 
        menu_gpl1.y = align_y_top_b;
        menu_gpl1.visible = true;
    }
    //    R1
    if instance_exists(menu_gpr1)
    {
        menu_gpr1.x = margin_x + size_x * 0.63;
        menu_gpr1.y = align_y_top_b;
        menu_gpr1.visible = true;
    }
    // GPB
    if instance_exists(menu_gpb)
    {
        menu_gpb.x = align_x + margin_x;
        menu_gpb.y = size_y;
        menu_gpb.visible = true;
    }
    // DRAW TEXT
    
    // MENU STATE & CONTROL
    draw_set_halign(fa_center);
    draw_text(align_x_mid, align_y_top, "Option " + string(s_index+1) + "/" + string(s_total+1));
    draw_text(align_x_left, align_y_top, "UPGRADE");
    
    var ii = 0

        // LOOP THROUGH MENU ARRAY
    for (var i = 0; i <= length; i++)
    {
        ii = 0;
        var stat_array = ds_list_find_value(stats_up, i);
        // DRAW EACH OPTION
        for (var j = 0; j <= array_length_1d(stat_array)-1; j++)
        {
            if j == s_index { draw_sprite_ext(sCross01, 0, hud_pos[j, 0], hud_pos[j, 1], 1, 1, 0, c_white, global.alpha2); }
            // INREASE SPACING
            // DRAW TEXT
            if stat_array[j] != 0
            {
                ii++;
                draw_set_halign(fa_right);
                draw_set_color(c_white);
                draw_text(hud_pos[i, 0], hud_pos[i, 1] +  ii * 12, string(global.stat_menutext[j]))//string(stats_up[s_index, i]));
                draw_set_halign(fa_left)
                draw_set_color(global.menu_color1);
                draw_text(hud_pos[i, 0] + 4, hud_pos[i, 1] + ii * 12, stat_array[j]);
                draw_set_halign(fa_left);
            }
        }
    }
    
    // RESET
    draw_set_alpha(1);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
