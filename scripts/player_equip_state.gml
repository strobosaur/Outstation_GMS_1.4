///player_equip_state();

    // INPUT
    get_input();
        
    // HUD
//    oHud.drawstate = hud_draw_equip;
    
    // SPEED    
    spd = LSamp;
    
    // MOVEMENT
    playermove();
    
    // CAMERA POSITION
    camera.close = 0;
    
    // CROSSHAIR
    cross.visible = false;
    
    var hud_fade = oHud.hud_fade_time;
    
    var choices = 0;
    var chosen = 0;
    // MOUNTED?
    if mounted { choices = 3;} else { choices = 5}
    
    // RIGHT ANALOG STICK ENGAGE
    if (RSamp > 0.75) 
    && (GPR1_p)
    {
        // CHOICE        
        chosen = round(((RSdir+270)mod 360) / (360 / choices)) mod choices
        // MENU
        if !mounted
        {
            // INVENTORY INDEX
            if chosen == 0 {equip_menu_index = itemtype.headgear; }
            if chosen == 1 {equip_menu_index = itemtype.weapon; }
            if chosen == 2 {equip_menu_index = itemtype.implant1; }
            if chosen == 3 {equip_menu_index = itemtype.implant2; }
            if chosen == 4 {equip_menu_index = itemtype.armor; }
        }
        else if mounted
        {
            if chosen == 0 {equip_menu_index = itemtype.turret; }
            if chosen == 1 {equip_menu_index = itemtype.implant1; }
            if chosen == 2 {equip_menu_index = itemtype.implant2; }
        }
        
        // NEXT STATE
        if equip_menu_index == itemtype.headgear
        {
            state = player_attributes_state;
            oHud.menu_index = 0;
            oHud.drawstate = hud_draw_attributes;
        }
        else
        {
            state = player_choose_item;
            oHud.menu_index = 0;
            oHud.drawstate = hud_draw_choose;
        }
        
        // SOUND EFFECT
        audio_play_sound(sndMenu01, 20, false);
        
        // BLOCK RIGHT STICK
        RS_menu_block = true;
        
        // HUD SIZE TIMER
        oHud.t[0] = hud_fade;
        
        exit;
    }
    
    // UNEQUIP ITEM
    if RSamp > 0.75 
    && GPL1_p
    {
        // CHOICE        
        chosen = round(((RSdir+270)mod 360) / (360 / choices)) mod choices
        // MENU
        if !mounted
        {
            // INVENTORY INDEX
            if chosen == 0 {equip_menu_index = itemtype.headgear; }
            if chosen == 1 {equip_menu_index = itemtype.weapon; }
            if chosen == 2 {equip_menu_index = itemtype.implant1; }
            if chosen == 3 {equip_menu_index = itemtype.implant2; }
            if chosen == 4 {equip_menu_index = itemtype.armor; }
        }
        else if mounted
        {
            if chosen == 0 {equip_menu_index = itemtype.turret; }
            if chosen == 1 {equip_menu_index = itemtype.implant1; }
            if chosen == 2 {equip_menu_index = itemtype.implant2; }
        }
        // UNEQUIP
        equip_item(-1, equip_menu_index, false);
        
        // SOUND EFFECT
        audio_play_sound(sndMenu01, 20, false);
        
        // FLASH TIMER
        timers[timer.chosen01] = 12;
        
        // HUD TIMER
        oHud.t[0] = hud_fade;
        
//        exit;
    }
    
    // EXIT?    
    if (GPR1_p && RSamp < 0.75) 
    || GPA_p
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
        
