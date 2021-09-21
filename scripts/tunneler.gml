///tunneler(grid, x, y, dir)

    var grid = argument0;
    var xx = argument1;
    var yy = argument2;
    var dir = argument3;
    
    var rx1 = 0;
    var ry1 = 0;
    var rx2 = 0;
    var ry2 = 0;
    var rlen = 0;
    var rw = 0;
    
    do_door_x = xx;
    do_door_y = yy;
    
    var rwidth = irandom_range(3, 7);
    var rheight = irandom_range(3, 7);
    
    if random(1) < odds
    {
        rx1 = xx + lengthdir_x(rwidth, dir) + lengthdir_x(rwidth, 2*90);
        ry1 = yy + lengthdir_y(rheight, dir) + lengthdir_y(rheight, 1*90);
        rx2 = xx + lengthdir_x(irandom_range(3, 7), dir)+irandom_range(1,3);
        ry2 = yy + lengthdir_y(irandom_range(3, 7), dir)+irandom_range(1,3);
        
        make_room(grid, 9, 9, false);
    }
    else
    {
        xx += lengthdir_x(1, dir);
        yy += lengthdir_y(1, dir);
        
        grid[# xx-1, yy-1] = mapcode.ground;
    }
/*    while (grid[# xx-1, yy-1] != mapcode.void)
    {
        xx += lengthdir_x(1, dir*90);
        yy += lengthdir_y(1, dir*90);
    }
    
    grid[#xx-1,yy-1] = mapcode.door;
    
    rlen = irandom(3) + 2;
    rw = irandom(1)+1;
    
    rx1 = xx + lengthdir_x(rlen, dir*90) ;
    ry1 = 
    
