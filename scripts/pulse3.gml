///pulse3(time, frequency, depth 0-1)

// returns value in range 0-1, plus the min val
// produces -1 to 1, but with the "1+sin" its 0-2, and with the "0.5 *" its 0-1
// min val sets a base value, and depth decides how intense the swing is

    return (argument2 * ((0.5 * (sin(2 * pi * argument1 * argument0)))));
