///sprite_animate(sprite index, speed)

    var sprite = argument0;
    var spd = argument1;
    
    timers[timer.anim01] = sprite_get_number(sprite) * spd;
