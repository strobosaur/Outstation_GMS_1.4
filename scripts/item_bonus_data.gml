///item_bonus_data()

    var item_bonus_pool = ds_map_create();
    
    // CRIT CHANCE UP ===== ===== ===== ===== ===== =====
    var implant_map = ds_map_create();
    
    ds_map_add(implant_map, "name", "Crit chance up");
    
    // DRAW TEXT
    var draw_txt = "Crt. % +1"
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    am_increase[wpntype.allw, amx.crt_chance] = 1;
    
    // ADD TO FINAL MAP
    ds_map_add(implant_map, "draw txt", draw_txt);
    ds_map_add(implant_map, "am increase", am_increase);
    
    ds_map_add(item_bonus_pool, "Crit chance up", implant_map);

    var item_bonus_pool = ds_map_create();
    
    // CRIT MULTIPLIER UP ===== ===== ===== ===== ===== =====
    var implant_map = ds_map_create();
    
    ds_map_add(implant_map, "name", "Crit multiplier up");
    
    // DRAW TEXT
    var draw_txt = "Crt. x +1"
    
    // ATTACK MATRIX BONUS
    var crt_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < crts.stop; j++) { crt_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    crt_increase[wpntype.allw, crts.multiplier] = 1;
    
    // ADD TO FINAL MAP
    ds_map_add(implant_map, "draw txt", draw_txt);
    ds_map_add(implant_map, "crt increase", crt_increase);
    
    ds_map_add(item_bonus_pool, "Crit multiplier up", implant_map);
    
    // EXPLOSIVE CRITS ===== ===== ===== ===== ===== =====
    var implant_map = ds_map_create();
    
    ds_map_add(implant_map, "name", "Explosive crits");
    
    // DRAW TEXT
    var draw_txt = "Explosive crits +1"
    
    // ATTACK MATRIX BONUS
    var crt_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < crts.stop; j++) { crt_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    crt_increase[wpntype.allw, crts.explosive] = 1;
    
    // ADD TO FINAL MAP
    ds_map_add(implant_map, "draw txt", draw_txt);
    ds_map_add(implant_map, "crt increase", crt_increase);
    
    ds_map_add(item_bonus_pool, "Explosive crits", implant_map);
    
    // EXPLOSIVE CRITS ===== ===== ===== ===== ===== =====
    var implant_map = ds_map_create();
    
    ds_map_add(implant_map, "name", "Explosive crits");
    
    // DRAW TEXT
    var draw_txt = "Kaboom +1"
    
    // ATTACK MATRIX BONUS
    var crt_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < crts.stop; j++) { crt_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    crt_increase[wpntype.allw, crts.explosive] = 1;
    
    // ADD TO FINAL MAP
    ds_map_add(implant_map, "draw txt", draw_txt);
    ds_map_add(implant_map, "crt increase", crt_increase);
    
    ds_map_add(item_bonus_pool, "Explosive crits", implant_map);
    
/*    // DEFENSE lv I ===== ===== ===== ===== ===== =====
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
    var draw_txt = "to hit +2 #dmg +2"
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    am_increase[wpntype.allw, amx.th_plus] = 2;
    am_increase[wpntype.allw, amx.d_plus] = 2;
    
    // ADD TO FINAL MAP
    ds_map_add(combat, "draw txt", draw_txt);
    ds_map_add(combat, "am increase", am_increase);
    
    ds_map_add(bonus_pool, "combat +1", combat);
    
    // AGILITY lv I ===== ===== ===== ===== ===== =====
    var agility = ds_map_create();
    
    ds_map_add(agility, "name", "agility +1");
    
    // DRAW TEXT
    var draw_txt = "move spd. +0.25 #attack spd. -25%"
    
    // B STAT BONUS
    var b_increase = array_create(b_stats.stop);
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    b_increase[b_stats.mspd] = 0.25;
    am_increase[wpntype.allw, amx.atk_spd] -= 0.25;
    
    // ADD TO FINAL MAP
    ds_map_add(agility, "draw txt", draw_txt);
    ds_map_add(agility, "am increase", am_increase);
    ds_map_add(agility, "b increase", b_increase);
    
    ds_map_add(bonus_pool, "agility +1", agility);
    
    // CRITICALS lv I ===== ===== ===== ===== ===== =====
    var criticals = ds_map_create();
    
    ds_map_add(criticals, "name", "criticals +1");
    
    // DRAW TEXT
    var draw_txt = "crit chance +2 #crit multiplier +1"
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    // CRIT MATRIX BONUS
    var crt_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < crts.stop; j++) { crt_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    am_increase[wpntype.allw, amx.crt_chance] = 2;
    crt_increase[wpntype.allw, crts.multiplier] = 1;
    
    // ADD TO FINAL MAP
    ds_map_add(criticals, "draw txt", draw_txt);
    ds_map_add(criticals, "am increase", am_increase);
    ds_map_add(criticals, "crt increase", crt_increase);
    
    ds_map_add(bonus_pool, "criticals +1", criticals);
    
    // CRITICALS lv II ===== ===== ===== ===== ===== =====
    var criticals = ds_map_create();
    
    ds_map_add(criticals, "name", "criticals +2");
    
    // DRAW TEXT
    var draw_txt = "crit chance +2 #crit multiplier +1"
    
    // ATTACK MATRIX BONUS
    var am_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < amx.stop; j++) { am_increase[i, j] = 0; }}
    // CRIT MATRIX BONUS
    var crt_increase = array_create(0);
    for (var i = 0; i < wpntype.stop; i++) { for (var j = 0; j < crts.stop; j++) { crt_increase[i, j] = 0; }}
    
    // THE ACTUAL STATS
    am_increase[wpntype.allw, amx.crt_chance] = 2;
    crt_increase[wpntype.allw, crts.multiplier] = 1;
    
    // ADD TO FINAL MAP
    ds_map_add(criticals, "draw txt", draw_txt);
    ds_map_add(criticals, "am increase", am_increase);
    ds_map_add(criticals, "crt increase", crt_increase);
    
    ds_map_add(bonus_pool, "criticals +2", criticals);
    
    // MELEE WPNS lv I ===== ===== ===== ===== ===== =====
    var melee = ds_map_create();
    
    ds_map_add(melee, "name", "melee +1");
    
    // DRAW TEXT
    var draw_txt = "melee dmg. +2 #melee ac +2"
    
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
