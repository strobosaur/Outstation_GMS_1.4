///menu_stats()

    h_total = ds_list_size(global.team)-1;
//    current_stats = get_statsmap(current_guy, statstype.stats_a, -1);
    
    // THIS GUY RIGHT HERE
    current_member = ds_list_find_value(global.team, h_index);
    var current_statsmap = global.statsbook[? current_member] //get_statsmap(current_member, statstype.stats_a, -1)
    
    current_a_stats = current_statsmap[? "stats a"]
    current_b_stats = current_statsmap[? "stats b"] //get_statsmap(current_member, statstype.stats_b, -1)
    current_traits = current_statsmap[? "trait list"] //get_statsmap(current_member, statstype.stats_trt, -1);
    // WEAPON STATS
    attack_matrix = current_statsmap[? "amx"]; //get_statsmap(current_member, statstype.stats_am, -1);
    // ARMOR STATS
    defense_matrix = current_statsmap[? "dmx"];
    
    // DRAW ARRAYS
    
    draw_stats[0] = string(current_b_stats[b_stats.hp]) + "/" + string(current_b_stats[b_stats.hpmax]);
    draw_stats_txt[0] = "hp: ";
    
    draw_stats[1] = string(current_a_stats[a_stats.bac] + defense_matrix[dmx.ac]);
    draw_stats_txt[1] = "armor class: ";
    
    draw_stats[2] = string(current_a_stats[a_stats.bth] + attack_matrix[wpntype.allw, amx.th_rolls]) + " +" + string(current_a_stats[a_stats.th_plus]);
    draw_stats_txt[2] = "hit chance: ";
    
    draw_stats[3] = string(defense_matrix[dmx.stability]);
    draw_stats_txt[3] = "stability: ";
    
    draw_stats[4] = string(current_b_stats[b_stats.mspd]);
    draw_stats_txt[4] = "move speed: ";
    
    draw_stats[5] = string(current_b_stats[b_stats.regen]);
    draw_stats_txt[5] = "regen: ";
    
    draw_stats[6] = string(current_b_stats[b_stats.focus]);
    draw_stats_txt[6] = "focus: ";

    get_input()
    
//    par_menubutton.visible = false;
//    menu_gpr1.visible = true;
//    menu_gpl1.visible = true;

    menu_draw_state = menu_draw_stats;
    
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
        audio_play_sound(sndMenu02, 15, false);
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
