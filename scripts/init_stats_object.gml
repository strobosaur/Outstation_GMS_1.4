///init_stats_object("class name");

    var atr = unit_data.classes[? argument0];

    // STAT ARRAYS
    
    for (var i = 0; i < dmx.stop; i++) { d_matrix[i] = 0; }
    
    stats_a = ds_map_create();
    
    ds_map_copy(stats_a, atr);
    
    stats_a[?"shots fired"] = 0;
    stats_a[?"charges"] = 0;
    stats_a[?"kills"] = 0;
    stats_a[?"shots fired"] = 0;
    
    stats_a[?"hpmax"] = round(stats_a[?"health"] * random_range(7,9));
    stats_a[?"hp"] = stats_a[?"hpmax"]
    stats_a[?"regen"] = 0.15;
    stats_a[?"regen timer"] = room_speed * 8;
    stats_a[?"armor points"] = 0;
    stats_a[?"armor regen"] = 0.75;
    
    stats_a[?"xp total"] = 0;
    stats_a[?"xp progress"] = 0;
    stats_a[?"xp next"] = 50;
    stats_a[?"level"] = 1;
    
    // SET TO UNARMED
    new_weapon(-1);
    
    
