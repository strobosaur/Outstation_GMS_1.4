///menu_options()

    h_total = 0;

    get_input()
    
    menu_draw_state = menu_draw_options;
    
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
    
    // CHANGE MEMBER
    if GPB_p
    {
        // SOUND
        audio_play_sound(sndChoice01, 15, false);
        // CHANGE MEMBER
        global.team_active = h_index;
        // UNPAUSE ROOM
        room_goto(global.unpause_room);
    }
    
    ///UNPAUSE
    if GPX_p ||GPA_p
    {
        // SOUND
        audio_play_sound(sndMenu01, 15, false);
        // UNPAUSE ROOM
        room_goto(global.unpause_room);
    }
