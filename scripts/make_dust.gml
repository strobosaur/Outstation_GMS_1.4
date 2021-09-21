///make_dust(xx, yy, repeats, area, dir mod, airborne 0-1)

    var xx = argument0;
    var yy = argument1;
    var repeats = argument2 //0.75;
    var area = argument3;
    var dirmod = argument4;
    var airborne = argument5;
    
    // REPEATER  ===== ===== ===== ===== ===== =====
    repeat(repeats)
    {
        var pos = random_radius(xx, yy, area * 0.25);
        
        repeat(round(airborne * ceil(repeats / 3)))
        {
            pos = random_radius(xx, yy, area * 0.5);
            
            // FLYING DUST I ===== ===== ===== ===== ===== =====
            with instance_create(pos[0], pos[1], fxDirt)
            {
                vspd = -rnd(lerp(airborne * 1.75, 1.5, 0.5), airborne);
                zspd = rnd(1.25, 1);
                dir = rnd(dirmod, 30);
                sprite_index = sfxGray2px;
                decr = 0.9875 + rnd(0, 0.005);
            }
        }
        // PUFFS ===== ===== ===== ===== ===== =====
        repeat(ceil(repeats * 1))
        {
            pos = random_radius(xx, yy, area * 0.5);
            
            // DUST PUFF I
            with instance_create(pos[0], pos[1], fxPuff)
            {
                sprite_index = choose(sfxPuff02xl, sfxPuff03, sfxPuff04);
                image_index = 0;
            }
        }
        
        // DUST PUFF II ===== ===== ===== ===== ===== =====
        repeat(ceil(repeats * 0.5))
        {
            pos = random_radius(xx, yy+1, area * 0.4);
            
            with instance_create(pos[0], pos[1], fxPuff)
            {
                sprite_index = choose(sfxPuff05_dark);
                image_index = 0;
                ymod *= 0.66;
                image_index = 0;
                shadow_sprite = sfxPuff05_dark_shadow;
            }
        }
    }
