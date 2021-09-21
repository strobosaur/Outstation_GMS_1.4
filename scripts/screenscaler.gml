///screenscaler(0-3);

    // SCALE STYLE
    
    // 0 = pixel perfect inside display
    // 1 = pixel perfect no letterboxing
    // 2 = keep ratio, touch from inside
    // 3 = keep ratio, touch from outside
    
    // INPUT?
    
    var style = 0;
    
    if (argument_count > 0) { style = argument0; }

    // VARIABLES
    
    var maxscale = 1;
    
    var xs = 1; // X-SCALE (UNUSED ATM)
    var ys = 1; // Y-SCALE (UNUSED ATM)
    
    var gw = global.game_width;
    var gh = global.game_height;
    
    var dw = max(1, display_get_width());
    var dh = max(1, display_get_height());
    
    // FAILSAFE
    
    if ((style < 0) || (style > 3)) 
    { 
        style = 0; 
    }
        
    // CALCULATE SCALING
    
    switch (style) {
    
        case 0:
        maxscale = max(1, (min(floor(dw / gw), floor(dh / gh))));
        break;
        
        case 1:
        maxscale = max(1, (min(ceil(dw / gw), ceil(dh / gh))));
        break;
        
        case 2:
        maxscale = max(1, (min((dw / gw), (dh / gh))));
        break;
        
        case 3:
        maxscale = max(1, (max((dw / gw), (dh / gh))));
        break;
        
        }
        
    // FIND OFFSET VALUES
    
    xoffs = ((dw - (gw * maxscale)) div 2);
    yoffs = ((dh - (gh * maxscale)) div 2);
        
    // OUTPUT
    
    return maxscale;
    


