///make_flash(x, y, size)

    var xx = argument0;
    var yy = argument1,
    var size = argument2;
    
    repeat(5)
    {
        var pos = random_radius(xx, yy, size * 0.5);
        make_sprite(pos[0], pos[1], sfxBoom16, rnd(16, 2), 0.5, fade_out(rnd(0.75, 0.35)), 0);
    }
    
    make_dust(xx, yy, (size * 0.025), size, rnd(90, 15), 0);
