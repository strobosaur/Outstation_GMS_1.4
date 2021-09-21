///menu_weapon

    h_total = ds_list_size(global.team)-1;
    
    // THIS GUY RIGHT HERE
    current_member = ds_list_find_value(global.team, h_index);
//    current_stats = get_statsmap(current_member, statstype.stats_a, -1)
    var current_statsmap = global.statsbook[? current_member];
    current_equipment = current_statsmap[? "item map"]
    // WEAPON STATS
    current_weapon = current_equipment[? eqp.weapon]
    current_modifier_list = current_statsmap[?"modifier list"]
    
//    attack_matrix = current_statsmap[? "amx"]

    // ARMOR STATS
    current_armor = current_equipment[? eqp.torso];
    defense_matrix = current_statsmap[? "dmx"]
    current_bonus_list = current_weapon[?"bonus list"];
    
    var wpn_shots = current_weapon[? "shots"] + check_bonus_list_menu(current_modifier_list, "shots", current_member);//+ check_attack_matrix(current_weapon, attack_matrix, amx.shots);
    var wp_d_rolls = current_weapon[? "d_rolls"] + check_bonus_list_menu(current_modifier_list, "d_rolls", current_member);
    var wp_d_plus = current_weapon[? "d_plus"] + check_bonus_list_menu(current_modifier_list, "d_plus", current_member);
    var wp_th_plus = current_weapon[? "th_plus"] + check_bonus_list_menu(current_modifier_list, "th_plus", current_member);
    var wp_atkspd = current_weapon[? "atkspd"] + check_bonus_list_menu(current_modifier_list, "atkspd", current_member);
    var wp_atkspd2 = current_weapon[? "atkspd2"] + check_bonus_list_menu(current_modifier_list, "atkspd2", current_member);
    var wp_crit = current_weapon[? "crit"] + check_bonus_list_menu(current_modifier_list, "crit", current_member);
    var wp_multiplier = current_weapon[? "multiplier"] + check_bonus_list_menu(current_modifier_list, "multiplier", current_member);
    var wp_swarm = current_weapon[? "swarm"] +  check_bonus_list_menu(current_modifier_list, "swarm", current_member);
    var wp_knock = current_weapon[? "knock"] +  check_bonus_list_menu(current_modifier_list, "knock", current_member);
    var wp_range = current_weapon[? "range"] +  check_bonus_list_menu(current_modifier_list, "range", current_member);
    var wp_radius = current_weapon[? "radius"] +  check_bonus_list_menu(current_modifier_list, "radius", current_member);
    var wp_splash = current_weapon[? "splash"] +  check_bonus_list_menu(current_modifier_list, "splash", current_member);
    var wp_pen = current_weapon[? "penetration"] +  check_bonus_list_menu(current_modifier_list, "penetration", current_member);
    
    draw_wpn = array_create(1);  
    draw_txt = array_create(1);  
