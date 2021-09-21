///check_interactable()

    if instance_exists(par_interactable)
    {
        var dist = 32;
        var list = collision_circle_list_activated(x, y, dist, par_interactable, false, true);
        var best = dist;
        
        if !ds_list_empty(list) //list != noone
        {
            // PARSE LIST FOR NEAREST
            global.interactable = nearest_in_list(x, y, list);
//            ds_list_destroy(list);
        }
        else
        {
            global.interactable = noone;
        }
    }
