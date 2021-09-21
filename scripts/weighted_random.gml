///weighted_random(w1, w2, w3, w4, w5...)

    // array[x, 0] = weight
    // array[x, 1] = content
    var arg = argument_count;
//    var r = argument0;
    var sum = 0;
    var count = 0;
    var ret = 0;
    
    // ADD ARGUMENTS TO ARRAY
    if arg > 1
    {
        for (var h = 0; h < arg; h++)
        {
            r[h] = argument[h];
        }
    }
    // GET TOTAL SUM OF WEIGHTS
    for (var i = 0; i <= array_length_1d(r)-1; i++)
    {
        sum += r[i];
    }
    
    // RANDOM IN SPAN OF WEIGHTS
    var chosen = random(sum);
    
    // SUBTRACT WEIGHTS ONE BY ONE
    for (var j = 0; j <= array_length_1d(r)-1; j++)
    {
        chosen -= r[j];
        
        // RETURN IF ZERO
        if chosen < 0
        {
            var r = 0;
            return j;
        }
    }
    
//    return ret;

