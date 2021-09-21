///make_array(elements...)

    var new_array;
    
    // Loop through the arguments
    for (var i=0; i<argument_count; i++) {
        new_array[i] = argument[i];
    }
    
    // Return the new array
    return new_array;
