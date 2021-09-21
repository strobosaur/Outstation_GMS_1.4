///give_trait(what trait)

    if argument0 != -1
    {
        var trait = ds_list_find_value(sys_core.trait_pool, ds_list_find_index(sys_core.trait_pool, argument0));
    }
    else
    {
        ds_list_shuffle(sys_core.trait_pool);
        var trait = ds_list_find_value(sys_core.trait_pool, 0);
    }

    script_execute(trait);
