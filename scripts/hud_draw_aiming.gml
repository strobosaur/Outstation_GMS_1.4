///hud_draw_aiming()

    get_input();

    // AIMING    
    player = global.leader;
    
    if player.state == player_aiming 
    && player.mounted == false //&& RSamp > 0
    {
        var adir = point_direction(player.x, player.y, oCross.x, oCross.y);
        var adist = player.eq_wpn[? "range"];
    
        // DRAW STRAIGHT AIM LINE
        for (var i = 12; i < adist - 3; i += 12)
        {
            var xx = player.x + lengthdir_x(i, adir);
            var yy = player.y - 2 + lengthdir_y(i, adir);
            var alpha = (ease_in_sine(i / (adist), 0, 1, 1) * ease_out_sine((adist - i) / adist, 0, 1, 1)) * 2.75 * global.alpha;
            
            // DRAW
            draw_set_alpha(alpha);
            draw_set_colour(c_white);
            draw_point(xx, yy);
            draw_set_alpha(1.0);
        }
        
        // DRAW WEAPON SPREAD BRACKETS
//            var acc = ease_in_out_cubic((player.focus * 0.15) + get_spread(player.eq_wpn, player.a_matrix), 1, 40, 40);
        var acc = player.eq_wpn[?"spread"] + check_bonus_list(player.attack_modifier_list, "spread", player);
        var reload_time = player.eq_wpn[?"atkspd"] + check_bonus_list(player.attack_modifier_list, "atkspd", player);
        acc = acc + ((acc*2) * (player.timers[timer.wp01] / reload_time));
        
        var adist = point_distance(player.x, player.y, oCross.x, oCross.y);
        
        for(var i = 0; i < 2; i += 1)
        {
            var mid_dist = 16// + (player.timers[timer.wp01]);
            var bx = player.x + lengthdir_x((adist - mid_dist / 2) + i * mid_dist, player.dir - acc);
            var by = player.y + lengthdir_y((adist - mid_dist / 2) + i * mid_dist, player.dir - acc);
            
            var cx = player.x + lengthdir_x((adist - mid_dist / 2) + i * mid_dist, player.dir + acc);
            var cy = player.y + lengthdir_y((adist - mid_dist / 2) + i * mid_dist, player.dir + acc);
            
            // DRAW
            draw_set_alpha(oCross.image_alpha * (player.timers[timer.wp01] / reload_time))
            draw_set_colour(c_white);
            draw_point(bx, by);
            draw_point(cx, cy);
            draw_set_alpha(1.0);
        }
    }
    
    // DEPLOYED
    if (player.state == player_aiming && RSamp > 0 && player.mounted == true) 
    || player.deployed == true
    {
        if player.deployed == false
        {
            var adir = point_direction(player.x, player.y, oCross.x, oCross.y);
        }
        else
        {
            var adir = player.d_dir;
        }
        if player.mounted == true
        {
            var adist = player.eq_wpn[? "range"];
            var turret = player.turret;
            var fire_angle = player.fire_angle;
        
            for (var i = 12; i < adist - 3; i += 12)
            {
                var xx = turret.x + lengthdir_x(i, adir);
                var yy = turret.y - 2 + lengthdir_y(i, adir);
                var alpha = (ease_in_sine(i / (adist), 0, 1, 1) * ease_out_sine((adist - i) / adist, 0, 1, 1)) * 1.5 * global.alpha;
                
                // DRAW
                draw_set_alpha(alpha); 
                draw_set_colour(c_white);
                draw_point(xx, yy);
                draw_set_alpha(1.0);
            }
            for (var i = 12; i < adist - 3; i += 4)
            {
                var alpha = (ease_in_sine(i / (adist), 0, 1, 1) * ease_out_sine((adist - i) / adist, 0, 1, 1)) * 1.5 * global.alpha;
                var bx = turret.x + lengthdir_x(i, adir - fire_angle);
                var by = turret.y + lengthdir_y(i, adir - fire_angle);
                
                var cx = turret.x + lengthdir_x(i, adir + fire_angle);
                var cy = turret.y + lengthdir_y(i, adir + fire_angle);
                
                // DRAW
                draw_set_alpha(alpha);
                draw_set_colour(c_white);
                draw_point(bx, by);
                draw_point(cx, cy);
                draw_set_alpha(1.0);
            }
        }
    }
    
