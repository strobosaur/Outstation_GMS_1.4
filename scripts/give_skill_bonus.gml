///give_skill_bonus(skill, old skill)

    var skill = argument0[?"name"];
    
    var skill_list = unit_data.skill_list;
    
    if argument0 == argument1 {exit;}
        
    // REMOVE OLD SKILL BONUS
    if argument1 != -1
    {
        var old_skill = argument1[?"name"];
        
        switch old_skill
        {
            // COMBAT
            case "combat":
            stats_a[?"base th_plus"] -= 1;
            stats_a[?"base ac"] -= 1;
            break;
            
            // MELEE
            case "melee":
            stats_a[?"base ac"] -= 2;
            base_armor[?"amr_bonus"] -= 1;
        
            ds_list_delete(attack_modifier_list, ds_list_find_index(attack_modifier_list, unit_data.melee_base));
            break;
            
            // DEFENSE
            case "defense":
            base_armor[?"amr_total"] -= 20;
            base_armor[?"amr_bonus"] -= 1;
            stats_a[?"regen"] -= 0.1;
            stats_a[?"armor regen"] -= 0.35;
            break;
            
            // OVERKILL
            case "overkill":
            stats_a[?"base crit"] -= 1;
            stats_a[?"base d_plus"] -= 1;
        
            ds_list_delete(attack_modifier_list, ds_list_find_index(attack_modifier_list, unit_data.overkill_base));
            break;
            
            // BLOODLUST
            case "bloodlust":
            stats_a[?"base th_plus"] -= 1;
            stats_a[?"base d_plus"] -= 1;
            
            ds_list_delete(attack_modifier_list, ds_list_find_index(attack_modifier_list, unit_data.bloodlust_base));
            break;
        }
    }
    
    // ADD NEW SKILL BONUS
    switch skill
    {
        // COMBAT
        case "combat":
        stats_a[?"base th_plus"] += 1;
        stats_a[?"base ac"] += 1;
        break;
        
        // MELEE
        case "melee":
        stats_a[?"base ac"] += 2;
        base_armor[?"amr_total"] += 1;
        
        ds_list_add(attack_modifier_list, unit_data.melee_base);
        break;
        
        // DEFENSE
        case "defense":
        base_armor[?"amr_total"] += 20;
        base_armor[?"amr_bonus"] += 1;
        stats_a[?"regen"] += 0.1;
        stats_a[?"armor regen"] += 0.35;
        break;
        
        // OVERKILL
        case "overkill":
        stats_a[?"base crit"] += 1;
        stats_a[?"base d_plus"] += 1;
        
        ds_list_add(attack_modifier_list, unit_data.overkill_base);
        break;
        
        // BLOODLUST
        case "bloodlust":
        stats_a[?"base th_plus"] += 1;
        stats_a[?"base d_plus"] += 1;
        
        ds_list_add(attack_modifier_list, unit_data.bloodlust_base);
        break;
    }
