///spill_blood(x, y, amount, dir)

    var xx = argument0;
    var yy = argument1;
    var amount = argument2;    
    var dir = argument3;
    
    // SPILL BLOOD
    repeat(ceil(amount / 15))
    {
        // RANDOM RADIUS
        var pos = random_radius(xx, yy, mean(8, 8, amount * 0.75));
        
        // SIZE
        if random(1) < 0.25
        {
            with instance_create(pos[0], pos[1], fxBlood)
            {
                dir = other.dir + rnd(0, 20);
                size = 1 * (amount * 0.2);
            }
        }
        else
        {
            with instance_create(pos[0], pos[1], fxBlood)
            {
                dir = other.dir + rnd(0, 20);
                size = 0.6 * (amount * 0.25);
            }
        }
    }
