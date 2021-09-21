///make_critical_fx(x0, y0, damage, defender)

    var x0 = argument0;
    var y0 = argument1;
    var damage_amount = argument2;
    var defender = argument3;

    var blood_dir = point_direction(x0, y0, defender.x, defender.y);
    
    var xx = defender.x + lengthdir_x(3, blood_dir+180);
    var yy = defender.y-4 + lengthdir_y(3, blood_dir+180);
    
    // MAKE BLOOD DUST
    var blood_amount = min(damage_amount, defender.stats_a[?"hpmax"] * 2);
    repeat(1)
    {
        make_blood_dust(xx, yy, 3 + round(damage_amount / 20), 14 + round(damage_amount / 10), rnd(blood_dir, 20), 1, true);
        spill_blood(xx, yy, damage_amount, blood_dir);
    }
