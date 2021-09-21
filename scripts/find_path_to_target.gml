///find_path_to_target(target x, target y)

    var tox = argument0;
    var toy = argument1;
    
    var grx = (tox div MPCELL) * MPCELL + (MPCELL div 2);
    var gry = (toy div MPCELL) * MPCELL + (MPCELL div 2);

    var px = (tox div MPCELL)*MPCELL+(MPCELL div 2);
    var py = (toy div MPCELL)*MPCELL+(MPCELL div 2);
    
    if (mp_grid_path(global.pathgrid, path, x, y, grx, gry, true))
    {
        path_set_kind(path, 1);
        path_set_precision(path, 1);
        
        return true;
    }
    else
    {
        path_end();
        return false;
    }
    
