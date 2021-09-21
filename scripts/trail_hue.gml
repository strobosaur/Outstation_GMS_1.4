///trail_hue(alpha, lifetime, base hue, size)

        // TRAIL
        with instance_create(x, y, oTrail)
        {
            sprite_index = other.sprite_index;
            image_index = other.image_index;
            image_speed = 0;
            image_alpha = rnd(argument0, argument0 * 0.15);
            rate = rnd(4.5, 2.25);
            decr = fade_out(argument1)
            ymod = 0
            hue = rnd(argument2, 30);
            hued = rnd(15, 7.5);
            
            sat = rnd(35, 20);
            satd = rnd(10, 5);
            
            val = 255;
            depth = -y;
        }
