///to_inventory(item)

    var item = argument0;
    
    // IS ACTUAL ITEM?
    if item[? "itemtype"] == -1 //"unarmed" || item[? "type"] == -1
    {
        exit;
    }
    
    // ITEMTYPE SORTING
    for (var i = 0; i < itemtype.stop; i++)
    {
        if item[? "itemtype"] == i
        {
            ds_list_add(global.inventory[| i], item);
            ds_list_sort(global.inventory[| i], true);
        }
    }
