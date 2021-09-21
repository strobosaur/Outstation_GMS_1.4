///level_up_data()

    var bonus_pool = ds_map_create();
    
    // LEVEL lv I ===== ===== ===== ===== ===== =====
    var bonus_map = ds_map_create();
    
    ds_map_add(bonus_map, "name", "level +1");
    
    // DRAW TEXT
    var draw_txt = "hp +15 #to hit +2"
    
    // B STAT BONUS
    var b_increase = array_create(b_stats.stop);
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    b_increase[b_stats.hpmax] = 15;
    am_increase[wpntype.allw, amx.th_plus] = 2;
    
    // ADD TO FINAL MAP
    ds_map_add(bonus_map, "draw txt", draw_txt);
    ds_map_add(bonus_map, "b increase", b_increase);
    ds_map_add(bonus_map, "am increase", am_increase);
    
    ds_map_add(bonus_pool, "level +1", bonus_map);
    
    // DEFENSE lv I ===== ===== ===== ===== ===== =====
    var defense = ds_map_create();
    
    ds_map_add(defense, "name", "defense +1");
    
    // DRAW TEXT
    var draw_txt = "hp +20 #ac +2"
    
    // B STAT BONUS
    var b_increase = array_create(b_stats.stop);
    
    // ATTACK MATRIX BONUS
    var dm_increase = array_create(dmx.stop);
    
    // THE ACTUAL STATS
    b_increase[b_stats.hpmax] = 20;
    dm_increase[dmx.ac] = 2;
    
    // ADD TO FINAL MAP
    ds_map_add(defense, "draw txt", draw_txt);
    ds_map_add(defense, "b increase", b_increase);
    ds_map_add(defense, "dm increase", dm_increase);
    
    ds_map_add(bonus_pool, "defense +1", defense);
    
    // COMBAT lv I ===== ===== ===== ===== ===== =====
    var combat = ds_map_create();
    
    ds_map_add(combat, "name", "combat +1");
    
    // DRAW TEXT
    var draw_txt = "to hit +1 #dmg +1"
    
    // ATTACK MATRIX BONUS
    var a_increase = array_create(a_stats.stop);
//    var am_increase = array_create(0);
//    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    a_increase[wpntype.allw, amx.th_plus] = 1;
//    am_increase[wpntype.allw, amx.d_plus] = 2;
    
    var w_increase = make_bonus_array(statstype.stats_w, "d_plus", "combat I : damage +", operation.add, 1, 0, wpntype.allw);
    
    // ADD TO FINAL MAP
    ds_map_add(combat, "draw txt", draw_txt);
//    ds_map_add(combat, "am increase", am_increase);
    ds_map_add(combat, "a increase", a_increase);
    ds_map_add(combat, "w increase", w_increase);
    
    ds_map_add(bonus_pool, "combat +1", combat);
    
    // AGILITY lv I ===== ===== ===== ===== ===== =====
    var agility = ds_map_create();
    
    ds_map_add(agility, "name", "agility +1");
    
    // DRAW TEXT
    var draw_txt = "move spd. +0.25 #attack spd. -25%"
    var array_list = ds_list_create();
    
    // B STAT BONUS
    var b_increase = array_create(b_stats.stop);
    
    // ATTACK MATRIX BONUS
//    var am_increase = array_create(0);
//    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    b_increase[b_stats.mspd] = 0.25;
//    am_increase[wpntype.allw, amx.atk_spd] -= 0.25;
    var w_increase = make_bonus_array(statstype.stats_w, "atkspd", "agility I : attak speed +", operation.divide, 0.25, 0, wpntype.allw);
    ds_list_add(array_list, w_increase)
    
    // ADD TO FINAL MAP
    ds_map_add(agility, "draw txt", draw_txt);
//    ds_map_add(agility, "am increase", am_increase);
    ds_map_add(agility, "b increase", b_increase);
    ds_map_add(agility, "w increase", array_list);
    
    ds_map_add(bonus_pool, "agility +1", agility);
    
    // CRITICALS lv I ===== ===== ===== ===== ===== =====
    var criticals = ds_map_create();
    
    ds_map_add(criticals, "name", "criticals +1");
    
    // DRAW TEXT
    var draw_txt = "crit chance +1 #crit multiplier +1"
    var array_list = ds_list_create();
    // ATTACK MATRIX BONUS
//    var am_increase = array_create(0);
//    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
//    am_increase[wpntype.allw, amx.crt_chance] = 2;
//    am_increase[wpntype.allw, amx.crt_multiplier] = 1;
    var w_increase = make_bonus_array(statstype.stats_w, "crit", "criticals I : crit % +", operation.add, 1, 0, wpntype.allw);
    ds_list_add(array_list, w_increase);
    w_increase = make_bonus_array(statstype.stats_w, "multiplier", "criticals I : crit x +", operation.add, 1, 0, wpntype.allw);
    ds_list_add(array_list, w_increase);

    // ADD TO FINAL MAP
    ds_map_add(criticals, "draw txt", draw_txt);
//    ds_map_add(criticals, "am increase", am_increase);
    ds_map_add(criticals, "w increase", array_list);
    
    ds_map_add(bonus_pool, "criticals +1", criticals);
    
    // CRITICALS lv II ===== ===== ===== ===== ===== =====
    var criticals = ds_map_create();
    
    ds_map_add(criticals, "name", "criticals +2");
    
    // DRAW TEXT
    var draw_txt = "crit chance +1 #crit multiplier +1"
    var array_list = ds_list_create();
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    am_increase[wpntype.allw, amx.crt_chance] = 2;
    am_increase[wpntype.allw, amx.crt_multiplier] = 2;
    
    // ADD TO FINAL MAP
    ds_map_add(criticals, "draw txt", draw_txt);
    ds_map_add(criticals, "am increase", am_increase);
    
    ds_map_add(bonus_pool, "criticals +2", criticals);
    
    // MELEE WPNS lv I ===== ===== ===== ===== ===== =====
    var melee = ds_map_create();
    
    ds_map_add(melee, "name", "melee +1");
    
    // DRAW TEXT
    var draw_txt = "melee dmg. +2 #melee ac +2"
    var array_list = ds_list_create();
    
    // DEFENSE MATRIX BONUS
    var dm_increase = array_create(dmx.stop);
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    am_increase[wpntype.mlw, amx.d_plus] = 2;
    dm_increase[dmx.ml_tohit] = 2;
    
    // ADD TO FINAL MAP
    ds_map_add(melee, "draw txt", draw_txt);
    ds_map_add(melee, "am increase", am_increase);
    ds_map_add(melee, "dm increase", dm_increase);
    
    ds_map_add(bonus_pool, "melee +1", melee);
    
    // CRITICALS lv I ===== ===== ===== ===== ===== =====
    var accuracy = ds_map_create();
    
    ds_map_add(accuracy, "name", "accuracy +1");
    
    // DRAW TEXT
    var draw_txt = "to hit +2 #crit rolls +2"
    var array_list = ds_list_create();
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    am_increase[wpntype.allw, amx.crt_rolls] += 2;
    am_increase[wpntype.allw, amx.th_plus] = 2;
    
    // ADD TO FINAL MAP
    ds_map_add(accuracy, "draw txt", draw_txt);
    ds_map_add(accuracy, "am increase", am_increase);
    
    ds_map_add(bonus_pool, "accuracy +1", accuracy);
    
    // RETURN BONUS BOOK CONTENTS ===== ===== ===== ===== =====
    return bonus_pool;
