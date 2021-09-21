///pickup_scan()

    if instance_exists(oPickup)
    {
        var pickup = instance_nearest(x, y, oPickup)
        var dist = point_distance(x, y, pickup.x, pickup.y);
        
        if dist < 48
        {
            global.current_pickup = pickup;
            
            if GPB_p && dist < 48
            {
                to_inventory(pickup.contained_item)
                with pickup
                {
                    instance_destroy();
                    global.current_pickup = noone;
                    
                    // SOUND EFFECT
                    audio_play_sound(sndPowerup01b, 20, false);
                }
            }
        }
        else
        {
            global.current_pickup = noone;
        }
    }
    else
    {
        global.current_pickup = noone;
    }
