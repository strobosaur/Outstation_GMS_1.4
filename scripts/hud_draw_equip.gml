///hud_draw_equip

    /// MENU
    
    /// GET INPUT
    get_input();
    
    // LOCAL
    var wdir = 0;
    var wlen = menu_radius - (t[0] * 2);
    var clen = choice_extra_len;
    
    var player = global.leader;
    var chosen = 0;
    
    var wx = player.x - view_xview;
    var wy = player.y - view_yview;
    
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
    
    top_is_drawing = false;
        
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
    draw_text(wx, wy, "main");
    
    
    // CAMERA CENTER ON CHOICE SPOT
    camera.target[?"x"] = player.x;
    camera.target[?"y"] = player.y;
    
    // BUTTON PRESS
    if (player.state == player_equip_state)
    {
        var choices = 0;
        if player.mounted { choices = 3; } else { choices = 5; }
            
        var inv = global.inventory;
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
                    var text = "empty"
                    
                    // IF DROID
                    if !player.mounted
                    {
                        if chosen == 0 { text = "attributes"; eq_type = itemtype.headgear; }
                        if chosen == 1 { text = "weapon"; eq_type = itemtype.weapon;}
                        if chosen == 2 { text = "implant 1"; eq_type = itemtype.implant1;}
                        if chosen == 3 { text = "implant 2"; eq_type = itemtype.implant2;}
                        if chosen == 4 { text = "armor"; eq_type = itemtype.armor;}
                    }
                    // IF TURRET
                    else if player.mounted
                    {
                        if chosen == 0 { text = "weapon"; eq_type = itemtype.weapon;}
                        if chosen == 1 { text = "implant 1"; eq_type = itemtype.implant1;}
                        if chosen == 2 { text = "implant 2"; eq_type = itemtype.implant2;}
                    }
                    
                    // DRAW CHOSEN NAME TEXT
                    draw_set_colour(c_white);
                    draw_set_alpha(global.alpha)// * alpha_stick_mod);
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_middle);
                    draw_set_font(MONOBIT12);
                    draw_text(mx2, my2, text);
                    
                    // IF CHOSEN EQUIP SPOT IS ITEM MAP, DRAW STATS
                    var item = player.item_map[? eq_type];
                    
                    if ds_exists(item, ds_type_map)
                    && item[?"itemtype"] != -1
                    {
                        // TOP SPOT IS NOW TAKEN
                        //top_is_drawing = true;
                        main_menu_index = 1;
                        item_type = eq_type;
                        
                        // GET STATS
/*                        var bonus_list = item[?"bonus list"];
                        var text = item[? "name"]
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
                            text = bonus_list[| j-1];
                            draw_text(top_align_x, top_align_y + (lines * linebreak), text);
                            lines++;
                        }
                        
                        // DRAW EQUIPPED ITEM TEXT
                        draw_set_colour(c_white);
                        draw_set_alpha(global.alpha);
                        draw_set_halign(fa_center);
                        draw_set_valign(fa_top);
                        draw_set_font(MONOBIT12);
                        draw_text(top_align_x, top_align_y, "eq: " + item[? "name"]);*/
                    }
                }
                else
                {
                    size = 1;
                }
            }
        }
            
        // DRAW HP & TRAITS IF TOP IS CLEAR
    }
    
    // RESET DRAW PARAMS
        
    // RESET TEXT SURFACE
    surface_reset_target();
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_set_colour(c_white);
