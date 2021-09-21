///player_aiming();

    // INPUT
    get_input();
    
    // SPEED
    spd = LSamp * 0.5;
    
    var wp_range = get_range(eq_wpn, attack_modifier_list, id);
    
    // TARGET
    tgtx = x + lengthdir_x(wp_range, sdir);
    tgty = y + lengthdir_y(wp_range, sdir);
    
    // MOVEMENT
    playermove();
    
    // CAMERA
    camera.close = 0.75;
    
    // CROSSHAIR
    cross.visible = true;
    
    // CROSSHAIR
//    oCross.visible = false;
    
    // MOUNT?    
    if mounted == true 
    && deployed == false
    {
        turret.dir = dir;
        
        if GPR2 && RSamp > 0.8
        {
            oCross.image_alpha = 0;
            act = FIGHT;
            deployed = true;
            turret.state = turret_mounted;
            angle1 = dir - fire_angle;
            angle2 = dir + fire_angle;
            turret.d_dir = dir;
            d_dir = dir;
            spd = 0;
            state = player_mounted;
            d_matrix[dmx.stability] = 100;
            image_speed = rnd(0.125, 0.25);
            camera.close = 0.45;
            
            exit
        }
    }
    
    // SHOOT    
    if GPR2
    {
        // SHOOT
        var hit = fight_state();
        global.vibrate += (0.2 * hit);
        latest = hit;
    
        // SHAKE
        cam_shake((dir + 180) mod 360, 1, 0);
        
        // STATE
/*        state = idle_state;
        turnspd = 2.5;
        oHud.drawstate = hud_draw_idle;
        camera.close = 0.45;
        
        exit;*/
    }

    // EXIT?
    if GPL2_r
    {
        state = idle_state;
        turnspd = 2.5;
        oHud.drawstate = hud_draw_idle;
        camera.close = 0.45;
        
        exit;
    }
    
    
