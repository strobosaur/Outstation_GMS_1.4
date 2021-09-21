///init_unit(caller id);

    var caller = argument0;
    
    // TIMER INIT
    for (var i = 0; i < timer.stop; i++)
    {
        timers[i] = 0;
    }
    
        // VARIABLES
        path = path_add();
        path_time = room_speed * 1.5;
        
        state = new_state;
        last_state = state;
        
        dir = irandom(360);
        todir = dir;
        turnspd = 2.5;
        
/*        coord_map = ds_map_create();
        
        ds_map_add(coord_map, "shoot dir", 0);
        ds_map_add(coord_map, "move dir", 0);
        ds_map_add(coord_map, "to dir", 0);
        ds_map_add(coord_map, "deployed dir", 0);
        
        ds_map_add(coord_map, "target x", 0);
        ds_map_add(coord_map, "target y", 0);
        ds_map_add(coord_map, "move to x", 0);
        ds_map_add(coord_map, "move to y", 0);
        ds_map_add(coord_map, "stationed x", 0);
        ds_map_add(coord_map, "stationed y", 0);*/
        
        sdir = dir;
        mdir = dir;
        d_dir = dir;
        face = face4(dir);
        
        light_radius = 0;
        light_intensity = 0;
        
        has_movetgt = false;
        
        len = 0;
        supmod = 1;
        shockmod = 1;
        
        spd = 0;
        
        hspd = 0;
        vspd = 0;
        
        collidable = true;
        
        enemy = 0;
        playable = false;
        
        critical_hit = false;
        target = noone;
        tgtx = 0;
        tgty = 0;
        moveto_x = x;
        moveto_y = y;
        fire_x = 0;
        fire_y = 0;
        stationed_x = 0;
        stationed_y = 0;
        
        // MOUNTED
        mounted = false;
        deployed = false;
        
        act = IDLE;
        
        depth = -y;
        image_speed = 0;
        
        // SPRITE ARRAY        
        sprite[RIGHT, IDLE] = 0;
        sprite[UP, IDLE] = 0;
        sprite[LEFT, IDLE] = 0;
        sprite[DOWN, IDLE] = 0;
        
        sprite[RIGHT, MOVE] = 0;
        sprite[UP, MOVE] = 0;
        sprite[LEFT, MOVE] = 0;
        sprite[DOWN, MOVE] = 0;
        
        sprite[RIGHT, FIGHT] = 0;
        sprite[UP, FIGHT] = 0;
        sprite[LEFT, FIGHT] = 0;
        sprite[DOWN, FIGHT] = 0;
        
        wpnspr = 0;
        stats_map = 0;
        
        // SPECIFIC SHADOW SPRITE        
        shadow_sprite = sShadow_8;
        shadow_y = 0;
    
        // ITEM MAP
        item_map = ds_map_create();
        
        ds_map_add(item_map, itemtype.armor, -1);
        ds_map_add(item_map, itemtype.headgear, -1);
        ds_map_add(item_map, itemtype.implant1, -1);
        ds_map_add(item_map, itemtype.implant2, -1);
        ds_map_add(item_map, itemtype.weapon, -1);
        
        item_map[? itemtype.armor] = unit_data.no_armor;
//        item_map[? itemtype.weapon] = unit_data.unarmed;
        
        // STATS MAPS
        eq_wpn = 0//item_map[? itemtype.weapon];
        eq_armor = item_map[? itemtype.armor];
        base_armor = item_map[? itemtype.armor];
        
        has_hit = ds_list_create();
        attack_modifier_list = ds_list_create();
        
        // CHOSEN TIMER
        chosen_mix = false;
        
        // FLEEING
        flee_counter = 0;
        flee_count = 0;
        
        // WEAPON STATS        
        o_weapon = noone;
        
