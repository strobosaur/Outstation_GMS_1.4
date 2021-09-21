///hud_draw_choose_active()

    /// MENU
    
    /// GET INPUT
    get_input();
    
    // LOCAL
    var wdir = 0;
    var wlen = menu_radius - ease_out_cubic(t[0] * size_fade_multiplier, 0, hud_fade_time * size_fade_multiplier, hud_fade_time * size_fade_multiplier);
    var clen = choice_extra_len;
    
    var player = global.leader;
    var draw_list = unit_data.skill_list;
    var chosen = 0;
    
    var wx = player.x - view_xview;
    var wy = player.y - view_yview;
    
    var hpnow = player.stats_a[?"hp"];
    var hpmax = player.stats_a[?"hpmax"];
    
    var px = wx + lengthdir_x(RSamp * wlen, RSdir);
    var py = wy + lengthdir_y(RSamp * wlen, RSdir);
            
    var mx = wx + lengthdir_x(wlen, 90);
    var my = wy + lengthdir_y(wlen, 90);
    
    var chosen_text_dist = 24;
                
    var mx2 = mx + lengthdir_x(chosen_text_dist, 90);
    var my2 = my + lengthdir_y(chosen_text_dist, 90);
    
    var top_align_x = wx;
    var top_align_y = wy - top_align_yy;
    
    var bot_align_x = wx;
    var bot_align_y = wy + bot_align_yy;
    
    var hpx = wx;
    var hpy = bot_align_y //wy + wlen
    
    var linebreak = line_break_dist;
    var top_drawing = false;
    
    var alpha_stick_mod = 0;
        
    // DRAW BACKGROUND
    surface_set_target(background_surf);
    draw_set_color(c_black);
    draw_circle(wx, wy, wlen + menu_border + irandom(1), false);
    surface_reset_target();
                    
    // DRAW TO TEXT SURFACE
    surface_set_target(text_surf);
    
    // MENU TITLE
    draw_set_colour(c_white);
    draw_set_alpha(global.alpha)// * alpha_stick_mod);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(MONOBIT12);
    draw_text(wx, wy, "pick path");
    
    // CAMERA CENTER ON CHOICE SPOT
    camera.target[?"x"] = player.x;
    camera.target[?"y"] = player.y;
    
    main_menu_index = 2;
    
    // RIGHT STICK ABOVE THRESHOLD
    if (player.state == player_choose_active) 
    && !ds_list_empty(draw_list)
    && (RSamp > 0.5)
    {
        var choices = ds_list_size(draw_list);
        var slice = 360 / choices;
        
        // RS DIR
        chosen = round(((RSdir + 270) mod 360) / slice) mod choices;
        
        // DRAW CHOICE BLOPS
        for (var i = 0; i < choices; i++)
        {
            wdir = 90 + i * slice;
            
            mx = wx + lengthdir_x(wlen, wdir);
            my = wy + lengthdir_y(wlen, wdir);
            
            // DRAW THE CHOICE IN STICK DIRECTION
            if (RSamp > 0.5) 
            && (i == chosen)
            {  
                // STICK & CLOSENESS TO CHOICE SPOT
                var angmod = abs(angle_difference((RSdir + 270) mod 360, (i * slice) mod 360));
                size = 1 + (2 * (RSamp - 0.5)) * (ease_out_cubic((((slice/2) - angmod) / (slice/2)), 0.3, 1, 1) * 2.5);
                alpha_stick_mod = ease_out_cubic((((slice/2) - angmod) / (slice/2)), 0, 1, 1)
            
                // TEXT CHOICES
                var item = ds_list_find_value(draw_list, chosen);
                var bonus_list = item[?"text"];
                var text = item[? "name"];
                var text_lines = ds_list_size(bonus_list)+1;
                
                // ADD PLAYER LEVEL TEXT
                switch text
                {
                    case "combat":
                    text += " lvl. " + string(player.skill_log[?"combat_lvl"]);
                    break;
                    
                    case "melee":
                    text += " lvl. " + string(player.skill_log[?"melee_lvl"]);
                    break;
                    
                    case "defense":
                    text += " lvl. " + string(player.skill_log[?"defense_lvl"]);
                    break;
                    
                    case "overkill":
                    text += " lvl. " + string(player.skill_log[?"overkill_lvl"]);
                    break;
                    
                    case "bloodlust":
                    text += " lvl. " + string(player.skill_log[?"bloodlust_lvl"]);
                    break;
                }
                
                mx2 = mx + lengthdir_x(chosen_text_dist + text_lines * 2, wdir);
                my2 = my + lengthdir_y(chosen_text_dist + text_lines * 2, wdir);
                var new_y = my2 - (floor(text_lines * 0.5 * linebreak))
                
                // CAMERA CENTER ON CHOICE SPOT
                camera.target[?"x"] = lerp(player.x, mx2 + view_xview, 0.75); //player.x + lengthdir_x(wlen + clen, wdir);
                camera.target[?"y"] = lerp(player.y, my2 + view_yview, 0.75); //player.y + lengthdir_y(wlen + clen, wdir);
                
                surface_reset_target();
                // DRAW CHOICE SPOT BACKGROUND
                surface_set_target(background_surf);
                draw_set_colour(c_black);
                draw_set_alpha(1);
                draw_circle(mx2, my2, choice_radius + (text_lines * 3) + irandom(1), false);
                surface_reset_target();
                    
                // DRAW TO TEXT SURFACE
                surface_set_target(text_surf);
                
                var line_breaks = 0;
                
                // DRAW
                draw_set_colour(global.menu_color1);
                draw_set_alpha(global.alpha2);
                draw_set_halign(fa_center);
                draw_set_valign(fa_top);
                draw_set_font(MONOBIT12);
                
                // DRAW ALL THE BONUS LINES
                for (var j = 1; j <= ds_list_size(bonus_list); j++)
                {
                    draw_text(mx2, new_y + (line_breaks * linebreak), bonus_list[| j-1]);
                    line_breaks++;
                }
                
                // DRAW NAME
                draw_set_colour(c_white);
                draw_set_alpha(global.alpha);
                draw_text(mx2, new_y - linebreak, text);
            }
            else
            {
                size = 1;
            }
        }
    }
    // LIST EMPTY
    else if !ds_list_empty(draw_list)
    && (RSamp > 0.5)
    {
        // DRAW
        draw_set_colour(c_white);
        draw_set_alpha(global.alpha);
        draw_set_halign(fa_center);
        draw_set_font(MONOBIT12);
        draw_text(wx, wy + 16, "empty");
    }
    
    // RESET SURFACE
    surface_reset_target();
    
    // RESET DRAW PARAMS
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_set_colour(c_white);
