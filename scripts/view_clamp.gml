///view_clamp(view nr);
    
    var view = argument0;
    
    // CLAMP VIEW
    
    if (view_xview[view] < 0) {view_xview[view] = 0;}
    if (view_xview[view] > (room_width - view_wview[view])) {view_xview[view] = (room_width - view_wview[view]);}
    
    if (view_yview[view] < 0) {view_yview[view] = 0;}    
    if (view_yview[view] > (room_height - view_hview[view])) {view_yview[view] = (room_height - view_hview[view]);}