//    for (var i= 0; i < array_get
    
    // WEAPON TEXTS ===== =====
    var d = 0;
    
    draw_wpn[d] = " ";
    draw_txt[d] = current_weapon[? "name"];
    d++;
    
    draw_wpn[d] = string(wp_d_rolls + wp_d_plus) + "-" + string((wp_d_rolls * current_weapon[? "d_sides"]) + wp_d_plus);
    draw_txt[d] = "damage: ";
    d++;
    
    draw_wpn[d] = string(wp_th_plus)
    draw_txt[d] = "to hit: ";
    d++;
    
    draw_wpn[d] = string(wp_crit)
    draw_txt[d] = "crit chance: ";
    d++;
    
    draw_wpn[d] = string(wp_multiplier)
    draw_txt[d] = "crit multiplier: ";
    d++;
    
    // KNOCKBACK
    draw_wpn[d] = string(wp_knock)
    draw_txt[d] = "shock: ";
    d++;
    
    // SWARM
    if wp_swarm > 1
    {
        draw_wpn[d] = string(ceil(wp_swarm))
        draw_txt[d] = "swarm: ";
        d++;
    }
    else
    {
        draw_wpn[d] = ""
        draw_txt[d] = ""
        d++;
    }
    
    draw_wpn[d] = string(wp_atkspd / 60) + "s"
    draw_txt[d] = "attack speed: ";
    d++;
    
    // BURST
    if wpn_shots > 1
    {
        draw_wpn[d] = string(ceil(wpn_shots)) + ", " + string(wp_atkspd2/60) + "s"//string(round(1/(wp_atkspd2/60))) + "/s"
        draw_txt[d] = "burst shots: ";
        d++;
    }
    else
    {
        draw_wpn[d] = ""
        draw_txt[d] = ""
        d++;
    }
    
    // MELEE / RANGE ===== =====
    if current_weapon[? "melee"] == true
    {
        draw_wpn[d] = "(melee)" + string(ceil(wp_range));
        draw_txt[d] = "range: ";
        d++;
    }
    else
    {
        draw_wpn[d] = string(ceil(wp_range));
        draw_txt[d] = "range: ";
        d++;
    }
    
    // PENETRATION
    if wp_pen > 1
    {
        draw_wpn[d] = string(ceil(wp_pen));
        draw_txt[d] = "pierce: ";
        d++;
    }
    else
    {
        draw_wpn[d] = "";
        draw_txt[d] = "";
        d++;
    }
        
    // ORDNANCE ===== =====
    if wp_splash > 0
    {
        draw_wpn[d] = string(ceil(wp_radius));
        draw_txt[d] = "radius: ";
        d++;
        
        draw_wpn[d] = string(wp_splash);
        draw_txt[d] = "splash:";
        d++;
    }
    else
    {
        draw_wpn[d] = string(ceil(wp_radius));
        draw_txt[d] = "radius:";
        d++;
        
        draw_wpn[d] = "";
        draw_txt[d] = "";
        d++;
    }
    
    // RESET LINE BREAK
    d = 0;
    
    draw_armor = array_create(1);
    draw_atxt = array_create(1);
    
    // ARMOR TEXTS ===== =====
    if current_armor != -1
    {
        draw_armor[d] = " ";
        draw_atxt[d] = current_armor[? "name"];
        d++;
        
        draw_armor[d] = string(current_armor[? "ac"]);
        draw_atxt[d] = "armor class: ";
        d++;
        
        draw_armor[d] = string(current_armor[? "ml_pts"])
        draw_atxt[d] = "melee: ";
        d++;
        
        draw_armor[d] = string(current_armor[? "rng_pts"])
        draw_atxt[d] = "ranged: ";
        d++;
        
        draw_armor[d] = string(current_armor[? "ml_tohit"])
        draw_atxt[d] = "melee to hit: ";
        d++;
        
        draw_armor[d] = string(current_armor[? "knockback"])
        draw_atxt[d] = "shock absorption: ";
        d++;
        
        draw_armor[d] = string(current_armor[? "mspd"])
        draw_atxt[d] = "mobility: ";
        d++;
        
        draw_armor[d] = string(current_armor[? "hpmax"])
        draw_atxt[d] = "health bonus: ";
        d++;
    }
    else
    {
        draw_armor[0] = "no armor";
        draw_atxt[0] = " ";
    }
    
    // CHANGE STATE
    menu_draw_state = menu_draw_wpn;
    
    menu_gpb.visible = false;
    menu_gpy.visible = false;
    menu_gpa.visible = false;
    menu_gpx.visible = false;
    
    if h_total != 0
    {
        menu_gpl1.visible = false;
        menu_gpr1.visible = false;
    }

    get_input()
    
    // RIGHT LEFT
    if GPL1_p || GPL_p
    { 
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
        h_index--;
    }    
    if GPR1_p || GPR_p
    { 
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
        h_index = (h_index + 1) mod (h_total + 1); 
    }
    // BELOW ZERO?
    if h_index < 0 { h_index = h_total; }
    // UP DOWN
    if GPU_p 
    {
        v_index--
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
    }
    if GPD_p 
    {
        v_index = (v_index + 1) mod (v_total + 1);
        // PLAY SOUND
        audio_play_sound(sndBwop01, 10, false);
    }
    if v_index > v_total { v_index = 0; }
    if v_index < 0 {v_index = v_total; }
    
    // WEAPON STATS ARRAYS ==========================================
    
    // STATS + WEAPON STATS
    wpstats[wp.dmg] = string(current_weapon[? "d_rolls"] + current_weapon[? "d_plus"]) + "-" + string(current_weapon[? "d_rolls"] * current_weapon[? "d_sides"] + current_weapon[? "d_plus"]) //get_damage(current_weapon, attack_matrix);
    wpstats[wp.rng] = current_weapon[? "range"] //get_range(current_weapon, attack_matrix);
    wpstats[wp.spd] = current_weapon[? "atkspd"] // round(get_atkspd(current_weapon, attack_matrix));
    wpstats[wp.spr] = current_weapon[? "spread"] //round(get_spread(current_weapon, attack_matrix));
    wpstats[wp.crt] = current_weapon[? "crit"] //get_critical(current_weapon, attack_matrix);
    
    // CHANGE MEMBER
    if GPB_p
    {
        // SOUND
        audio_play_sound(sndChoice01, 15, false);
        // CHANGE MEMBER
        global.team_active = h_index;
        global.turret_switch = false;
        // UNPAUSE ROOM
        room_goto(global.unpause_room);
    }
    
    ///UNPAUSE
    if GPX_p || GPA_p
    {
        // SOUND
        audio_play_sound(sndMenu01, 15, false);
        // UNPAUSE ROOM
        room_goto(global.unpause_room);
    }
