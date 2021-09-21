///make_blood_dust(xx, yy, repeats, area, dir mod, airborne 0-1, flashing t/f)

    var xx = argument0;
    var yy = argument1;
    var repeats = argument2 * 1
    var area = argument3;
    var dirmod = argument4;
    var airborne = argument5;
    
    // REPEAT NUMBER
    repeat(round(repeats))
    {
        // POSITION RADIUS
        var pos = random_radius(xx, yy, area * 0.25);
        
        repeat(round(airborne * repeats))
        {
            pos = random_radius(xx, yy, area * 0.5);
            
            // FLYING BLOOD DUST I
            with instance_create(pos[0], pos[1], fxDirt)
            {
                vspd = -rnd(lerp(airborne * 1.25, 1.5, 0.5), 0.25);
                zspd = rnd(0.5, 0.45);
                dir = rnd(dirmod, 30);
                sprite_index = sfxRedpx2;
                decr = 0.9875 + rnd(0, 0.005);
                is_flashing = argument6;
            }
        }
        // BLOOD PUFFS I
        repeat(ceil(repeats))
        {
            pos = random_radius(xx, yy, area * 0.5);
            
            with instance_create(pos[0], pos[1], fxPuff)
            {
                sprite_index = choose(sfxBlood_puff01b);
                image_index = 0;
                is_flashing = argument6;
            }
        }
        
        // BLOOD PUFF II
        repeat(ceil(repeats * 0.5))
        {
            pos = random_radius(xx, yy, area * 0.4);
            
            with instance_create(pos[0], pos[1], fxPuff)
            {
                sprite_index = choose(sfxBlood_puff01_dark);
                image_index = 0;
                ymod *= 0.66;
                image_index = 0;
                shadow_sprite = sfxPuff05_dark_shadow;
                is_flashing = argument6;
            }
        }
    }
