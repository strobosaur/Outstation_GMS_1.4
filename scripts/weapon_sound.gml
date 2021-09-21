///weapon_sound()
    
    // SHOT SOUND
    switch(eq_wpn[? "sound"])
    {
        case 0:
        audio_play_sound(sndShot03, 5, false);
        break;
        
        case 1:
        audio_play_sound(sndMachinegun01, 5, false);
        break;
        
        case 2:
        audio_play_sound(sndShotgun01, 5, false);
        break;
        
        case 3:
        audio_play_sound(sndRifle007, 5, false);
        break;
        
        case 4:
        audio_play_sound(sndPunch01, 5, false);
        break;
        
        case 5:
        audio_play_sound(sndSword01, 5, false);
        break;
        
        case 6:
        audio_play_sound(sndHit04, 5, false);
        break;
        
        case 7:
        audio_play_sound(sndHit01, 5, false);
        break;
    }
