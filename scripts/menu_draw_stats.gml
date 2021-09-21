///menu_draw_stats()
    
    // DRAW WINDOW
    draw_set_alpha(global.alpha3);
    draw_set_colour(c_black);
    draw_rectangle(margin_x, margin_y, margin_x + size_x, room_height - margin_y, false);
    // FONT
    draw_set_font(MONOBIT12);
    draw_set_colour(c_white);
    
    // LOCAL VARIABLES
//    var draw_stats_txt = global.menu[# v_index, xmenu.text];
//    var draw_stats = get_statsmap(ds_list_find_value(global.team, h_index), statstype.stats_a, -1);
//    var length = min(array_length_1d(draw_stats_txt)-1, array_length_1d(draw_stats)-1);
//    var length = array_length_1d(draw_stats_txt)-1;
    
    // ALPHA
    draw_set_alpha(global.alpha);
    
    if h_total != 0
    {
        if instance_exists(menu_gpl1)
        {
            // BUTTON L1
            menu_gpl1.x = margin_x + size_x * 0.36;
            menu_gpl1.y = align_y - 10;
            menu_gpl1.visible = true;
        }
        
        if instance_exists(menu_gpr1)
        {
            // BUTTON R
            menu_gpr1.x = margin_x + size_x * 0.63;
            menu_gpr1.y = align_y - 10;
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
    
    // DRAW WEAPON TEXT ===== ===== ===== ===== ===== ===== =====
    
    // COLUMN COUNTER
    var column = 0
    var draw_type = 0;
    var start_at = 0;
            
    // DRAW STATS
    draw_set_colour(c_white);
    draw_set_font(MONOBIT12);
    draw_set_alpha(global.alpha);
    
    // DRAW WEAPONS ARRAY CONTENTS ===== ===== ===== =====
    for (var i = 0; i < array_length_1d(draw_stats); i ++)
    {
        column++;
        // DRAW NUMBERS
        draw_set_halign(fa_left);
        draw_set_color(global.menu_color1);
        draw_text(align_x + h2, align_y + ((column mod vmax) * 12), string(draw_stats[i]));
        // DRAW STRINGS
        draw_set_halign(fa_right);
        draw_set_color(c_white);
        draw_text(align_x + h2 - 4, align_y + ((column mod vmax) * 12), draw_stats_txt[i]);
        draw_set_halign(fa_left);
    }
    
    // NEW COLUMN
//    h2 += 128;
    var line_break2 = 0;
    
    // DRAW TRAITS ARRAY CONTENTS ===== ===== ===== =====
    if !ds_list_empty(current_traits)
    {
        for (var i = 0; i <= ds_list_size(current_traits)-1; i++)
        {
            line_break2++;
            // DRAW NUMBERS
            draw_set_halign(fa_left);
            draw_set_color(global.menu_color1);
            draw_text(align_x + 128 + h2, align_y + ((line_break2 mod vmax) * 12), ds_list_find_value(current_traits, i));
            // DRAW STRINGS
/*            draw_set_halign(fa_right);
            draw_set_color(c_white);
            draw_text(align_x + 128 + h2 - 4, align_y + ((line_break2 mod vmax) * 12), draw_atxt[i]);
            draw_set_halign(fa_left);*/
        }
    }
    else
    {
        // NO ARMOR EQUIPPED
        draw_set_halign(fa_left);
        draw_set_color(global.menu_color1);
        draw_text(align_x + 128 + h2, align_y, " ");
    }
            
    // RESET
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
    

    
    // COLUMN COUNTER
/*    var column = 0
    var draw_type = 0;
    var start_at = 0;
    
    // LOOP THROUGH MENU ARRAY
    for (var i = 0; i <= length; i++)
    {
        // NEW COLUMN
        if column > 0 && column mod vmax == 0 { h2 += 128; }
        
        // DRAW STATS
        draw_set_colour(c_white);
        draw_set_font(MONOBIT12);
        draw_set_alpha(global.alpha);
        
        // DRAW TEXT
        if is_string(draw_stats_txt[i])
        {
            column++;
            draw_set_halign(fa_left);
//            draw_text(align_x + h2, align_y + ((column mod vmax) * 12), string(current_stats[i]));
            draw_text(align_x + h2, align_y + ((column mod vmax) * 12), string(current_stats[i + start_at]));
            draw_set_halign(fa_right);
            draw_text(align_x + h2 - 4, align_y + ((column mod vmax) * 12), draw_stats_txt[i]);
            draw_set_halign(fa_left);
        }
        // SMART STUFF
        if i == array_length_1d(current_stats)-1 + start_at
        {
            draw_type++;
            start_at -= array_length_1d(current_stats)-1;
            current_stats = get_statsmap(ds_list_find_value(global.team, h_index), draw_type, -1);
        } 
    }
    
    // RESET
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
