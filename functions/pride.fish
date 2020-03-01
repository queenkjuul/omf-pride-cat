# fish script to handle configuration of pride-cat theme, as there are lots of 
# customizations available and the user shouldn't have to `set -U foo` a million times
# extensible, so it will be easy to add additional options as I rewrite fish_prompt

# live long and prosper, loves

# set valid variable options

set opt_def on off default
set opt_reset
if set -q $__pride_flags
    # __pride_flags should be populated with this default list at install
    set opt_flag gay \
                    bi \
                    lesbian \
                    lipstick \
                    pan \
                    trans \
                    nonbinary \
                    soviet \
                    sankara
else   
    set opt_flag $__pride_flags
end
set opt_commie $opt_def
set opt_prompt default block
set opt_username $opt_def
set opt_hostname $opt_def
set opt_bind_mode $opt_def
set opt_cat_style default slavic
set opt_cat_status default on off git
set opt_right_prompt $opt_def

# this is designed to allow simple extensibility. 
# to add a new (simple) command, all you need to do is add it to the 
# list of commands, add the variable it sets to the list of variables,
# and add a variable up above with the valid arguments

# for example, future release adds a prompt element called "foo"
# which is controlled by the __pride_foo environment variable which
# takes on, off, red, blue, default as valid values

#   set pride_commands $pride_commands foo
#   set pride_vars $pride_vars __pride_foo
#   set opt_foo on off red blue default

set pride_commands \
                reset \
                flag \
                commie \
                prompt \
                username \
                hostname \
                bind_mode \
                cat_style \
                cat_status \
                right_prompt \
                add_flag

set pride_vars \
                __pride_dummy \
                __pride_flag \
                __pride_commie \
                __pride_prompt \
                __pride_username \
                __pride_hostname \
                __pride_bind_mode \
                __pride_cat \
                __pride_cat_status \
                __pride_right_prompt \
                __pride_dummy

# assign arguments

set cmd $argv[1]
set opt $argv[2]
set env_var $pride_vars[(contains -i $cmd $pride_commands)]

# functions

function pride_set 
    eval set valid_opts \$opt_$cmd
    if contains $opt $valid_opts
        set -U $env_var $opt
    else
        invalid $opt $valid_opts
    end
    confirm
end

function invalid # (invalid_argument, valid_arguments[])
    echo "invalid argument \"$argv[1]\" (but you're valid <3)"
    echo "valid options are:"
    for option in $argv[2..-1]
        echo $option
    end
end

function confirm 
    switch $env_var
        case __pride_commie
            switch $cmd
                case on default
                    echo "the people's emblem is enabled"
                case off
                    echo "the people's empblem is disabled"
            end
        case __pride_cat
            switch $cmd
                case default
                    echo "cat is (=^･^=)ﾉ (default)"
                case slavic
                    echo "cat is (^._.^)ﾉ (slavic)"
            end
        case \*
            eval set value \$$env_var
            echo "$cmd is set to $value"
    end
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
        for option in $pride_vars
            set -U $option default
            set -g cmd $option
            confirm $option
        end
    else
        echo "config not reset"
    end
end

# function to add custom flags to the pride-cat theme
# flags are in the format:
#   name color1 color2 ... color3
# tested with hex values, but can probably use fish builtin colors
# for example
#   pride add_flag france 0000FF FFFFFF FF0000
# which can then be activated by
#   pride flag france

function add_flag
    set name $argv[2]
    set colors $argv[3..-1]
    set -U __pride_flags $__pride_flags $name
    eval set -U __pride_flag_$name $colors
end

# exec section

if test -z $argv[1]
    invalid blank $pride_commands
else if test $cmd = reset
    pride_reset_defaults
else if test $cmd = add_flag
    add_flag $argv
else
    switch $cmd
        case $pride_commands
            pride_set
        case \*
            invalid $cmd $pride_commands
    end
end
