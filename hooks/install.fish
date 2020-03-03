# set of variables to initialize
set -U __pride_vars \
                    __pride_flag_style \
                    __pride_bind_mode \
                    __pride_username \
                    __pride_hostname \
                    __pride_emblem_status \
                    __pride_emblem_style \
                    __pride_prompt_style \
                    __pride_cat_status \
                    __pride_cat_style \
                    __pride_right_prompt 

for var in $__pride_vars
    set -U $var default
end

if test -f $OMF_PATH/themes/pride-cat/conf.d/__pride_init.fish
    echo "init script present"
end

# moving all global variable definitions to new file
# because one, I think this is just more correct, 
# two, it will make a simpler place for users to override settings,
# three, becuase I imagine it will be faster?

# live long and prosper, loves

# Environment

set -U __pride_assetfile $OMF_CONFIG/themes/omf-pride-cat/assetfile.fish
set -U __pride_configfile $OMF_CONFIG/themes/omf-pride-cat/pride_config.fish

# set -U __pride_assetfile ~/omf-pride-cat/pride_assets.fish
# set -U __pride_configfile ~/omf-pride-cat/pride_config.fish

# Colors 

# trans
set __pride_trans_blue 55CDFC
set __pride_trans_pink F7A8B8

# gay
set __pride_gay_red FF0018
set __pride_gay_orange FFA52C
set __pride_gay_yellow FFFF41
set __pride_gay_green 008018
set __pride_gay_blue 0000F9
set __pride_gay_purple 86007D

# pan
set __pride_pan_pink FF1B8D
set __pride_pan_yellow FFDA00
set __pride_pan_blue 1BB3FF

# soviet
set __pride_soviet_red CD0000
set __pride_soviet_yellow FFD900

# misc
set __pride_violet 9C59D1
set __pride_lilac B77FDD
set __pride_bright_pink f92673
set __pride_black 000000
set __pride_grey 554F48
set __pride_white F1F1F1

# read color settings from config
for line in (cat $__pride_configfile)
    if test -n $line; and test (string split -m 1 '' (echo $line | sed -n 's/ *//p'))[1] != "#"
        set  var_name (string split " " $line)[1]
        set var_value (string split " " $line)[2..-1]
        eval set -U $var_name $var_value
    end
end

# load asset values
set opt_asset 'cat' 'flag' 'emblem' 'prompt'
for asset in $opt_asset
    for line in (cat $__pride_assetfile)
        if test -n $line; 
        and test (string split -m 1 '' (echo $line | sed -n 's/ *//p'))[1] != "#"; 
        and test (string split ' ' $line)[1] = $asset

            set class (string split ' ' $line)[1]
            set name (string split ' ' $line)[2]
            set value (string split ' ' $line)[3..-1]

            if eval test \$__pride_"$asset"_style = $name
                eval set -U __pride_$asset \$value
            end
        end
    end
end

# ln -s $OMF_PATH/themes/pride-cat/conf.d/__pride_init.fish $fish_config_dir/conf.d/__pride_init.fish
