function __pride_flag_line
  if test $__pride_flag != soviet
    for color in $argv[2..-1]
      __pride_color_echo $color "█"
    end
  else if test $__pride_flag = soviet
    set_color -b $__pride_soviet_red
    set_color $__pride_soviet_yellow
    echo -n " ☭   "
    set_color normal
  end 
  echo -n " "
end