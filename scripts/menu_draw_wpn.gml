///menu_draw_wpn()
    
    // DRAW WINDOW
    draw_set_alpha(global.alpha3);
    draw_set_colour(c_black);
    draw_rectangle(margin_x, margin_y, margin_x + size_x, room_height - margin_y, false);
    // FONT
    draw_set_font(MONOBIT12);
    draw_set_colour(c_white);
    // ALPHA
    draw_set_alpha(global.alpha);
    
    menu_gpy.visible = false;
    
    // IF HORIZONTAL OPTIONS
    if h_total != 0
    {
        if instance_exists(menu_gpl1)
        {
            // BUTTON L1
            menu_gpl1.x = margin_x + size_x * 0.36;
            menu_gpl1.y = align_y_top_b;
            menu_gpl1.visible = true;
        }
        
        if instance_exists(menu_gpr1)
        {
            // BUTTON R
            menu_gpr1.x = margin_x + size_x * 0.63;
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
        draw_set_color(global.menu_color1);
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
    
    h2 = 0;
    
    // DRAW WEAPONS ARRAY CONTENTS ===== ===== ===== =====
    for (var i = 0; i < array_length_1d(draw_wpn); i ++)
    {
        // NEW COLUMN
        if column > 0 && column mod vmax == 0 { h2 += 128; }
        
        column++;
        // DRAW NUMBERS
        draw_set_halign(fa_left);
        draw_set_color(global.menu_color1);
        draw_text(align_x + h2, align_y + ((column mod vmax) * 12), string(draw_wpn[i]));
        // DRAW STRINGS
        draw_set_halign(fa_right);
        draw_set_color(c_white);
        draw_text(align_x + h2 - 4, align_y + ((column mod vmax) * 12), draw_txt[i]);
        draw_set_halign(fa_left);
    }
    // DRAW BONUSES
    for (var i = column; i < ds_list_size(current_bonus_list); i++)
    {
        column++;
        // DRAW NUMBERS
        draw_set_halign(fa_left);
        draw_set_color(global.menu_color1);
        draw_text(align_x + h2, align_y + ((column mod vmax) * 12), string(current_bonus_list[| i]));
        draw_set_colour(c_white);
    }
    
    // NEW COLUMN
    var line_break2 = 0;
    
    // DRAW ARMOR ARRAY CONTENTS ===== ===== ===== =====
/*    if current_armor != -1
    {
        for (var i = 0; i < array_length_1d(draw_armor); i ++)
        {
            // ONLY IF HAS STATS
            if draw_armor[i] != 0
            {   
                line_break2++;
                // DRAW NUMBERS
                draw_set_halign(fa_left);
                draw_set_color(global.menu_color1);
                draw_text(align_x + 128 + h2, align_y + ((line_break2 mod vmax) * 12), string(draw_armor[i]));
                // DRAW STRINGS
                draw_set_halign(fa_right);
                draw_set_color(c_white);
                draw_text(align_x + 128 + h2 - 4, align_y + ((line_break2 mod vmax) * 12), draw_atxt[i]);
                draw_set_halign(fa_left);
            }
        }
    }
    else
    {
        // NO ARMOR EQUIPPED
        draw_set_halign(fa_left);
        draw_set_color(global.menu_color1);
        draw_text(align_x + 128 + h2, align_y + 12, "no armor");
    }*/
            
    // RESET
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
    

