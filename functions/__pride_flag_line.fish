function __pride_flag_line
        if test $__pride_flag_style != soviet
            for color in $argv[1..-1]
                set_color $color 
                echo -n (string trim -c '"' $__pride_prompt)
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