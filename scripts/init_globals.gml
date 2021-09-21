///init_globals(game res x, game res y);

    // INITIALIZE GLOBALS
    // ==================

    global.game_width = argument0; // Game window Width
    global.game_height = argument1; // Game window Height

    global.time = 0; // System time
    global.challenge = 0; // Challenge meter

    global.fullscreen = false; // FULLSCREEN
    
    global.paused = false; // PAUSED
    
    global.FPS = 60; // ROOM SPEED
    
    global.vibrate = 0; // GAMEPAD VIBRATION
    
    global.effects_volume = 0; // AUDIO VOLUME
    
    gamepad_set_vibration(0, 0, 0); // RESET VIBRATION
    
    global.ps = part_system_create(); // PARTICLE SYSTEM
    part_system_depth(global.ps, -100000); // PS DEPTH
    
    
