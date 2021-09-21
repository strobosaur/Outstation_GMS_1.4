///shoot_obj(object)
    
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
    {
        // SHOOT
        with instance_create(fire_x, fire_y, argument0)
        {
            has_hit = ds_list_create();
            hitbox = BULLET_HITBOX;
            dir = other.dir + rnd(0, wp_acc);
            
            len = rnd(35, 15)
            
            stats_a = other.stats_a;
            attack_modifier_list = other.attack_modifier_list;
            range = wp_range + round(wp_range * random(0.02 * wp_acc))
            length = range / len;
            traveled = 0;
            
            shooter = other.id;
            mounted = other.mounted;
            enemy = other.enemy;
            friendly = other.friendly;
            playable = other.playable;
            
            eq_wpn = other.eq_wpn;
            wp_pen = ceil(get_penetration(eq_wpn, attack_modifier_list, id));
            
            hit_damage = get_damage(other.eq_wpn, other.attack_modifier_list, other.id);
            critical_hit = other.critical_hit;
            if critical_hit { hit_damage *= wp_multiplier; }
        }
    }
    

