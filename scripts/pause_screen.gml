///pause_screen(pause room);

    // The game always draws to the "application_surface" (see docs for more info).
    var w = surface_get_width(application_surface);
    var h = surface_get_height(application_surface);
    
    // This will create a sprite from the application surface, which will be the screenshot of the game.
    global.pause_img = sprite_create_from_surface(application_surface, 0, 0, w, h, false, false, 0, 0);
    
    room_persistent = true;
    
    global.unpause_room = room;
    room_goto(argument0);
