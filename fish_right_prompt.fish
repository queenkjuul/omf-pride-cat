function fish_right_prompt
    #if test $__pride_right_prompt = on
        set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
        date "+%H:%M:%S"
        set_color normal
    #end
end