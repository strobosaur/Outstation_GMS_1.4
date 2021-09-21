///do_damage(damage, attacker, defender);

    // INPUT
    var basedmg = argument0;
    var attacker = argument1;
    var defender = argument2;
    
    // WEAPON LIFESTEAL
    var wp_lifesteal = check_bonus_list(attack_modifier_list, "lifesteal", attacker) //check_attack_matrix(attacker.eq_wpn, attacker.a_matrix, amx.lifesteal);
    
    // HP VARIABLES
    var atk_hp = attacker.stats_a[?"hp"];
    var atk_hpmax = attacker.stats_a[?"hpmax"];
    
    var def_hp = defender.stats_a[?"hp"];
    var def_hpmax = defender.stats_a[?"hpmax"];
    
    // BOTH EXIST? ====================
    if !instance_exists(defender) || !instance_exists(attacker) { exit; }
    
    // IF DEFENDER HAS ARMOR
    if ds_exists(defender.eq_armor, ds_type_map)
    {
        basedmg -= defender.eq_armor[?"amr_pts"];
        basedmg -= ((defender.eq_armor[?"amr_prc"] / 100) * basedmg);
    }
    
    // FLEEING ====================
    if defender.fleeing == true
    {
        basedmg *= 0.25;
    }
    
    // DEAL DMG ====================
    if (instance_exists(attacker) && instance_exists(defender))
    {
        // KNOCKDIR
        var knockdir = point_direction(attacker.x, attacker.y, defender.x, defender.y) + rnd(0, 36);        
        
        // DEAL DAMAGE
        if floor(defender.stats_a[?"armor points"]) > 0
        {
            // IF HAS ARMOR POINTS, DAMAGE ARMOR
            if basedmg > defender.stats_a[?"armor points"]
            {
                basedmg -= min((basedmg-1), defender.eq_armor[?"amr_bonus"]);
                defender.stats_a[?"hp"] -= max(0, basedmg - defender.stats_a[?"armor points"]);
                defender.stats_a[?"armor points"] = 0;
            }
            else
            {
                defender.stats_a[?"armor points"] = approach(defender.stats_a[?"armor points"], 0, basedmg);
            }
        }
        else
        {
            // IF NO ARMOR, DAMAGE HEALTH
            defender.stats_a[?"hp"] -= max(0, basedmg);
        }
        
        // LIFESTEAL ?
        if wp_lifesteal > 0 
        {
            attacker.stats_a[?"hp"] = approach(attacker.stats_a[?"hp"], attacker.stats_a[?"hpmax"], min(def_hp, (basedmg * wp_lifesteal)));
        }
        
        // SET TIMERS
        defender.timers[timer.flash] += lerp((room_speed * 0.75), (basedmg * 30), 0.25);
        defender.timers[timer.regen] = stats_a[?"regen timer"];
        defender.timers[timer.armor_regen] = round(stats_a[?"regen timer"] * 1.65);
        
        // KILL? ====================
        if defender.stats_a[?"hp"] <= 0
        {
            repeat(5) { spill_blood(defender.x, defender.y, basedmg, knockdir); }
            make_blood_dust(defender.x, defender.y, 0.25, 4, dir, 1, false)
//            var ep = defender.x_stats[statistics.pts];

            // ATTACKER STILL ALIVE?
            if instance_exists(attacker)
            {
                // BONUSES TO THE KILLER
                with attacker
                {
                    // KILLS STAT PLUS
                    stats_a[?"kills"] += 1;
                    
                    // BONUS XP & $$$ IF PLAYABLE
                    if attacker.playable == true
                    {
                        //if random(1) < 0.25 {global.r1++;}
                        global.r1 += 0.25;
                        share_xp(attacker.x, attacker.y, 480, par_playable, (0.5+random(0.5)) * defender.stats_a[?"xp points"]);
                    }
                }
            }
        }
    }
    
    // RETURN
    return max(0, basedmg);
