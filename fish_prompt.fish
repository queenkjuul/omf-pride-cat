# original slavic-cat forked from Toaster https://github.com/oh-my-fish/theme-toaster
# this was forked from slavic-cat https://github.com/yangwao/omf-theme-slavic-cat

# live long and prosper, loves

# Colors and Flag Definitions

# trans
set -g __pride_trans_blue 55CDFC
set -g __pride_trans_pink F7A8B8
set -g __pride_flag_trans 55CDFC F7A8B8 FFFFFF F7A8B8 55CDFC

# gay
set -g __pride_color_red FF0018
set -g __pride_color_orange FFA52C
set -g __pride_color_yellow FFFF41
set -g __pride_color_green 008018
set -g __pride_color_blue 0000F9
set -g __pride_color_purple 86007D
set -g __pride_flag_gay FF0018 FFA52C FFFF41 008018 0000F9 86007D

# pan
set -g __pride_color_pan_pink FF1B8D
set -g __pride_color_pan_yellow FFDA00
set -g __pride_color_pan_blue 1BB3FF
set -g __pride_flag_pan FF1B8D FF1B8D FFDA00 FFDA00 1BB3FF 1BB3FF

# nonbinary
set -g __pride_flag_nb FFF430 FFFFFF 9C59D1 191919

# bi
set -g __pride_flag_bi D60270 D60270 9B4F96 9B4F96 0038A8 0038A8

# lesbian
set -g __pride_flag_lesbian D62900 FF9B55 FFFFFF D461A6 A50062

# lipstick
set -g __pride_flag_lipstick A60061 B95594 D162A8 E5ADD1 C64D53 8C1801

# soviet
set -g __pride_color_soviet_red CD0000
set -g __pride_color_soviet_yellow FFD900

# sankara
set -g __pride_flag_sankara FCD116 009E49 EF2B2D F2F2F2 191919 

# misc
set -g __pride_color_violet 9C59D1
set -g __pride_color_lilac B77FDD
set -g __pride_color_bright_pink f92673
set -g __pride_color_black 000000
set -g __pride_color_grey 554F48
set -g __pride_color_white F1F1F1

# graphics
set -g __pride_cat_default " (=^･^=)ﾉ"
set -g __pride_cat_slavic " (^._.^)ﾉ"
###########################################################

# Functions
function __pride_check_defaults

  # bind_mode
  if test $__pride_bind_mode = default
    set -U __pride_bind_mode off
  end

  # prompt character
  if test $__pride_prompt = "default"
    set -g __pride_prompt_char "➤"
  end
  if test $__pride_prompt = "block"
    set -g __pride_prompt_char "█"
  end

  # cat icon
  if test $__pride_cat_status = off
    set -g __pride_cat_icon " "
  else
    switch $__pride_cat 
      case slavic
        eval set -g __pride_cat_icon \$__pride_cat_$__pride_cat
      case default
        eval set -g __pride_cat_icon \$__pride_cat_$__pride_cat
    end
  end

  # flag
  if test $__pride_flag = default
    set __pride_flag trans
  end

  # set current colorscheme
    eval set -g __pride_current_flag \$__pride_flag_$__pride_flag
end

function __pride_color_echo
  set_color $argv[1]
  if test (count $argv) -eq 2
    echo -n $argv[2]
  end
end

function __pride_current_folder
  if test $PWD = '/'
    echo -n '/'
  else
    echo -n $PWD | grep -o -E '[^\/]+$'
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

  __pride_rainbow $git_status $__pride_trans_pink 'D'
  __pride_rainbow $git_status $__pride_color_orange 'R'
  __pride_rainbow $git_status $__pride_color_white 'C'
  __pride_rainbow $git_status $__pride_color_green 'A'
  __pride_rainbow $git_status $__pride_color_blue 'U'
  __pride_rainbow $git_status $__pride_color_lilac 'M'
  __pride_rainbow $git_status $__pride_color_grey '?'
end

function __pride_print_cat
  __pride_color_echo $__pride_color_white $__pride_cat_icon
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
    __pride_color_echo $__pride_color_bright_pink (whoami)
    if test "$__pride_hostname" != "off"
      __pride_color_echo $__pride_color_white "@"
      __pride_color_echo $__pride_trans_blue (hostname)
    end
    __pride_color_echo $__pride_color_white ":"
  end
end

function __pride_flag_line
  if test $__pride_flag != soviet
    for color in $__pride_current_flag
      __pride_color_echo $color $__pride_prompt_char
    end
  else if test $__pride_flag = soviet
    set_color -b $__pride_color_soviet_red
    set_color $__pride_color_soviet_yellow
    echo -n " ☭   "
    set_color normal
  end 
  echo -n " "
end

#####################################################################
# here we go
####################

function fish_prompt
  __pride_check_defaults
  __pride_print_bind_mode
  __pride_print_userinfo

  # print pwd
  set_color magenta;echo -n (prompt_pwd);set_color normal;echo -n " "
  # __pride_color_echo $__pride_color_violet " "

  if test $__pride_commie != off
    __pride_color_echo $__pride_color_red " ☭ "
  end

  __pride_git_status

  # new line
  echo
  __pride_flag_line
end
