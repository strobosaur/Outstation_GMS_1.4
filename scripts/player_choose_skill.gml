///player_choose_skill()

    // INPUT
    get_input();
    
    // SPEED    
    spd = LSamp;
    
    // MOVEMENT
    playermove();
    
    var hud_fade = oHud.hud_fade_time;
    
    // CROSSHAIR
    cross.visible = false;
    
    // MENU
    var item_list = eq_skill_list;
    var choices = ds_list_size(item_list);
    var chosen = 0;
    
    // CHOICE
    if (RSamp > 0.75) 
    && (GPR1_p) 
    && !ds_list_empty(item_list)
    {
        // IF THERE ARE CHOICES, SLICE THE PIE
        chosen = round(((RSdir+270)mod 360) / (360 / choices)) mod choices
        
        equip_skill(ds_list_find_value(eq_skill_list, chosen), skill_map, ds_list_find_value(skill_slot_list, equip_menu_index), true);
        
        // SOUND EFFECT
        audio_play_sound(sndMenu02, 20, false);
        
        // RETURN PLAYER STATE
        state = player_equip_state;
        oHud.drawstate = hud_draw_equip;
        
        // BLOCK RIGHT STICK
        RS_menu_block = true;
        
        // FLASH
        timers[timer.chosen01] += 45;
        
        // HUD SIZE TIMER
        oHud.t[0] = hud_fade;
        
        exit;
    }
    
    // BACKTRACK?    
    if (GPR1_p && RSamp < 0.75) 
    || (GPR1_p && ds_list_empty(item_list))
    {
        // RESET STATES & INDEX
        oHud.drawstate = hud_draw_attributes;
        state = player_attributes_state;
        
        // SOUND EFFECT
        audio_play_sound(sndMenu01, 20, false);
        
        // BLOCK RIGHT STICK
        RS_menu_block = true;
        
        // HUD SIZE TIMER
        oHud.t[0] = hud_fade;
        
        exit;
    }
    
    // EXIT?    
    if GPA_p 
    || GPX_p
    {
        state = idle_state;
        oHud.drawstate = hud_draw_idle;
        
        // SOUND EFFECT
        audio_play_sound(sndMenu01, 20, false);
        
        // BLOCK RIGHT STICK
        RS_menu_block = true;
        
        // HUD SIZE TIMER
        oHud.t[0] = hud_fade;
        
        exit;
    }
        
