///init_item_bonus_pool(pool list)

    var pool_list = argument0;

    // TO HIT PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "th_plus";
    item_bonus[itembonus.name] = "to hit +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 1;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // TO HIT ROLLS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "th_rolls";
    item_bonus[itembonus.name] = "to hit +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 1;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // DAMAGE PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "d_plus";
    item_bonus[itembonus.name] = "damage +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 2;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // DAMAGE ROLLS PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "d_rolls";
    item_bonus[itembonus.name] = "damage +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 4;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // DAMAGE SIDES PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "d_sides";
    item_bonus[itembonus.name] = "damage +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 3;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // ACCURACY PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "spread";
    item_bonus[itembonus.name] = "accuracy +";
    item_bonus[itembonus.operation] = operation.divide;
    item_bonus[itembonus.amount] = 0.1;
    item_bonus[itembonus.value] = 2;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // SPLASH DAMAGE
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "splash";
    item_bonus[itembonus.name] = "splash +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 0.1;
    item_bonus[itembonus.value] = 7;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // RADIUS PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "radius";
    item_bonus[itembonus.name] = "radius +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.2;
    item_bonus[itembonus.value] = 4;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // ATTACK SPEED PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd";
    item_bonus[itembonus.name] = "speed +";
    item_bonus[itembonus.operation] = operation.divide;
    item_bonus[itembonus.amount] = 0.1;
    item_bonus[itembonus.value] = 4;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // BURST SPEED PLUS
/*    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "atkspd2";
    item_bonus[itembonus.name] = "burst speed +";
    item_bonus[itembonus.operation] = operation.divide;
    item_bonus[itembonus.amount] = 0.15;
    item_bonus[itembonus.value] = 3;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);*/

    // RANGE PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "range";
    item_bonus[itembonus.name] = "range +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.1;
    item_bonus[itembonus.value] = 3;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // CRITS PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "crit";
    item_bonus[itembonus.name] = "crit +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 0.5;
    item_bonus[itembonus.value] = 3;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // SWARM PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "swarm";
    item_bonus[itembonus.name] = "swarm +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.1;
    item_bonus[itembonus.value] = 5;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // SHOTS PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "shots";
    item_bonus[itembonus.name] = "burst shots +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.1;
    item_bonus[itembonus.value] = 5;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // PENETRATION PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "penetration";
    item_bonus[itembonus.name] = "penetration +";
    item_bonus[itembonus.operation] = operation.add;
    item_bonus[itembonus.amount] = 1;
    item_bonus[itembonus.value] = 4;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);

    // KNOCKBACK PLUS
    var item_bonus = array_create(0);
    
    item_bonus[itembonus.statstype] = statstype.stats_w;
    item_bonus[itembonus.type] = "knock";
    item_bonus[itembonus.name] = "knockback +";
    item_bonus[itembonus.operation] = operation.multiply;
    item_bonus[itembonus.amount] = 0.1;
    item_bonus[itembonus.value] = 3;
    item_bonus[itembonus.wpntype] = wpntype.allw;
    
    ds_list_add(pool_list, item_bonus);
    
    
    
    
