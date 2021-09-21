///gauss(curve peak value, value of one std. deviation)

    // LOCAL
    
    var x1 = 0;
    var x2 = 0;
    var w = 0;
    
    // LOOP DIMENSION FUCKHEAD BONEMEAL SQUARED    
    do 
    {    
        x1 = (1 - random(2));
        x2 = (1 - random(2));
        w = x1*x1 + x2*x2;
    }
    until (0 < w && w < 1);
    
    w = sqrt(-2 * ln(w)/w);
    
    // RETURNED BE THINE CURVE OF BINARY BLOOD & SEMEN    
    return (argument0 + argument1 * x1 * w);
    
    
    
