///menu_skills()

    get_input();
    
    var current_guy = ds_list_find_value(global.team, h_index);
    var current_statsmap = global.statsbook[? current_guy]; //current_stats = get_statsmap(current_guy, statstype.stats_skl, -1);
    current_stats = current_statsmap[? "skill log"] //    current_stats = ds_list_find_value(global.team, h_index);
    
    menu_draw_state = menu_draw_skills;
    
    menu_gpb.visible = false;
    menu_gpy.visible = false;
    menu_gpa.visible = false;
    menu_gpx.visible = false;
    
    if h_total != 0
    {
        menu_gpl1.visible = false;
        menu_gpr1.visible = false;
    }
    
    // RIGHT LEFT
    if GPL1_p || GPL_p
    { 
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
        h_index--;
    }    
    if GPR1_p || GPR_p
    { 
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
        h_index = (h_index + 1) mod (h_total + 1); 
    }
    // BELOW ZERO?
    if h_index < 0 { h_index = h_total; }
    // UP DOWN
    if GPU_p 
    {
        v_index--
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
    }
    if GPD_p 
    {
        v_index = (v_index + 1) mod (v_total + 1);
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
    }
    if v_index > v_total { v_index = 0; }
    if v_index < 0 {v_index = v_total; }
    
    // ABILITY GAIN
    if global.r_ability > 0 
    {
        menu_gpb.visible = true;
        // NO REFUNDS
        if GPB_p && sure == true && sure_timer <= 0
        {
            sure = false;
            global.r_ability--;
            audio_play_sound(sndPowerup01d, 25, false);
            global.vibrate += 0.35;
            member_levelup = h_index;
            stats_up = level_up_array(5);
            hud_pos = split_line(align_x, align_y, margin_x + size_x, align_y, ds_list_size(stats_up), true);
            v_index = ymenu.upgrade;
        }
        // SURE?
        if GPB_p && sure == false
        {
            sure_timer += 30;
            sure = true;
            audio_play_sound(sndHit02, 25, false);
            global.vibrate += 0.2;
        }
    }
    
    // EXIT MENU
    if GPX_p || GPA_p
    {
        // UNPAUSE ROOM
        room_goto(global.unpause_room);
    }
        
