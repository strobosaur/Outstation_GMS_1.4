///value_saw_wave(from, to, min, max, rate)

    if argument0 < argument1
    {
        var ret = min((argument0 + argument4), argument1);
        if ret == argument2
        {
            return argument3;
        }
        else
        {
            return ret;
        }
    }
    else
    {
        var ret = max((argument0 - argument4), argument1);
        if ret == argument3
        {
            return argument2;
        }
    }

/*    if (argument0 <= argument1) && (argument1 == argument2) { return argument3; }
    if (argument0 => argument1) && (argument1 == argument3) { return argument2; }

    if (argument0 < argument1) 
    {
        return min((argument0 + argument4), argument1);
    } 
    else 
    {
        return max((argument0 - argument4), argument1);
    }

    
