///kb_input();

    RKEY = keyboard_check(ord("D"));
    LKEY = keyboard_check(ord("A"));
    UKEY = keyboard_check(ord("W"));
    DKEY = keyboard_check(ord("S"));

    LSX = (RKEY - LKEY);
    LSY = (DKEY - UKEY);
    LSdir = point_direction(0, 0, LSX, LSY);
    LSamp = clamp(point_distance(0, 0, LSX, LSY), 0, 1);
    
    RSdir = point_direction(x, y, mouse_x, mouse_y);
    
    SHIFT = keyboard_check(vk_shift);
    GPL2 = keyboard_check(vk_shift);
    SPACE = keyboard_check(vk_space);
