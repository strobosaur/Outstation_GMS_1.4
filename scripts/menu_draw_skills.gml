///menu_draw_skills()
    
    // DRAW WINDOW
    draw_set_alpha(global.alpha3);
    draw_set_colour(c_black);
    draw_rectangle(margin_x, margin_y, margin_x + size_x, room_height - margin_y, false);
    // FONT
    draw_set_font(MONOBIT12);
    draw_set_colour(c_white);
    // ALPHA
    draw_set_alpha(global.alpha);
    
//    menu_gpy.visible = false;
    
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
        draw_set_color(make_colour_hsv(pulse_mid(0.1, 0.075 * 255, 110), 85, 255));
        draw_text(align_x_right, align_y_top, "ACTIVE");
        draw_set_alpha(1);
        draw_set_halign(fa_left);
    }
    
    // DRAW SKILL TEXT ===== ===== ===== ===== ===== ===== =====
    
    var draw_txt = global.menu[# ymenu.skill, xmenu.text];
    var draw_skills = current_stats;
//    var draw_abilities = current_abilities;
    
    // COLUMN COUNTER
    var column = 0
    var draw_type = 0;
    var start_at = 0;
            
    // DRAW STATS
    draw_set_colour(c_white);
    draw_set_font(MONOBIT12);
    draw_set_alpha(global.alpha);
    
    for (var i = 0; i < skills.stop; i ++)
    {
        if draw_skills[i, 0] > 0
        {
            // NEW COLUMN
            if column > 0 && column mod vmax == 0 { h2 += 128; }
            
            column++;
            draw_set_halign(fa_left);
            draw_set_color(global.menu_color1);
            draw_text(align_x + h2, align_y + ((column mod vmax) * 12), string(draw_skills[i, 0]));
            draw_set_halign(fa_right);
            draw_set_color(c_white);
            draw_text(align_x + h2 - 4, align_y + ((column mod vmax) * 12), draw_txt[i]);
            draw_set_halign(fa_left);
        }
    }
    
    // NEW COLUMN
    var line_break2 = 0;
    
    // DRAW ABILITIES
    for (var i = 0; i < skills.stop; i ++)
    {
        // ONLY IF HAS STATS
        if draw_skills[i, 1] != 0
        {   
            line_break2++;
            // DRAW NUMBERS
            draw_set_halign(fa_left);
            draw_set_color(global.menu_color1);
            draw_text(align_x + 128 + h2, align_y + ((line_break2 mod vmax) * 12), string(draw_skills[i, 1]));
            // DRAW STRINGS
            draw_set_halign(fa_right);
            draw_set_color(c_white);
            draw_text(align_x + 128 + h2 - 4, align_y + ((line_break2 mod vmax) * 12), draw_txt[i]);
            draw_set_halign(fa_left);
        }
    }
            
    // RESET
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
        
    // CAN LEVEL UP?
    if global.r_ability > 0
    {
        if instance_exists(menu_gpb)
        {
            // BUTTON Y
            menu_gpb.x = align_x_mid - 32;
            menu_gpb.y = size_y;
            menu_gpb.visible = true;
        }
    
        // CAN LEVEL UP?
        if global.r_ability > 0
        {                
            draw_set_alpha(global.alpha2);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(make_colour_hsv(pulse_mid(0.1, 0.075 * 255, 110), 85, 255));
            // CAN LEVEL
            draw_text(align_x_mid, size_y, "UPGRADE");
            draw_set_alpha(1);
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
    }
