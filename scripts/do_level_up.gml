///do_level_up(type, hp bonus t/f)

    var level_type = argument0;
    var do_hp = argument1;
    
    // LUCKY?
    var luck = weighted_random(10, 5, 1);
    var health_multiplier = 1.75 - (0.135 * stats_a[?"level"]);
    
    // WHAT TYPE?
    switch level_type 
    {
        // COMBAT === === === === === === === === === ===
        case "combat":
        
        if do_hp
        {
            // HP BONUS
            stats_a[?"hpmax"] += round((2 + luck) * stats_a[?"health"] * health_multiplier);
            stats_a[?"hp"] = stats_a[?"hpmax"]
        }
        
        // SKILL LEVEL UP
        skill_log[?"combat_lvl"] += 1;
        
        // EQ SKILLS
        if skill_log[?"combat_lvl"] == 2
        {
            ds_list_add(eq_skill_list, unit_data.combat1);
        }
        
        // BASE BONUSES
        stats_a[?"base th_plus"] += 1;
        
        // RANDOM DAMAGE BONUS
        if random(1) < (0.5 + (luck / 10))
        {
            stats_a[?"base d_plus"] += 1;
        }
        
        // LEVEL 3?
        if skill_log[?"combat_lvl"] mod 3 == 0
        {
            // ATTACK SPEED PASSIVE
            var combat_bonus = make_bonus_array(statstype.stats_w, "atkspd", "combat +spd", operation.divide, 0.15 + (luck / 10), 0, wpntype.allw);
            ds_list_add(attack_modifier_list, combat_bonus);
        }
        
        break;
        
        // MELEE === === === === === === === === === ===
        case "melee":
        
        if do_hp
        {
            // HP BONUS
            stats_a[?"hpmax"] += round((2 + luck) * stats_a[?"health"] * health_multiplier);
            stats_a[?"hp"] = stats_a[?"hpmax"]
        }
        
        // SKILL LEVEL UP
        skill_log[?"melee_lvl"] += 1;
        
        // EQ SKILLS
        if skill_log[?"melee_lvl"] == 2
        {
            ds_list_add(eq_skill_list, unit_data.melee1);
        }
        
        // BASE BONUSES
        stats_a[?"base th_plus"] += 1;
        stats_a[?"base d_plus"] += 1;
        
        // RANDOM AC BONUS
        if random(1) < (0.5 + (luck / 10))
        {
            stats_a[?"base ac"] += 1;
        }
        
        // LEVEL 3?
        if skill_log[?"melee_lvl"] mod 3 == 0
        {
            // ADDED RANGE PASSIVE
            var melee_bonus = make_bonus_array(statstype.stats_w, "range", "melee 3 : range+", operation.add, 25, 0, wpntype.allw);
            ds_list_add(attack_modifier_list, melee_bonus);
        }
        
        break;
        
        // DEFENSE === === === === === === === === === ===
        case "defense":
        
        if do_hp
        {
            // HP BONUS
            stats_a[?"hpmax"] += round((3 + luck) * stats_a[?"health"] * health_multiplier);
            stats_a[?"hp"] = stats_a[?"hpmax"]
        }
        
        // SKILL LEVEL UP
        skill_log[?"defense_lvl"] += 1;
        
        // EQ SKILLS
        if skill_log[?"defense_lvl"] == 2
        {
            ds_list_add(eq_skill_list, unit_data.def1_reg);
        }
        
        // BASE BONUSES
        stats_a[?"base ac"] += 1;
        
        // RANDOM TO HIT BONUS
        if random(1) < (0.5 + (luck / 10))
        {
            stats_a[?"base th_plus"] += 1;
        }
        
        // RANDOM REGEN BONUS
        if random(1) < (0.5 + (luck / 10))
        {
            stats_a[?"regen"] += 0.1 + (luck / 10);
        }
        
        // RANDOM ARMOR REGEN BONUS
        if random(1) < (0.5 + (luck / 10))
        {
            stats_a[?"armor regen"] += 0.1 + (luck / 10);
        }
        
        // LEVEL 3?
        if skill_log[?"defense_lvl"] mod 3 == 0
        {
            // ADDED ARMOR TOTAL PASSIVE
            base_armor[?"amr_total"] += 10 + (5 * luck)
            // ADDED ARMOR BONUS PASSIVE
            base_armor[?"amr_bonus"] += 1;
            // ADDED ARMOR BONUS PASSIVE
            stats_a[?"armor regen"] += 0.25 + (0.1 * luck);
        }
        
        break;
        
        // OVERKILL === === === === === === === === === ===
        case "overkill":
        
        if do_hp
        {
            // HP BONUS
            stats_a[?"hpmax"] += round((1 + luck) * stats_a[?"health"] * health_multiplier);
            stats_a[?"hp"] = stats_a[?"hpmax"]
        }
        
        // SKILL LEVEL UP
        skill_log[?"overkill_lvl"] += 1;
        
        // EQ SKILLS
        if skill_log[?"overkill_lvl"] == 2
        {
            ds_list_add(eq_skill_list, unit_data.overkill1);
        }
        
        // BASE BONUSES
        stats_a[?"base crit"] += 0.75;
        stats_a[?"base th_plus"] += 1;
        
        // RANDOM DAMAGE BONUS
        if random(1) < (0.5 + (luck / 10))
        {
            stats_a[?"base d_plus"] += 1;
        }
        
        // LEVEL 3?
        if skill_log[?"overkill_lvl"] mod 3 == 0
        {
            // ADDED MULTIPLIER PASSIVE
            var overkill_bonus = make_bonus_array(statstype.stats_w, "multiplier", "overkill 3 : crt x+", operation.add, 1.5, 0, wpntype.allw);
            ds_list_add(attack_modifier_list, overkill_bonus);
        }
        
        break;
        
        // BLOODLUST === === === === === === === === === ===
        case "bloodlust":
        
        if do_hp
        {
            // HP BONUS
            stats_a[?"hpmax"] += round((1 + luck) * stats_a[?"health"] * health_multiplier);
            stats_a[?"hp"] = stats_a[?"hpmax"]
        }
        
        // SKILL LEVEL UP
        skill_log[?"bloodlust_lvl"] += 1;
        
        // EQ SKILLS
        if skill_log[?"bloodlust_lvl"] == 2
        {
            ds_list_add(eq_skill_list, unit_data.bloodlust1);
        }
        
        // BASE BONUSES
        stats_a[?"base d_plus"] += 1;
        stats_a[?"base th_plus"] += 1;
        
        // RANDOM DAMAGE BONUS
        if random(1) < (0.5 + (luck / 10))
        {
            stats_a[?"base crit"] += 0.75;
        }
        
        // LEVEL 3?
        if skill_log[?"bloodlust_lvl"] mod 3 == 0
        {
            // ADDED MULTIPLIER PASSIVE
            var bloodlust_bonus = make_bonus_array(statstype.stats_w, "lifesteal", "bloodlust 3 : steal+", operation.add, 0.2, 0, wpntype.allw);
            ds_list_add(attack_modifier_list, bloodlust_bonus);
        }
        
        break;
    }
