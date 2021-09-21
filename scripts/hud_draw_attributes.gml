///hud_draw_attributes

    /// MENU
    
    /// GET INPUT
    get_input();
    
    // LOCAL
    var wdir = 0;
    var wlen = menu_radius - t[0] * 2;
    var clen = choice_extra_len;
    
    var player = global.leader;
    var chosen = 0;
    
    var wx = player.x - view_xview;
    var wy = player.y - view_yview;
    
    var hpnow = player.stats_a[?"hp"];
    var hpmax = player.stats_a[?"hpmax"];
    var amrnow = player.stats_a[?"armor points"];
    var amrmax = 0;
    
    if ds_exists(player.eq_armor, ds_type_map)
    || ds_exists(player.base_armor, ds_type_map)
    {
        amrmax = player.eq_armor[?"amr_total"] + player.base_armor[?"amr_total"];
    }
    
    var eq_type = -1;
    
    var px = wx + lengthdir_x(RSamp * wlen, RSdir);
    var py = wy + lengthdir_y(RSamp * wlen, RSdir);
    
    var top_align_x = wx;
    var top_align_y = wy - top_align_yy;
    
    var bot_align_x = wx;
    var bot_align_y = wy + bot_align_yy;
    
    var hpx = wx;
    var hpy = bot_align_y
    
    var linebreak = line_break_dist;
    var top_drawing = false;
        
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
    draw_text(wx, wy, "attributes");
    
    // CAMERA CENTER ON CHOICE SPOT
    camera.target[?"x"] = player.x;
    camera.target[?"y"] = player.y;
    
    // BUTTON PRESS
    if (player.state == player_attributes_state)
    {
        choices = ds_list_size(player.skill_slot_list)+1; 
        var slice = 360 / choices;
        
        // RS DIR
        chosen = round(((RSdir + 270) mod 360) / slice) mod choices;
        
        if choices > 0
        {
            // DRAW OPTIONS
            for (var i = 0; i < choices; i++)
            {
                wdir = 90 + i * slice;
                
                var mx = wx + lengthdir_x(wlen, wdir);
                var my = wy + lengthdir_y(wlen, wdir);
                var mx2 = mx + lengthdir_x(clen, wdir);
                var my2 = my + lengthdir_y(clen, wdir);
                
                // SIZE
                if (RSamp > 0.5) 
                && (i == chosen)
                {
                    // CAMERA CENTER ON CHOICE SPOT
                    camera.target[?"x"] = player.x + lengthdir_x((wlen + clen) * 0.75, wdir);;
                    camera.target[?"y"] = player.y + lengthdir_y((wlen + clen) * 0.75, wdir);;
                    
                    // STICK & CLOSENESS TO CHOICE SPOT
                    var angmod = abs(angle_difference((RSdir + 270) mod 360, (i * slice) mod 360));
                    size = 1 + (2 * (RSamp - 0.5)) * (ease_out_cubic((((slice/2) - angmod) / (slice/2)), 0.3, 1, 1) * 2.5);
                    var alpha_stick_mod = ease_out_cubic((((slice/2) - angmod) / (slice/2)), 0, 1, 1)
                    
                    surface_reset_target();
                    // DRAW CHOICE BACKGROUND CIRCLE
                    surface_set_target(background_surf);
                    draw_set_alpha(1);
                    draw_set_colour(c_black);
                    draw_circle(mx2, my2, choice_radius + irandom(1), false);
                    surface_reset_target();
                    
                    // DRAW TO TEXT SURFACE
                    surface_set_target(text_surf);
                
                    // TEXT CHOICES
                    var choice_name = "empty"
                    
                    // ACTIVE SKILL
                    if chosen == 0 
                    { 
                        choice_name = "active skill";
                        
                        // IF CHOSEN EQUIP SPOT IS PASSIVE SKILL MAP, DRAW STATS
                        var active_skill = player.active_skill;
                        
                        if ds_exists(active_skill, ds_type_map)
                        {
                            // TOP SPOT IS NOW TAKEN
                            main_menu_index = 2;
                            
                            // GET STATS
/*                            var bonus_list = active_skill[?"text"];
                            var text_line = "";
                            var lines = 1;
                            
                            // SET DRAW PARAMETERS
                            draw_set_colour(global.menu_color1);
                            draw_set_alpha(global.alpha2);
                            draw_set_halign(fa_center);
                            draw_set_valign(fa_top);
                            draw_set_font(MONOBIT12);
                            
                            // DRAW ALL THE BONUS LINES
                            for (var j = 1; j <= ds_list_size(bonus_list); j++)
                            {
                                text_line = bonus_list[| j-1];
                                draw_text(top_align_x, top_align_y + (lines * linebreak), text_line);
                                lines++;
                            }
                            
                            // DRAW EQUIPPED ITEM TEXT
                            draw_set_colour(c_white);
                            draw_set_alpha(global.alpha);
                            draw_set_halign(fa_center);
                            draw_set_font(MONOBIT12);
                            draw_text(top_align_x, top_align_y, "eq: " + active_skill[? "name"]);*/
                        }
                    }
                    // PASSIVE SLOTS
                    else
                    {
                        choice_name = player.skill_slot_list[| chosen-1];
                        
                        var passive_skill = player.skill_map[?ds_list_find_value(player.skill_slot_list, chosen-1)];
                        if ds_exists(passive_skill, ds_type_map)
                        {
                            // TOP SPOT IS NOW TAKEN
                            main_menu_index = 3;
                            item_type = chosen-1;
                        }
                        
/*                        choice_name = player.skill_slot_list[| chosen-1];
                    
                        // IF CHOSEN EQUIP SPOT IS PASSIVE SKILL MAP, DRAW STATS
                        var equipped_skill = player.skill_map[? choice_name];
                        
                        if ds_exists(equipped_skill, ds_type_map)
                        && equipped_skill != -1
                        {
                            // TOP SPOT IS NOW TAKEN
                            top_drawing = true;
                            
                            // GET STATS
                            var bonus_list = equipped_skill[?"passive list"];
                            var lines = 1;
                            var text_line = "";
                            
                            // SET DRAW PARAMETERS
                            draw_set_colour(global.menu_color1);
                            draw_set_alpha(global.alpha2);
                            draw_set_halign(fa_center);
                            draw_set_valign(fa_top);
                            draw_set_font(MONOBIT12);
                            
                            // DRAW ALL THE BONUS LINES
                            for (var j = 1; j <= ds_list_size(bonus_list); j++)
                            {
                                text_line = bonus_list[| j-1];
                                draw_text(top_align_x, top_align_y + (lines * linebreak), text_line);
                                lines++;
                            }
                            
                            // DRAW EQUIPPED ITEM TEXT
                            draw_set_colour(c_white);
                            draw_set_alpha(global.alpha);
                            draw_set_halign(fa_center);
                            draw_set_font(MONOBIT12);
                            draw_text(top_align_x, top_align_y, "eq: " + equipped_skill[? "name"]);
                        }*/
                    }
                    
                    // DRAW CHOSEN SPOT NAME TEXT
                    draw_set_colour(c_white);
                    draw_set_alpha(global.alpha)// * alpha_stick_mod);
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_middle);
                    draw_set_font(MONOBIT12);
                    draw_text(mx2, my2, choice_name);
                }
                else
                {
                    size = 1;
                }
            }
        }
            
        // DRAW HP & TRAITS IF TOP IS CLEAR
        // IF HAS TRAIT
/*        if !ds_list_empty(player.trait_list)
        {
            var draw_trait = ds_list_find_value(player.trait_list, 0);
            draw_set_colour(global.menu_color1);
            draw_set_alpha(global.alpha)
            draw_set_halign(fa_center);
            draw_set_valign(fa_bottom);
            draw_text(bot_align_x, bot_align_y-2*linebreak, draw_trait);
        }
    
        // DRAW HP / HP MAX
        draw_set_colour(global.menu_color1);
        draw_set_alpha(global.alpha)
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(hpx, hpy, string(round(hpnow)) + " / " + string(hpmax));
        draw_text(hpx, hpy - linebreak, "level " + string(player.stats_a[?"level"]));
        
        // DRAW ARMOR POINTS
        if amrmax != 0
        {
            draw_text(hpx, hpy + linebreak, string(round(amrnow)) + " / " + string(amrmax));
        }*/
    }
    
    // RESET DRAW PARAMS
        
    // RESET TEXT SURFACE
    surface_reset_target();
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_set_colour(c_white);
