///hud_draw_choose(item type)

    /// MENU
    
    /// GET INPUT
    get_input();
    
    // LOCAL
    var wdir = 0;
    var wlen = menu_radius - t[0] * size_fade_multiplier;
    var clen = choice_extra_len;
    
    var player = global.leader;
    var draw_list = ds_list_find_value(global.inventory, player.equip_menu_index);
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
    
    top_is_drawing = false;
    
    var alpha_stick_mod = 0;
        
    // DRAW BACKGROUND
    surface_set_target(background_surf);
    draw_set_color(c_black);
    draw_circle(wx, wy, wlen + menu_border + irandom(1), false);
    surface_reset_target();
                    
    // DRAW TO TEXT SURFACE
    surface_set_target(text_surf);
    
    // MENU TITLE TEXT
    var menu_title = "choose";
    
    switch player.equip_menu_index
    {
        case itemtype.weapon:
        menu_title = "choose weapon";
        break;
        
        case itemtype.armor:
        menu_title = "choose armor";
        break;
        
        case itemtype.implant1:
        menu_title = "choose implant";
        break;
        
        case itemtype.implant2:
        menu_title = "choose implant";
        draw_list = ds_list_find_value(global.inventory, itemtype.implant1); 
        break;
    }
    
    // MENU TITLE
    draw_set_colour(c_white);
    draw_set_alpha(global.alpha)// * alpha_stick_mod);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(MONOBIT12);
    draw_text(wx, wy, menu_title);
    
    // CAMERA CENTER ON CHOICE SPOT
    camera.target[?"x"] = player.x;
    camera.target[?"y"] = player.y;
    
    var item = 0;
    // GET STATS
    if player.mounted
    && player.equip_menu_index == itemtype.turret
    {
        item = player.item_map[? itemtype.weapon];
    }
    else
    {
        item = player.item_map[? player.equip_menu_index];
    }
    // WEAPON EXISTS &                     
    if ds_exists(item, ds_type_map)
    && item[?"itemtype"] != -1
    {
        // TOP SPOT IS NOW TAKEN
        main_menu_index = 1;
        item_type = player.equip_menu_index;
    }
    
    // RIGHT STICK ABOVE THRESHOLD
    if (player.state == player_choose_item) 
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
                var item = draw_list[| chosen];
                var bonus_list = item[?"bonus list"];
                var text = item[? "name"];
                var text_lines = ds_list_size(bonus_list)+1;
                
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
                draw_set_halign(fa_center);
                draw_set_font(MONOBIT12);
                draw_text(mx2, new_y - linebreak, item[? "name"]);
                draw_set_valign(fa_top);
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
    
    // IF HAS TRAIT
/*    if !ds_list_empty(player.trait_list)
    {
        var draw_trait = ds_list_find_value(player.trait_list, 0);
        draw_set_colour(global.menu_color1);
        draw_set_alpha(global.alpha)
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(bot_align_x, bot_align_y-linebreak*2, draw_trait);
    }
    // DRAW HP / HP MAX
    draw_set_colour(global.menu_color1);
    draw_set_alpha(global.alpha)
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(bot_align_x, bot_align_y, string(round(hpnow)) + " / " + string(hpmax));
    draw_text(hpx, hpy-linebreak, "level " + string(player.stats_a[?"level"]));*/
    
    // RESET SURFACE
    surface_reset_target();
    
    // RESET DRAW PARAMS
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_set_colour(c_white);
