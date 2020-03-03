function __pride_print_bind_mode
  if test "$__pride_bind_mode" = "on"
    set_color B77FDD
    printf '['
    switch $fish_bind_mode
      case default
        set_color red
        printf 'n'
      case insert
        set_color green
        printf 'i'
      case visual
        set_color magenta
        printf 'v'
    end
    set_color B77FDD
    printf '] '
  end
end