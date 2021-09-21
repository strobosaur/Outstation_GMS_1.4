///atribute_growth();
    
    var s = a_stats[a_stats.str];
    var d = a_stats[a_stats.dex];
    var c = a_stats[a_stats.con];
    var l = a_stats[a_stats.skl];
//    var i = astats[a_stats.int];
    
    s = irandom_range(1, 3) if random(1) < 0.1 { s += 1; };
    d = irandom_range(1, 3) if random(1) < 0.1 { d += 1; };
    c = irandom_range(1, 3) if random(1) < 0.1 { c += 1; };
    l = irandom_range(1, 3) if random(1) < 0.1 { l += 1; };
//    i = irandom_range(1, 3) if random(1) < 0.1 { i += 1; };
    
/*    repeat(3)
    {    
        var med = mean(s, d, c, l, i);
        var mid = 0.25;
        var rand = 0.5;
        
        s += (s - med) * rnd(mid, rand);
        d += (d - med) * rnd(mid, rand);
        c += (c - med) * rnd(mid, rand);
        l += (l - med) * rnd(mid, rand);
        i += (i - med) * rnd(mid, rand);
    }
    
/*    med = mean(s, d, c, l, i);
    
    s += (s - med * 0.75) * rnd(0.225, 0.125);
    d += (d - med * 0.75) * rnd(0.225, 0.125);
    c += (c - med * 0.75) * rnd(0.225, 0.125);
    l += (l - med * 0.75) * rnd(0.225, 0.125);
    i += (i - med * 0.75) * rnd(0.225, 0.125);
    
    var avg = (rnd(4.25, 0.35)) / (s + d + c + l + i);
    
    s *= avg * rnd(1, 0.225);
    d *= avg * rnd(1, 0.225);
    c *= avg * rnd(1, 0.225);
    l *= avg * rnd(1, 0.225);
    i *= avg * rnd(1, 0.225);
    
    var tot = (s + d + c + l + i);
    
    lvl_inc[lvlup.str] = s;
    lvl_inc[lvlup.dex] = d;
    lvl_inc[lvlup.con] = c;
    lvl_inc[lvlup.skl] = l;
    lvl_inc[lvlup.int] = i;
