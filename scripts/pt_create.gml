///pt_create(sprite, min life, max life, min size 0..1, sizemod, min spd, max spd, alpha 1, alpha 2);

    // INPUT

    var sprite = argument0;
    var life0 = argument1;
    var life1 = argument2;
    var size0 = argument3;
    var sizemod = argument4;
    var spd0 = argument5;
    var spd1 = argument6;
    var alpha1 = argument7;
    var alpha2 = argument8;
    
    // CREATE PARTICLE
    
    var ptc = part_type_create();
    
    part_type_sprite(ptc, sprite, true, true, false);
    part_type_size(ptc, size0, 1, sizemod, 0);
    part_type_life(ptc, life0, life1);
    part_type_direction(ptc, 90, 90, 0, 0);
    part_type_speed(ptc, spd0, spd1, 0, 0);
    part_type_alpha2(ptc, alpha1, alpha2);
    
    // RETURN
    
    return ptc;
