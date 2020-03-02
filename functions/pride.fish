# fish script to handle configuration of pride-cat theme, as there are lots of 
# customizations available and the user shouldn't have to `set -U foo` a million times
# extensible, so it will be easy to add additional options as I rewrite fish_prompt

# live long and prosper, loves

# use as function for fish prompt
#function pride

    #set __pride_assetfile /mnt/c/Users/QueenKJuul/omf-pride-cat/assetfile.fish

    # set valid variable options

    # valid options for most variables
    set opt_def on off default

    set opt_cat_status default on off git
    
    # all variables which accept default set of options
    set opt_username $opt_def
    set opt_hostname $opt_def
    set opt_bind_mode $opt_def
    set opt_right_prompt $opt_def
    set opt_emblem_status $opt_def
    
    # valid asset types for importing from assetfile
    set opt_asset 'cat' 'flag' 'emblem' 'prompt'

    # all variables we're allowed to modify with this script
    # making things easier for myself in the future if I add new functionality to fish_prompt
    # adding additional config options is as simple as setting a range of acceptable values 
    # (either the opt_def set, or a custom set defined above),
    # and add the variable you want to be able to switch to the list below
    eval set __pride_config_vars \
                    __pride_bind_mode \
                    __pride_username \
                    __pride_hostname \
                    __pride_emblem_status \
                    __pride_cat_status \
                    __pride_right_prompt 
    

    # all but a few valid commands are also just environment variable names minus the __pride_ prefix
    # exceptions are 'reset', 'add_asset', 'demo'
    for var in $__pride_config_vars 
        set pride_commands $pride_commands (string split -m 3 "_" $var)[4]
    end
    eval set pride_commands \$pride_commands $opt_asset

    # assign arguments

    set -g cmd $argv[1]
    set -g option $argv[2]

    # functions

    function load_assets
        for line in (cat $__pride_assetfile)                                                        # read file
            if test -n $line; and test (string split -m 1 '' (echo $line | sed -n 's/ *//p'))[1] != "#"               # if not blank or commented
                set tmp_asset (string split " " $line)[1]                                   # set tmp_asset to first word on line
                set tmp_name (string split " " $line)[2]                                    # set tmp_name to second word on line
                set tmp_value (string split " " $line)[3..-1]                               # set tmp_value to remaining words on line
                if contains $tmp_asset $opt_asset                                           # check if parsed asset type is valid
                    eval set -g opt_$tmp_asset \$opt_$tmp_asset $tmp_name                   # add found name to list of valid options
                    eval set -g __pride_"$tmp_asset"_$tmp_name \$tmp_name \$tmp_value       # create new variable "__pride_asset_name" with contents "name" "value"
                else 
                    invalid $tmp_asset $opt_asset
                end
            end
        end
        set -g opt_flag $opt_flag soviet
    end

    function pride_set
        echo $cmd
        echo $opt_flag
        eval set valid_opt \$opt_$cmd
        if contains $cmd $opt_asset
            echo "$cmd is valid asset"
            if eval contains $option \$opt_"$cmd"
                eval set -U __pride_$cmd \$__pride_"$cmd"_"$option"[2..-1]
                eval set -U __pride_"$cmd"_style \$__pride_"$cmd"_"$option"[1]
            end
        else if contains $option $valid_opt
            eval set -U __pride_$cmd $option
        else
            invalid $option $valid_opt
        end
        confirm
    end

    function invalid # (invalid_argument, valid_arguments[])
        echo "invalid argument \"$argv[1]\" (but you're valid <3)"
        echo "valid options are:"
        for value in $argv[2..-1]
            echo $value
        end
    end

    function confirm 
        eval set value \$__pride_$cmd                                           # $value equals the value of the environment variable we're modifying
        eval set state \$__pride_"$cmd"_$value                                  # $state equals the contents of the currently selected asset
        if contains $cmd $opt_asset
            eval set style \$__pride_"$cmd"_style
            eval echo -n "$cmd is set to \$__pride_"$cmd"_"$style"  "
            if test $cmd = flag
                __pride_flag_line $__pride_flag
            else
                eval echo -n "\$state[2..-1]"
            end
        else
            eval echo -n "$cmd is set to \$__pride_$cmd  "            
            eval echo -n "\$state[2..-1]"                # output modified variable name, its new value, and the contents of its asset
        end                                                                    # TODO: make this print flag
    end


    function pride_reset_defaults
        echo "this will make custom flags inoperable"
        echo "continue? (Y/n)"
        set entry
        read entry
        if test -z $entry
            set entry "Y"
        end
        if test $entry = Y
            for variable in $__pride_vars
                set -U $variable default
                set -g cmd $variable
                confirm $variable
            end
        else
            echo "config not reset"
        end
    end

    function __pride_flag_line
        if test $__pride_flag_style != soviet
            for color in $argv[1..-1]
            set_color $color 
            echo -n $__pride_prompt_char
            set_color normal
            end
        else if test $__pride_flag = soviet
            set_color -b $__pride_soviet_red
            set_color $__pride_soviet_yellow
            echo -n " ☭   "
            set_color normal
        end 
    echo -n " "
    end

    ##############################################
    # main execution section
    ########################
    load_assets
    if test -z $cmd
        invalid blank $pride_commands
    else
         switch $cmd
            case reset
                pride_reset_defaults
            case add_asset
                source __pride_add_asset $argv
            case demo
                echo "coming soon"
            case $pride_commands
                pride_set
            case \*
                invalid $cmd $pride_commands
        end
    end
#end

