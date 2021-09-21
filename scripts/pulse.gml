///pulse(time, frequency, depth, min val)

    // starts with min val, then pulses from that mid point 
    // the curve has a depth of the depth value in either direction

    return clamp(argument3 + (argument2 * (0.5 * (sin(2 * pi * argument1 * argument0)))), argument3 - (argument2 * 0.5), argument3 + (argument2 * 0.5));

