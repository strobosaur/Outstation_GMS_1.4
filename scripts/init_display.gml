///init_display(scale mode);

    // RESET DISPLAY & ENABLE V-SYNC
    
    display_reset(0, true);

    // Disable application surface
    
    application_surface_draw_enable(false);

    // GET DISPLAY VALUES
        
    var gw = global.game_width;
    var gh = global.game_height;
    
    var dw = max(1, display_get_width());
    var dh = max(1, display_get_height());
        
    // RUN MAXIMUM SCALE SCRIPT
        
    scale = screenscaler(argument0);
        
    // SET UP VIEW PROPERTIES
        
    init_view(0);
    
    // RESIZE GUI TO VIEW
    
    display_set_gui_size(view_wview[0], view_hview[0]);
    
    // SET ROOM SPEED
    
    room_speed = global.FPS;
        
    // FULLSCREEN
    
    window_set_fullscreen(false) //global.fullscreen);
    
    // TEXTURE INTERPOLATION
    
    texture_set_interpolation(false);
            
    // FIND OFFSET VALUES
    
    xoffs = ((dw - (gw * scale)) div 2);
    yoffs = ((dh - (gh * scale)) div 2);
    
    // RESIZE APP SURFACE

    surface_resize(application_surface, gw, gh);
    
    

