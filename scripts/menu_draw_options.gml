///menu_draw_options()
    
    // DRAW WINDOW
    draw_set_alpha(global.alpha3);
    draw_set_colour(c_black);
    draw_rectangle(margin_x, margin_y, margin_x + size_x, room_height - margin_y, false);
    // FONT
    draw_set_font(MONOBIT12);
    draw_set_colour(c_white);
    // ALPHA
    draw_set_alpha(global.alpha);
    
    // LOCAL VARIABLES
    var menutxt = global.menu[# v_index, xmenu.text];
    var statstxt = global.menu[# v_index, xmenu.main];
    var length = array_length_2d(statstxt, h_index) - 2;
    
    // ALPHA
    draw_set_alpha(global.alpha);
    
    if h_total != 0
    {
        if instance_exists(menu_gpl1)
        {
            // BUTTON L1
            menu_gpl1.x = margin_x + size_x * 0.33;
            menu_gpl1.y = align_y_top_b;
            menu_gpl1.visible = true;
        }
        
        if instance_exists(menu_gpr1)
        {
            // BUTTON R
            menu_gpr1.x = margin_x + size_x * 0.66;
            menu_gpr1.y = align_y_top_b;
            menu_gpr1.visible = true;
        }
    }
    
    // MENU STATE & CONTROL
    draw_set_halign(fa_center);
    draw_text(align_x_mid, align_y_top, "Unit " + string(h_index + 1) + "/" + string(h_total + 1));
    draw_text(align_x_left, align_y_top, global.menu[# v_index, 0]);
    // ARROWS
    arrows.image_alpha = global.alpha;
    arrows.x = margin_x + 16;
    arrows.y = align_y - 10;
    // LEADER
    if h_index == global.team_active
    {
        draw_set_halign(fa_right);
        draw_set_alpha(global.alpha);
        draw_set_color(make_colour_hsv(pulse_mid(0.1, 0.075 * 255, 110), 85, 255));
        draw_text(align_x_right, align_y_top, "ACTIVE");
        draw_set_alpha(1);
        draw_set_halign(fa_left);
    }
    
    var ii = 0
    
    // LOOP THROUGH MENU ARRAY
/*    for (var i = 0; i < length; i++)
    {        
        // NEW COLUMN
        if ii > 0 && ii mod vmax == 0 { h2 += 128; }
        
        // DRAW STATS
        draw_set_colour(c_white);
        draw_set_font(MONOBIT12);
        
        // DRAW TEXT
        if is_string(menutxt[i])
        {
            ii++;
            draw_set_halign(fa_left);
            draw_text(align_x + h2, align_y + ((ii mod vmax) * 12), string(statstxt[h_index, i]));
            draw_set_halign(fa_right);
            draw_text(align_x + h2 - 4, align_y + ((ii mod vmax) * 12), menutxt[i]);
            draw_set_halign(fa_left);
        }
    }   
