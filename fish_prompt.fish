# original slavic-cat forked from Toaster https://github.com/oh-my-fish/theme-toaster
# this was forked from slavic-cat https://github.com/yangwao/omf-theme-slavic-cat

# live long and prosper, loves

###########################################################

# Functions

function __pride_color_echo
  set_color $argv[1]
  if test (count $argv) -eq 2
    echo -n $argv[2]
  end
  set_color normal
end

function __pride_print_bind_mode
  if test "$__pride_bind_mode" != "off"
    set_color $__pride_color_lilac
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
    set_color $__pride_color_lilac
    printf '] '
  end
end

function __pride_print_userinfo
  if test "$__pride_username" != "off"
    __pride_color_echo $__pride_username_color (whoami)
    if test "$__pride_hostname" != "off"
      __pride_color_echo $__pride_at_color "@"
      __pride_color_echo $__pride_hostname_color (hostname)
    end
    __pride_color_echo $__pride_connector_color ":"
  end
end

function __pride_current_folder
  set_color $__pride_pwd_color
  if test $PWD = '/'
    echo -n '/'
  else
    echo -n $PWD | grep -o -E '[^\/]+$'
  end
  set_color normal
end

function __pride_print_emblem
  if test $__pride_emblem_status != off
    __pride_color_echo $__pride_emblem_color (string -c '"\'"' $__pride_emblem)
  end
end

function __pride_print_cat
  if test $__pride_cat_status != off
    __pride_color_echo $__pride_cat_color (string trim -c '"\'"' $__pride_cat_icon)
  end
end 

function __pride_git_status_codes
  echo (git status --porcelain ^/dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n')
end

function __pride_git_branch_name
  echo (git rev-parse --abbrev-ref HEAD ^/dev/null)
end

function __pride_rainbow
  if echo $argv[1] | grep -q -e $argv[3]
    __pride_color_echo $argv[2] "彡ミ"
  end
end

function __pride_git_status_icons
  set -l git_status (__pride_git_status_codes)

  __pride_rainbow $git_status $__pride_color_git_d 'D'
  __pride_rainbow $git_status $__pride_color_git_r 'R'
  __pride_rainbow $git_status $__pride_color_git_c 'C'
  __pride_rainbow $git_status $__pride_color_git_a 'A'
  __pride_rainbow $git_status $__pride_color_git_u 'U'
  __pride_rainbow $git_status $__pride_color_git_m 'M'
  __pride_rainbow $git_status $__pride_color_git_q '?'
end


function __pride_git_status
  # In git
  if test -n (__pride_git_branch_name)
    __pride_color_echo $__pride_color_white (__pride_git_branch_name)
    if test -n (__pride_git_status_codes)
      __pride_color_echo $__pride_trans_pink ' ●'
      __pride_print_cat
      __pride_git_status_icons
    else
      __pride_color_echo $__pride_color_green ' ○'
      __pride_print_cat
    end
  else
    if test "$__pride_cat_status" = "on"
      __pride_print_cat
    end
  end
end

#####################################################################
# here we go
####################

function fish_prompt
  __pride_check_defaults
  __pride_print_bind_mode
  __pride_print_userinfo
  __pride_current_folder
  __pride_print_emblem
  __pride_git_status
  __pride_print_cat

  # new line
  echo
  __pride_flag_line $__pride_flag
end
