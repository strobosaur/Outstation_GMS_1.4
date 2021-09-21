///init_class("class name")

    var atr = unit_data.classes[? argument0];
    
    ds_map_replace(statsmap, "base th_rolls", atr[?"base th_rolls"]);
    ds_map_replace(statsmap, "base ac", atr[?"base ac"]);
    ds_map_replace(statsmap, "base th_plus", atr[?"base th_plus"]);
    ds_map_replace(statsmap, "sight", atr[?"sight"]);
    ds_map_replace(statsmap, "move speed", atr[?"move speed"]);
    
    statsbook[?"hpmax"] = round(statsbook[?"health"] * random_range(5,6));
    statsbook[?"hp"] = statsbook[?"hpmax"]
    statsbook[?"regen"] = 0.25;
