///player_choose_item()

    // INPUT
    get_input();
    
    // SPEED    
    spd = LSamp;
    
    // MOVEMENT
    playermove();
    
    var hud_fade = oHud.hud_fade_time;
    
    // CROSSHAIR
    cross.visible = false;
    
    var item_list_index = equip_menu_index;
    if item_list_index = itemtype.implant2 { item_list_index = itemtype.implant1; }
    
    if (item_list_index == itemtype.weapon || item_list_index == itemtype.turret)
    && (GPU_p || GPD_p)
    {
        if item_list_index == itemtype.weapon { item_list_index = itemtype.turret; }
        if item_list_index == itemtype.turret { item_list_index = itemtype.weapon; }
    }
    
    // MENU
    var item_list = ds_list_find_value(global.inventory, item_list_index);
    var choices = ds_list_size(item_list);
    var chosen = 0;
    
    // CHOICE
    if (RSamp > 0.75) 
    && (GPR1_p) 
    && !ds_list_empty(item_list)
    {
        // IF THERE ARE CHOICES, SLICE THE PIE
        chosen = round(((RSdir+270)mod 360) / (360 / choices)) mod choices
        var item = ds_list_find_value(item_list, chosen)
        
        // EQUIP CHOSEN ITEM
        equip_item(item, equip_menu_index, true);
        
        // SOUND EFFECT
        audio_play_sound(sndMenu02, 20, false);
        
        // RETURN PLAYER STATE
        state = player_equip_state;
        oHud.drawstate = hud_draw_equip;
        equip_menu_index = -1;
        
        // BLOCK RIGHT STICK
        RS_menu_block = true;
        
        // FLASH
        timers[timer.chosen01] += 45;
        
        // HUD SIZE TIMER
        oHud.t[0] = hud_fade;
        
        exit;
    }
    
    // UNEQUIP ITEM
    if GPL1_p
    {
        // IF THERE ARE CHOICES, SLICE THE PIE
        if choices > 0
        {
            chosen = round(((RSdir+270)mod 360) / (360 / choices)) mod choices
        }
        else
        {
            chosen = 0;
        }
        
        // UNEQUIP
        equip_item(-1, equip_menu_index, false);
        
        // BLOCK RIGHT STICK
        RS_menu_block = true;
        
        // SOUND EFFECT
        audio_play_sound(sndMenu01, 20, false);
        
        // FLASH TIMER
        timers[timer.chosen01] = 12;
        
        // HUD SIZE TIMER
        oHud.t[0] = hud_fade;
        
//        exit;
    }
    
    // BACKTRACK?    
    if (GPR1_p && RSamp < 0.75) 
    || (GPR1_p && ds_list_empty(item_list))
    {
        // RESET STATES & INDEX
        oHud.drawstate = hud_draw_equip;
        state = player_equip_state;
        equip_menu_index = -1;
        
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
        
