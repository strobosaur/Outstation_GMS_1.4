///pulse_mid(frequency, depth, mid val)

    // starts with min val, then pulses from that mid point 
    // the curve has a depth of the depth value in either direction

    return clamp(argument2 + (argument1 * (sin(2 * pi * argument0 * global.time))), argument2 - argument1, argument2 + argument1);

