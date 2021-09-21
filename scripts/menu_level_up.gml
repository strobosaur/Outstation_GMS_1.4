///menu_level_up();    
    
    // OPTIONS    
    menu_draw_state = menu_draw_lvlup;
    s_total = ds_list_size(stats_up)-1;
    var showcase = ds_list_find_value(stats_up, s_index);
    
    get_input();
    
    // RIGHT LEFT
    if GPL1_p || GPL_p
    { 
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
        s_index--;
    }
    // L1 & R1
    if GPR1_p || GPR_p
    { 
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
        s_index++; 
    }
    // BELOW ZERO?
    if s_index > s_total { s_index = 0};
    if s_index < 0 { s_index = s_total; }
    
    // ===========================================================
    
    // MAKE STAT UPPP!
    if GPB_p && (sure == true)
    {
        // FIND EXCHANGE PARTIES
        sure = false;
        audio_play_sound(sndPowerup01, 25, false);
        var stats_array = ds_list_find_value(stats_up, s_index);
        
        for (var i = 0; i < array_length_1d(stats_array); i++)
        {
            if stats_array[i] != 0
            {
//                var guy = ds_list_find_value(global.team, s_index);
                send_statsmap(ds_list_find_value(global.team, h_index), statstype.stats_a, i, stats_array[i]);
            }
        }
        
        // CLEANUP
        menustate = menu_attributes;
        v_index = 0;
        menu_gpl1.visible = false;
        menu_gpr1.visible = false;
        menu_gpy.visible = false;
        menu_gpb.visible = false;
        
    }
    
    // FINAL ANSWER
    if GPB_p && sure == false
    {
        sure = true;
        audio_play_sound(sndHit02, 25, false);
 //       global.vibrate += 0.2;
    }
    
    
