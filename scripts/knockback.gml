///knockback(obj, dir, amount)

    var knocked = argument0;
    var kdir = argument1;
    var amount = argument2;
    
    // KNOCKBACK!!
/*    var pwr = attacker.wpn[wp.pwr] * 0.0355;
    var str = 1 + attacker.stats[st.str] * 0.02;
    var force = lerp(pwr * basedmg * 0.125, str * basedmg * 0.125, 0.25);
    force = basedmg * 0.1;*/
    var t = knocked.timers[timer.shock01];
    var knock = (eq_wpn[? "knock"] * max(0.01, (0.575 - (t / 175))) * (1 - (knocked.d_matrix[dmx.stability] / 100))); 
//    if t > 0 { amount = max(0, amount - (t * 0.5)); }
    // + (0.005 * basedmg);//lerp(wpn[wp.knock] * (basedmg * 0.075), 0.5, 0.25) //mean((wpn[wp.pwr] * 0.00335) * (1 + stats[st.str] * 0.02), (amount * 0.05));
    
    
//    lerp(wpn[wp.knock] * kick * (basedmg * 0.15), 0.5, 0.8))
     //lerp(force, 0.25, 0.8))//lerp(lerp(force, 0.25, 0.6), 0.5, 0.75)); 
     //mean((attacker.wpn[wp.pwr] * 0.00335) * (1 + attacker.stats[st.str] * 0.02), (basedmg * 0.05)));
    
    knocked.hspd += lengthdir_x(1 * knock, kdir);
    knocked.vspd += lengthdir_y(1 * knock, kdir);
    knocked.timers[timer.shock01] += 3.85 * knock;
