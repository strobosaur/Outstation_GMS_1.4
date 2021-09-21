///skill_pts(stats object, amount)

    var target = argument0;
    var amount = argument1 * rnd(5, 1);
    
    if enemy == par_friendly || is_undefined(skill_log) { exit; }
    
//    var skill_log = get_statsmap(target, "skill log", -1);
        
        switch target.eq_wpn[? "sklt"]
        {
            case -1:
            exit;
            
            case wpntype.mw:
            skill_log[skills.skl_mw, 0] += amount;
            break;
            
            case wpntype.lw:
            skill_log[skills.skl_lw, 0] += amount;
            skill_log[skills.skl_rw, 0] += amount * 0.5;
            skill_log[skills.skl_agl, 0] += amount * 0.33;
            skill_log[skills.skl_spr, 0] += amount * 0.2;
            break;
            
            case wpntype.rw:
            skill_log[skills.skl_rw, 0] += amount;
            skill_log[skills.skl_lw, 0] += amount * 0.5;
            skill_log[skills.skl_aim, 0] += amount * 0.33;
            skill_log[skills.skl_crt, 0] += amount * 0.2;
            break;
            
            case wpntype.hw:
            skill_log[skills.skl_hw, 0] += amount;
            skill_log[skills.skl_aim, 0] += amount * 0.33;
            skill_log[skills.skl_spr, 0] += amount * 0.33;
            skill_log[skills.skl_spr, 0] += amount * 0.5;
            break;
            
            case wpntype.bw:
            skill_log[skills.skl_mw, 0] += amount;
            skill_log[skills.skl_def, 0] += amount * 0.2;
            skill_log[skills.skl_fgt, 0] += amount * 0.25;
            skill_log[skills.skl_agl, 0] += amount * 0.33;
            skill_log[skills.skl_spr, 0] += amount * 0.2;
            break;
            
            case wpntype.fw:
            skill_log[skills.skl_mw, 0] += amount;
            skill_log[skills.skl_fgt, 0] += amount * 0.25;
            skill_log[skills.skl_crt, 0] += amount * random(0.25);
            skill_log[skills.skl_agl, 0] += amount * 0.33;
            skill_log[skills.skl_shk, 0] += amount * 0.2;
            break;
            
            case wpntype.tw:
            skill_log[skills.skl_tw, 0] += amount;
            break;
        }
