///player_attributes_state()

    // INPUT
    get_input();
    
    // SPEED    
    spd = LSamp;
    
    // MOVEMENT
    playermove();
    
    // CAMERA POSITION
    camera.close = 0;
    
    // CROSSHAIR
    cross.visible = false;
    
    var hud_fade = oHud.hud_fade_time;
    var chosen = 0;
    
    // MOUNTED?
    var choices = ds_list_size(skill_slot_list)+1;
    
    // RIGHT ANALOG STICK ENGAGE ===== ===== ===== ===== =====
    if (RSamp > 0.75) 
    && (GPR1_p) 
    && (choices > 0)
    {
        // CHOICE        
        chosen = round(((RSdir+270)mod 360) / (360 / choices)) mod choices
        
        equip_menu_index = chosen-1;
        
        if chosen == 0
        {
            state = player_choose_active;
            oHud.drawstate = hud_draw_choose_active;
        }
        else
        {
            state = player_choose_skill;
            oHud.drawstate = hud_draw_choose_skill;
        }
        
        // SOUND EFFECT
        audio_play_sound(sndMenu01, 20, false);
        
        // BLOCK RIGHT STICK
        RS_menu_block = true;
        
        // HUD SIZE TIMER
        oHud.t[0] = hud_fade;
        
        exit;
    }
    
    // EXIT? ===== ===== ===== ===== =====
    if (GPR1_p && RSamp < 0.75) 
    || GPA_p 
    || (choices == 0 && GPR1_p)
    {
        // RETURN STATE
        state = player_equip_state;
        oHud.drawstate = hud_draw_equip;
        
        // SOUND EFFECT
        audio_play_sound(sndMenu01, 20, false);
        
        // BLOCK RIGHT STICK
        RS_menu_block = true;
        
        // HUD SIZE TIMER
        oHud.t[0] = hud_fade;
        
        exit;
    }
        
