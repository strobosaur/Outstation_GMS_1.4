///gp_input(slot 0-3);

    // CHECK DEVICE CONNECTION
    if gamepad_is_connected(argument0)
    {
        // ================================
        // SET STICK DEADZONE
        
        gamepad_set_axis_deadzone(0, 0.0);
        gamepad_set_button_threshold(0, 0.1);
        
        // ================================
        // LEFT STICK AXIS, DIR, AMP
        
        LSX = gamepad_axis_value(0, gp_axislh); // LS X AXIS
        LSY = gamepad_axis_value(0, gp_axislv); // LS Y AXIS
        
//        LSamp = clamp(point_distance(0, 0, LSX, LSY), 0, 2);
        if point_distance(0,0,LSX,LSY) > 0.35
        {
            LSamp = clamp(point_distance(0,0,LSX,LSY),0,1);
//            LSamp = clamp(max(0,(point_distance(0,0, LSX,LSY)-left_deadzone)/(1-left_deadzone)),0,1);
        }
        else
        {
            LSamp = 0;
        }
//        LSamp = abs(LSX) + abs(LSY)
        LSdir = point_direction(0, 0, LSX, LSY);
    
        // ================================
        // RIGHT STICK AXIS, DIR, AMP
        
        RSX = gamepad_axis_value(0, gp_axisrh); // RS X AXIS
        RSY = gamepad_axis_value(0, gp_axisrv); // RS Y AXIS
        
        right_deadzone = 0.15;
        
        if point_distance(0,0,RSX,RSY) > right_deadzone
        {
            RSamp = clamp(point_distance(0,0,RSX,RSY),0,1);
            RSamp = (RSamp - right_deadzone) / (1 - right_deadzone);
        }
        else
        {
            RSamp = 0;
        }
        
        RSdir = point_direction(0, 0, RSX, RSY);
        
        // ================================
        // PAD VARIABLES
        
        GPR = gamepad_button_check(0, gp_padr); // PAD RIGHT
        GPR_p = gamepad_button_check_pressed(0, gp_padr); // PAD RIGHT
        GPR_r = gamepad_button_check_released(0, gp_padr); // PAD RIGHT
        
        GPU = gamepad_button_check(0, gp_padu); // PAD UP
        GPU_p = gamepad_button_check_pressed(0, gp_padu); // PAD UP
        GPU_r = gamepad_button_check_released(0, gp_padu); // PAD UP
        
        GPL = gamepad_button_check(0, gp_padl); // PAD LEFT
        GPL_p = gamepad_button_check_pressed(0, gp_padl); // PAD LEFT
        GPL_r = gamepad_button_check_released(0, gp_padl); // PAD LEFT
        
        GPD = gamepad_button_check(0, gp_padd); // PAD DOWN
        GPD_p = gamepad_button_check_pressed(0, gp_padd); // PAD DOWN
        GPD_r = gamepad_button_check_released(0, gp_padd); // PAD DOWN
        
        // ================================
        // BUTTON VARIABLES
        
        GPB = gamepad_button_check(0, gp_face1); // B, Cross
        GPB_p = gamepad_button_check_pressed(0, gp_face1); // B, Cross
        GPB_r = gamepad_button_check_released(0, gp_face1); // B, Cross
        
        GPA = gamepad_button_check(0, gp_face2); // A. Circle
        GPA_p = gamepad_button_check_pressed(0, gp_face2); // A. Circle
        GPA_r = gamepad_button_check_released(0, gp_face2); // A. Circle
        
        GPY = gamepad_button_check(0, gp_face3); // Y, Square
        GPY_p = gamepad_button_check_pressed(0, gp_face3); // Y, Square
        GPY_r = gamepad_button_check_released(0, gp_face3); // Y, Square
        
        GPX = gamepad_button_check(0, gp_face4); // X, Triangle
        GPX_p = gamepad_button_check_pressed(0, gp_face4); // X, Triangle
        GPX_r = gamepad_button_check_released(0, gp_face4); // X, Triangle
        
        // ================================
        // SHOULDER VARIABLES
        
        GPL1 = gamepad_button_check(0, gp_shoulderl); // L1
        GPL1_p = gamepad_button_check_pressed(0, gp_shoulderl); // L1
        GPL1_r = gamepad_button_check_released(0, gp_shoulderl); // L1
        
        GPL2 = gamepad_button_check(0, gp_shoulderlb); // L2
        GPL2_p = gamepad_button_check_pressed(0, gp_shoulderlb); // L2
        GPL2_r = gamepad_button_check_released(0, gp_shoulderlb); // L2
        
        GPR1 = gamepad_button_check(0, gp_shoulderr); // R1
        GPR1_p = gamepad_button_check_pressed(0, gp_shoulderr); // R1
        GPR1_r = gamepad_button_check_released(0, gp_shoulderr); // R1
        
        GPR2 = gamepad_button_check(0, gp_shoulderrb); // R2
        GPR2_p = gamepad_button_check_pressed(0, gp_shoulderrb); // R2
        GPR2_r = gamepad_button_check_released(0, gp_shoulderrb); // R2
        
        // ================================
        // SHORTBUS VARIABLES
        
        GPL3 = gamepad_button_check(0, gp_stickl); // LS BUTTON
        GPL3_p = gamepad_button_check_pressed(0, gp_stickl); // LS BUTTON
        GPL3_r = gamepad_button_check_released(0, gp_stickl); // LS BUTTON
        
        GPR3 = gamepad_button_check(0, gp_stickr); // RS BUTTON
        GPR3_p = gamepad_button_check_pressed(0, gp_stickr); // RS BUTTON
        GPR3_r = gamepad_button_check_released(0, gp_stickr); // RS BUTTON
        
        GPST = gamepad_button_check(0, gp_start); // START
        GPST_p = gamepad_button_check_pressed(0, gp_start); // START
        GPST_r = gamepad_button_check_released(0, gp_start); // START
        
        GPSL = gamepad_button_check(0, gp_select); // SELECT
        GPSL_p = gamepad_button_check_pressed(0, gp_select); // SELECT
        GPSL_r = gamepad_button_check_released(0, gp_select); // SELECT
    }


