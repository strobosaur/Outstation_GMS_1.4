///movedust(area, freq 0..1, dust object);

    var area = argument0;
    var freq = argument1;
    var dustobj = argument2;

    // CREATE FX
    
    if timers[timer.dust] <= 0 //alarm[10] <= 0
    {
        var x1 = x + lengthdir_x(area*1.75, (mdir + 180) mod 360);
        var y1 = y + lengthdir_y(area*1.75, (mdir + 180) mod 360);
        
        var rpt = 1;
        if random(10) < (freq * 3.5) {rpt++;}
        if random(10) < (freq * 2) {rpt++;}
        
        repeat(rpt+1) //1 + round(random(1.5 + freq)))
        {
            var pos = random_radius(x1, y1, area);
            
            instance_create(pos[0], pos[1] + 2, dustobj);
        }
        
        // UPDATE ALARM
        
        timers[timer.dust] = 3 //alarm[10] = 3 
        + (round((1.5 - freq) * irandom(5)) 
        + round((1.25 - freq) * irandom(5)));
    }
