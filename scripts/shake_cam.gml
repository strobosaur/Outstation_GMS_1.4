///shake_cam();

    var slen = random(global.shake * 0.0625);
    var sdir = irandom(360);

    var xs = global.xshake + lengthdir_x(slen, sdir);
    var ys = global.yshake + lengthdir_y(slen, sdir);

    // UPDATE VIEW POSITION
    
    view_xview += xs;
    view_yview += ys;
//    view_angle = random_range(-global.zshake * 0.5, global.zshake * 0.125);

    // GAMEPAD VIBRATION
    
    gamepad_set_vibration(0, global.vibrate, global.vibrate);
    
    // REDUCE AMOUNT
    
    global.shake *= 0.95;
    global.xshake *= 0.95;
    global.yshake *= 0.95;
    global.vibrate *= 0.5;
    
/*    if (global.shake <= 0.01)
    {
        global.shake = 0;
        global.xshake = 0;
        global.yshake = 0;
    }     
