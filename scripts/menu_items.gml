///menu_items()

    get_input()
    
    menu_draw_state = menu_draw_items;
    
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
    
    // HEIGHT INDEX
/*    h_index = global.team_active;
    // HEIGHT & WIDTH TOTAL
    h_total = ds_list_size(global.team)-1;
    v_total = ds_grid_height(global.menu)-1;*/
    
    ///UNPAUSE
    if GPX_p ||GPA_p
    {
        // SOUND
        audio_play_sound(sndMenu01, 15, false);
        // UNPAUSE ROOM
        room_goto(global.unpause_room);
    }
