///shoot_grenade(object, speed, decr, explosive, aim)

    var shoot_spd = argument1;
    var spd_decr = argument2;
    var aim = argument3;
//    var explosive = argument3;
    
    // FIRE X & Y
    var mzdir = random(360);
    var mzdist = random(2.5);
    
    fire_x = (x + lengthdir_x(8.5, dir)) + lengthdir_x(mzdist, mzdir);
    fire_y = ((y-1.75) + lengthdir_y(5, dir)) + lengthdir_y(mzdist, mzdir);

    // WEAPON STATS & ATTACK PARAMETERS    
    var wp_acc = get_spread(eq_wpn, attack_modifier_list, id);
    var wp_range = ceil(min(get_range(eq_wpn, attack_modifier_list, id), point_distance(fire_x, fire_y, tgtx, tgty)))
    var wp_swarm = ceil(eq_wpn[? "swarm"] + check_bonus_list(attack_modifier_list, "swarm", id))
    var wp_multiplier = stats_a[?"base multiplier"] + eq_wpn[?"multiplier"] + check_bonus_list(attack_modifier_list, "multiplier", id)
    // SPLASH DAMAGE
    var wp_splash = eq_wpn[? "splash"] + check_bonus_list(attack_modifier_list, "splash", id)
    var wp_radius = eq_wpn[? "radius"] + check_bonus_list(attack_modifier_list, "radius", id)
    // KNOCKBACK AND SUPPRESSION
    var wp_knock = (eq_wpn[? "knock"] + check_bonus_list(attack_modifier_list, "knock", id)) * (1 + (0.5 * critical_hit));
    var wp_suppr = eq_wpn[? "suppr"] + check_bonus_list(attack_modifier_list, "suppr", id)
    var wp_shock = eq_wpn[? "shock"] + check_bonus_list(attack_modifier_list, "shock", id)
    
    // SHOOT BULLET    
//    repeat(wp_swarm)
    {
        // SHOOT
        with instance_create(fire_x, fire_y, argument0)
        {
            dir = other.dir + rnd(0, wp_acc);
            
            explosive = argument3;
            
            stats_a = other.stats_a;
            
            decr = spd_decr;
            zspd = wp_range * rnd(0.02, 0.002);
            vspd = -rnd(0.65, 0.1);
            
            attack_modifier_list = other.attack_modifier_list;
            range = wp_range
            
            if aim == false
            {
                range *= random_range(0.33, 1);
            }
            
            length = range / zspd;
            traveled = 0;
            
            shooter = other.id;
            enemy = other.enemy;
            friendly = other.friendly;
            playable = other.playable;
            mounted = other.mounted;
            
            eq_wpn = other.eq_wpn;
            
            damage = get_damage(other.eq_wpn, other.attack_modifier_list, other.id);
            critical_hit = other.critical_hit;
            if critical_hit { damage *= wp_multiplier; }
        }
    }
    
    // SHOT SOUND
    weapon_sound();
    
