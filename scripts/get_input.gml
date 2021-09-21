///get_input()

    // FROM WHAT
    
    if gamepad_is_connected(sys_core.gamepad_slot)
    {
        gp_input(sys_core.gamepad_slot);
    }
    else
    {
        kb_input();
    }
