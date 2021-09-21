///make_chest(x, y, item type, specific item, quality, min q., max q.)

    var xx = argument0;
    var yy = argument1;
    var type = argument2;
    var item_name = argument3;
    var quality = argument4;
    var min_q = argument5;
    var max_q = argument6;
    
    // RANDOM TYPE?
    if type == -1
    {
        type = choose(itemtype.weapon, itemtype.turret, itemtype.armor, itemtype.implant1);
    }
    
    // RANDOM ITEM BY TYPE
    if item_name == -1
    {
        switch type 
        {
            case itemtype.weapon:
            item_name = choose("blaster", "machinegun", "rifle", "powerfist", "blade", "shotgun", "g. launcher");
            break;
            
            case itemtype.armor:
            item_name = choose("kevlar", "type I", "type II");
            break;
            
            case itemtype.implant1:
            item_name = "implant";
            break;
            
            case itemtype.turret:
            item_name = choose("turret", "gun post", "auto cannon", "c. grenade", "f. grenade", "anti tank");
            break
        }
    }
    
    var item_map = generate_item(type, item_name, quality, min_q, max_q);
    
    // MAKE CHEST WITH ITEM
    with instance_create(xx, yy, oChest)
    {
        contained_item = item_map;
        activated = false;
        opened = false;
        name_text = "chest";
    }
