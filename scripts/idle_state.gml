///idle_state();

    // INPUT
    get_input();
    
    // UNBLOCK RIGHT STICK
    if RS_menu_block == true && RSamp <= 0.9
    {
        RS_menu_block = false;
    }
    
    // DMG
    var hit_return = 0;
    
    // SPEED    
    spd = LSamp;
    
    // CAMERA POSITION
    camera.close = 0.55;
    
    // RUN?    
    if GPL1
    && timers[timer.dash01] == 0
    && timers[timer.dash02] == 0
    {
        timers[timer.dash01] = room_speed * 6.5;
        timers[timer.dash02] = room_speed * 2;
    }
    
    // IS DASHING!!
    if timers[timer.dash02] > 0
    {
//        oCross.x = x + lengthdir_x(100*RSamp, mdir);
//        oCross.y = y + lengthdir_y(100*RSamp, mdir);
        spd = LSamp * 1.5;
    }
    
    // TARGET
//    target = cross;
    
    tgtx = cross.x;
    tgty = cross.y;

//    coord_map[?"move x"] = x;
//    coord_map[?"move y"] = y;
    
    moveto_x = x;
    moveto_y = y;

//    dir = point_direction(x, y, tgtx, tgty);
    sdir = point_direction(x, y, tgtx, tgty);
    
    // CROSSHAIR
    cross.visible = true;
    
    // MOVEMENT
    playermove();
    
    // MENU STATE   
    if GPR1_p
    {
        state = player_equip_state;
        oHud.drawstate = hud_draw_equip;
        
        // SOUND EFFECT
        audio_play_sound(sndMenu01, 20, false);
        
        // HUD SIZE TIMER
        oHud.t[0] = 5;
        
        exit;
    }
    
    // AIM STATE
    if GPL2 
    && eq_wpn[? "melee"] == false
    {
        turnspd = 0.5;
        state = player_aiming;
        oHud.drawstate = hud_draw_aiming;
        exit;
    }
    
    // ATTACK
    if GPR2
    {
        // MELEE
        if eq_wpn[? "melee"] == true
        {
            hit_return = npc_melee_charge();
        }
        // STANDARD
        else if !mounted 
        {        
            hit_return = fight_state();
        
            // SHAKE
            cam_shake((dir + 180) mod 360, 1 * 0.65, 0);
        }
        // MOUNTED
        else if mounted && deployed
        {        
            hit_return = fight_state();
        
            // SHAKE
            cam_shake((dir + 180) mod 360, 1 * 0.65, 0);
        }
    }
    
    // TURRET
    if GPY && GPU_p 
    && global.r1 >= 10
    {
        global.r1 -= 10;
        var pos = random_radius_free(x, y, rnd(64, 16), global.collision_grid, 1);
        instance_create(pos[0], pos[1], oMount);
    }
    
    // FLEEING
    if stats_a[?"hp"] / stats_a[?"hpmax"] < 0.5 && mounted = false
    {
        // BUTTON PRESSED
        if GPA_p && timers[timer.flee_press] <= 0
        {
            timers[timer.flee_press] += 20;
        }
        // BUTTON MASHED
        if timers[timer.flee_press] > 0 && GPA_p
        {
            timers[timer.flee_press] += 20;
            flee_count++;
        }
        // START FLEEING
        if flee_count >= 3
        {
            flee_count = 0;
            state = player_flee;
            fleeing = true;
            timers[timer.flee_limit] = room_speed * 10;
        }
    }
            
    // LATEST HIT & VIBRATION
    if hit_return > 0 
    {
        latest = hit_return; 
        sh_chrome_shake(0.75, 0.75, 0.3, 0.1); 
        global.vibrate += max(0, (0.2 + (hit_return * 0.00075)));
        hit_return = -1;
    }
    
    // CHECK INTERACTABLES
    if timers[timer.save01] <= 0
    {
        check_interactable();
        timers[timer.save01] = room_speed*0.5 + irandom(10);
    }
    
    // ACTIVATE INTERACTABLE
    if GPB_p
    && global.interactable != noone
//    && instance_exists(global.interactable)
    {
        // WITHIN RANGE?
        if point_distance(x, y, global.interactable.x, global.interactable.y) < 40
        {
            // ACTIVATE INSTANEC
            with global.interactable
            {
                activated = true;
            }
            
            global.interactable = noone;
                    
            // SOUND EFFECT
            audio_play_sound(sndMenu01, 20, false);
        }
    }
    
    // CONTROLS TOGGLE
    if GPX_p
    {
        global.draw_controls = !global.draw_controls;
    }
    
    // PICKUP SCAN
//    pickup_scan();
