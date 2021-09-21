///level_up_array(choices)

//    var receiver = argument0;
    var choices = argument0;
    
    var add_stat = 0;
    var add_count = 0;
    var total_added = 0;
    var runs = 3;
    var stat_array_length = 5;
    var stat_count = 0;
            
    var add_more = true;
    
    var skill_list = ds_list_create();
    
    for (var a = 0; a < a_stats.stop; a++)
    {
        stat_count[a] = 0;
    }
    
 //   for (var c = 0; c < argument0; c++)
    {
//        for (var h = 0; h < stat_count; h++)
        {
//            stat_options[c, h] = 0;
        }
    }

    // MAKE ALL THE OPTIONS
    for (var i = 0; i < argument0; i++)
    {
        // RESET
        runs = 4;
        add_count = 0;
        total_added = 0;
    
        for (var a = 0; a < a_stats.stop; a++)
        {
            stat_count[a] = 0;
//            global.menu[
        }
        
        // ONE OF THE OPTIONS
/*        if random(1) < 0.33 - (0.025 * total_added)
        {
            // HP UP
            add_stat = bstats[b_stats.hpmax];
            add_count = 5;
            total_added++;
        }
        else
        {   
            // RANDOM A-STAT
//            add_stat = irandom(array_length_1d(receiver.astats)-1);
            add_stat = irandom(4)//irandom(array_length_1d(receiver.astats)-1);
            add_count += 1;
            total_added++;
        }*/
        
        // REPEAT THE CHOSEN ATTRIBUTE
        repeat(runs) 
        {
            add_stat = irandom(4)//array_length_1d(receiver.astats)-1)// < 0.2// { bonus++; } }
            add_count = 1;
            total_added++;
            
            repeat(5)
            {
                if chance(0.5 - (0.05 * total_added)) 
                {
                    add_count++
                    total_added++;
                }
            }
            // ADD STAT TO ARRAY
            stat_count[add_stat] += add_count;
            // EXTRA?
            if chance(0.35) < max(0, (0.35 - (total_added * 0.05)))
            {
                runs++;
            }
        }
        ds_list_add(skill_list, stat_count);
        stat_count = 0;
    }
    
    // SUMMARIZE CHOICES
//    var text_count = 0;
//    var receiver = global.team_active;
/*    var length = stat_array_length-1;
    
    // LOOP
    for (var j = 0; j < length; j++)
    {
        // RESET
        text_count = 0;
        for (var k = 0; k < length; k++)
        {
            // IF NOT EMPTY
            if stat_options[j, k] != 0
            {
                // SWITCH ATTRIBUTES
                switch stat_options[j, k]
                {
                    case a_stats.str:
                    stat_options[j, stat_array_length + a_stats.str] = "STR";
                    text_count++;
                    break;
                    
                    case a_stats.dex:
                    stat_options[j, stat_array_length + a_stats.dex] = "DEX";
                    text_count++;
                    break;
                    
                    case a_stats.skl:
                    stat_options[j, stat_array_length + a_stats.skl] = "SKL";
                    text_count++;
                    break;
                    
                    case a_stats.con:
                    stat_options[j, stat_array_length + a_stats.con] = "CON";
                    text_count++;
                    break;
                    
                    case a_stats.def:
                    stat_options[j, stat_array_length + a_stats.def] = "DEF";
                    text_count++;
                    break;
                }
            }
        }
    }*/
    
    // RETURN STAT OPTIONS
    return skill_list //stat_options;
            
        
/*        
    
//        upgrade[0] =
        var options = array_height_2d(udata, 0);
        var available = ds_list_create();
        var chosen = 0;
        var done = false;
        var k = 0;
        
        for (var j = 0; j < skl_ay.stop; j++)
        {        
            ds_list_add(available, j);
        }
        
        while done == false
        {
            

