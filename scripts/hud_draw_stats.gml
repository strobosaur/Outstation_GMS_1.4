///hud_draw_stats()
                
    // IF IN MENU, DRAW BASE STATS
    if drawstate == hud_draw_equip
    || drawstate == hud_draw_choose
    || drawstate == hud_draw_choose_active
    || drawstate == hud_draw_attributes
    {
        // LOCAL
        var wdir = 0;
        var wlen = menu_radius - (t[0] * 2);
        var clen = choice_extra_len;
        
        var player = global.leader;
        var chosen = 0;
        
        var wx = player.x - view_xview;
        var wy = player.y - view_yview;
    
        var top_align_x = wx;
        var top_align_y = wy - top_align_yy;
        
        var bot_align_x = wx;
        var bot_align_y = wy + bot_align_yy;
        
        var hpx = wx;
        var hpy = bot_align_y
        
        var linebreak = line_break_dist;
        
        // DRAW TO TEXT SURFACE
        surface_set_target(text_surf);
        
        // IF TOP IS NOT DRAWING, DRAW STATS
        if !top_is_drawing
        {
            // WHAT INDEX TO DRAW?
            switch main_menu_index
            {
                // DRAW ATTRIBUTES === === === === === === ===
                case 0:
                var line_breaks = 0;
                
                draw_set_colour(global.menu_color1);
                draw_set_alpha(global.alpha)
                draw_set_halign(fa_center);
                draw_set_valign(fa_top);
                
                // DRAW XP
                draw_text(bot_align_x, top_align_y+0*linebreak, "xp: " + string(round(player.stats_a[?"xp progress"])) + "/" + string(player.stats_a[?"xp next"]));
                // DRAW AC
                draw_text(bot_align_x-column_break, top_align_y+1*linebreak, "ac: " + string(get_ac(player, player.eq_armor, player.base_armor)));
                // DRAW AMR BONUS
                draw_text(bot_align_x-column_break, top_align_y+2*linebreak, "amr: " + string(player.eq_armor[?"amr_bonus"] + player.base_armor[?"amr_bonus"]));
                // DRAW DMG BONUS
                var min_dmg = player.eq_wpn[?"d_rolls"] + (player.stats_a[?"base d_plus"] + player.eq_wpn[?"d_plus"] + check_bonus_list(player.attack_modifier_list, "d_plus", player))
                var max_dmg = (player.eq_wpn[?"d_rolls"] * (player.eq_wpn[?"d_sides"] + check_bonus_list(player.attack_modifier_list, "d_sides", player))) + (player.stats_a[?"base d_plus"] + player.eq_wpn[?"d_plus"] + check_bonus_list(player.attack_modifier_list, "d_plus", player));
                draw_text(bot_align_x+column_break, top_align_y+1*linebreak, "dmg: " + string(min_dmg) + "-" + string(max_dmg));
                // DRAW TO HIT
                var th_plus = player.stats_a[?"base th_plus"] + player.eq_wpn[?"th_plus"] + check_bonus_list(player.attack_modifier_list, "th_plus", player);
                var th_rolls = player.stats_a[?"base th_rolls"] + player.eq_wpn[?"th_rolls"] + check_bonus_list(player.attack_modifier_list, "th_rolls", player);
                draw_text(bot_align_x+column_break, top_align_y+2*linebreak, "th: +" + string(th_plus) + " x" + string(th_rolls));
                // DRAW CRIT
                var crit_chance = player.stats_a[?"base crit"] + player.eq_wpn[?"crit"] + check_bonus_list(player.attack_modifier_list, "crit", player);
                var crit_multiple = player.stats_a[?"base multiplier"] + player.eq_wpn[?"multiplier"] + check_bonus_list(player.attack_modifier_list, "multiplier", player);
                draw_text(bot_align_x, top_align_y+3*linebreak, "crt: " + string(round((crit_chance/50)*100)) + "% = dmg x" + string(crit_multiple));
                
                break;
                
                // DRAW EQUIPPED ITEM === === === === === === ===
                case 1:
                // GET STATS
                if player.mounted
                && item_type == itemtype.turret
                {
                    item_type = itemtype.weapon;
                }
                
                var item = player.item_map[? item_type];
                // WEAPON EXISTS &                     
                if ds_exists(item, ds_type_map)
                && item[?"itemtype"] != -1
                {
                    var bonus_list = item[?"bonus list"];
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
                        draw_text(top_align_x, top_align_y + (lines * linebreak), bonus_list[| j-1]);
                        lines++;
                    }
                    
                    // DRAW EQUIPPED ITEM TEXT
                    draw_set_colour(c_white);
                    draw_set_alpha(global.alpha);
                    draw_text(top_align_x, top_align_y, "eq: " + item[? "name"]);
                }
                
                break;
                
                // DRAW ACTIVE SKILL === === === === === === === ===
                case 2:
                // GET STATS
                var skill = player.active_skill;
                
                var text = skill[?"name"];
                var bonus_list = skill[?"text"];
                var lines = 1;
                
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
                // SET DRAW PARAMETERS
                draw_set_colour(global.menu_color1);
                draw_set_alpha(global.alpha2);
                draw_set_halign(fa_center);
                draw_set_font(MONOBIT12);
                
                // DRAW ALL THE BONUS LINES
                for (var j = 1; j <= ds_list_size(bonus_list); j++)
                {
                    draw_text(top_align_x, top_align_y + (lines * linebreak), bonus_list[| j-1]);
                    lines++;
                }
                
                // DRAW EQUIPPED ITEM TEXT
                draw_set_colour(c_white);
                draw_set_alpha(global.alpha);
                draw_text(top_align_x, top_align_y, "eq: " + text);
                
                break;
                
                // DRAW EQUIPPED SKILL === === === === === === === === === === ===
                case 3:
                
                var skill = player.skill_map[?ds_list_find_value(player.skill_slot_list, item_type)];
            
                // TEXT CHOICES
                //var text_lines = ds_list_size(bonus_list1)+1 + ds_list_size(bonus_list2)+1
                var line_breaks = 0;
                
                // DRAW
                draw_set_colour(global.menu_color1);
                draw_set_alpha(global.alpha2);
                draw_set_halign(fa_center);
                draw_set_valign(fa_top);
                draw_set_font(MONOBIT12);
                
                // DRAW ACTIVE LIST TEXT
                if ds_map_exists(skill, "active list")
                {
                    var bonus_list1 = skill[?"active list"];
                    // DRAW ALL THE BONUS LINES
                    for (var j = 1; j <= ds_list_size(bonus_list1); j++)
                    {
                        bonus_array = bonus_list1[| j-1];
                        draw_text(top_align_x, top_align_y + (line_breaks * linebreak), bonus_array[itembonus.name]);
                        line_breaks++;
                    }
                }
                // DRAW PASSIVE LIST TEXT
                ds_map_exists(skill, "passive list")
                {
                    var bonus_list2 = skill[?"passive list"];
                    // DRAW ALL THE BONUS LINES
                    for (var k = 1; k <= ds_list_size(bonus_list2); k++)
                    {
                        bonus_array = bonus_list2[| k-1];
                        draw_text(top_align_x, top_align_y + (line_breaks * linebreak), bonus_array[itembonus.name]);
                        line_breaks++;
                    }
                }
                
                // DRAW NAME
                draw_set_colour(c_white);
                draw_set_alpha(global.alpha);
                draw_set_halign(fa_center);
                draw_set_font(MONOBIT12);
                draw_text(top_align_x, top_align_y - linebreak, skill[? "name"]);
                draw_set_valign(fa_top);
                
                break;
            }
        }
        
        // DRAW HP & ARMOR & SKILL & TRAIT
        // DRAW ACTIVE SKILL
        draw_set_colour(global.menu_color1);
        draw_set_alpha(global.alpha)
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(bot_align_x, bot_align_y-4*linebreak, player.active_skill[?"name"]);
        
        // IF HAS TRAIT
        if !ds_list_empty(player.trait_list)
        {
            var draw_trait = ds_list_find_value(player.trait_list, 0);
            draw_text(bot_align_x, bot_align_y-3*linebreak, draw_trait);
        }
    
        // DRAW HP / HP MAX
        draw_text(hpx, hpy, string(round(player.stats_a[?"hp"])) + "/" + string(player.stats_a[?"hpmax"]));
        draw_text(hpx, hpy - linebreak*2, "level " + string(player.stats_a[?"level"]));
        
        // DRAW ARMOR POINTS
        var amrnow = player.stats_a[?"armor points"];
        var amrmax = 0;
        
        if ds_exists(player.eq_armor, ds_type_map)
        || ds_exists(player.base_armor, ds_type_map)
        {
            amrmax = player.eq_armor[?"amr_total"] + player.base_armor[?"amr_total"];
        }
        if amrmax != 0
        {
            draw_text(hpx, hpy + linebreak, string(round(amrnow)) + "/" + string(amrmax));
        }
        
        // RESET DRAW PARAMS
            
        // RESET TEXT SURFACE
        surface_reset_target();
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(1);
        draw_set_colour(c_white);
        
        main_menu_index = chosen_menu_index;
        item_type = 0;
    }
