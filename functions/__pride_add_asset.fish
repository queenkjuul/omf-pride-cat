function __pride_add_asset
        set custom_asset_type $argv[2]
        set custom_asset_name $argv[3]
        set custom_asset_value $argv[4..-1]
        if contains 'help' $argv
            echo "
add_function: function to add a custom stuff to the pride-cat theme

    usage:
        pride add_asset TYPE NAME VALUE [VALUE]...

    where emoticon must be wrapped in literal quotes
    for example

        pride add_asset cat_style lenny '( ͡° ͜ʖ ͡°)'

    which can then be activated by

        pride cat_style lenny

    additional details can be found in your assetfile.fish (\$__pride_assetfile)

    prompt layout is

        [\$vi] [username[@hostname]] : \$pwd [emblem] \$git-status [cat] [git rainbow]
        "
            echo "valid asset types:"
            for type in $opt_asset 
                echo $type
            end
        else
            if eval contains $custom_asset_name \$opt_$custom_asset_type
                echo "$custom_asset_name is already defined" # TODO ask for overwrite
            else
                if test -n $custom_asset_value
                    echo -e "\n$custom_asset_type $custom_asset_name '$custom_asset_value'" >> $__pride_assetfile
                    eval set opt_$custom_asset_type \$opt_$custom_asset_type $custom_asset_name
                    eval echo "$custom_asset_type \"$custom_asset_name\" added to $__pride_assetfile"
                else
                    echo "asset value cannot be blank"
                end
            end
        end
    end