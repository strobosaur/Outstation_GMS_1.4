///melee_charge(range, speed)

//    var range = argument0;
//    var fast = argument1;
    
/*    var inst = instance_nearest(x, y, enemy);
    // SET
    if inst != noone && timers[timer.wp01] <= 0 && timers[timer.charge] <= 0
    {
        var dist = point_distance(x, y, inst.x, inst.y);
        if dist < (lerp(eq_wpn[? "range"] * 2.25, eq_wpn[? "range"] + 48, 0.66))
        {
            target = inst;
            var dir = point_direction(x, y, inst.x, inst.y)
            var slowdown = lerp(1, 1 / (b_stats[b_stats.shots_fired] + 1), 0.75);
            var kick = approach(1.5, 3, slowdown * lerp(1.5, (dist * 0.1), 0.5));
            var time = dist / (0.5 * (kick * slowdown));
        
            if timers[timer.charge] <= 0
            {
                // CHARGE
                hspd = lengthdir_x(kick, dir)
                vspd = lengthdir_y(kick, dir)

                if b_stats[b_stats.shots_fired] != eq_wpn[? "range"]-1
                {
                    timers[timer.charge] = round(min(eq_wpn[? "atkspd2"], time))
                    if instance_exists(o_weapon) { o_weapon.timers[timer.charge] = round(min(eq_wpn[? "atkspd2"], time)); }
                }
                else
                {
                    timers[timer.charge] = round(time);
                    if instance_exists(o_weapon) {o_weapon.timers[timer.charge] = round(time);}
                }
            }
        }
    }
