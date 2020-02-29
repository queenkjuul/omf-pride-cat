# original slavic-cat forked from Toaster https://github.com/oh-my-fish/theme-toaster
# this was forked from slavic-cat https://github.com/yangwao/omf-theme-slavic-cat

# Colors

# trans
set __pride_color_trans_blue 55CDFC
set __pride_color_trans_pink F7A8B8

# gay
set __pride_color_red FF0018
set __pride_color_orange FFA52C
set __pride_color_yellow FFFF41
set __pride_color_green 008018
set __pride_color_blue 0000F9
set __pride_color_purple 86007D

# pan
set __pride_color_pan_pink FF1B8D
set __pride_color_pan_yellow FFDA00
set __pride_color_pan_blue 1BB3FF

# nonbinary
set __pride_color_nb_yellow FFF430
set __pride_color_nb_purple 9C59D1

# bi
set __pride_color_bi_pink D60270
set __pride_color_bi_purple 9B4F96
set __pride_color_bi_blue 0038A8

# lesbian
set __pride_color_lesbian_1 D62900
set __pride_color_lesbian_2 FF9B55
set __pride_color_lesbian_3 FFFFFF
set __pride_color_lesbian_4 D461A6
set __pride_color_lesbian_5 A50062

# lipstick
set __pride_color_lipstick_1 A60061
set __pride_color_lipstick_2 B95594
set __pride_color_lipstick_3 D162A8
set __pride_color_lipstick_4 E5ADD1
set __pride_color_lipstick_5 C64D53
set __pride_color_lipstick_6 8C1801

# soviet
set __pride_color_soviet_red CD0000
set __pride_color_soviet_yellow FFD900

# sankara
set __pride_color_sankara_yellow FCD116
set __pride_color_sankara_green 009E49
set __pride_color_sankara_red EF2B2D
set __pride_color_sankara_grey F2F2F2
set __pride_color_sankara_black 191919

# misc
set __pride_color_violet 9C59D1
set __pride_color_lilac B77FDD
set __pride_color_bright_pink f92673
set __pride_color_black 000000
set __pride_color_grey 554F48
set __pride_color_white F1F1F1

# Defaults
if test $__pride_flag = "default"
    set -U __pride_flag trans
end


if test $__pride_cat != slavic  
  set __pride_cat default
end

if test $__pride_cat_status = default
  set -U __pride_cat_status on
end

if test $__pride_cat_status = off
  set __pride_cat_icon " "
else
  switch $__pride_cat 
    case slavic
      set __pride_cat_icon " (^._.^)ﾉ"
    case default
      set __pride_cat_icon " (=^･^=)ﾉ"
  end
end

if test $__pride_bind_mode = default
  set -U __pride_bind_mode off
end

<<<<<<< HEAD
=======
if test $__pride_prompt = default
  set __pride_prompt_char "➤"
end
if test $__pride_prompt = box
  set __pride_prompt_char "█"
else
  set __pride_prompt_char "➤"
end

>>>>>>> 2409c3db1a9467c4ba8538234f4e840071f30e4d
# Functions
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

  __pride_rainbow $git_status $__pride_color_trans_pink 'D'
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
      __pride_color_echo $__pride_color_trans_pink ' ●'
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

function fish_prompt
  if test $__pride_prompt = "default"
    set __pride_prompt_char "➤"
  end
  if test $__pride_prompt = "block"
    set __pride_prompt_char "█"
  end
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
  if test "$__pride_username" != "off"
    __pride_color_echo $__pride_color_bright_pink (whoami)
    if test "$__pride_hostname" != "off"
      __pride_color_echo $__pride_color_white "@"
      __pride_color_echo $__pride_color_trans_blue (hostname)
    end
    __pride_color_echo $__pride_color_white ":"
  end
  set_color magenta;echo -n (prompt_pwd);set_color normal
  __pride_color_echo $__pride_color_violet " "
  if test "$__pride_commie" != "off"
    __pride_color_echo $__pride_color_red " ☭ "
  end
  __pride_git_status

  echo
  function __pride_flag_line
    switch $__pride_flag
      case trans
        __pride_color_echo $__pride_color_trans_blue "$__pride_prompt_char"
        __pride_color_echo $__pride_color_trans_pink "$__pride_prompt_char"
        __pride_color_echo $__pride_color_white "$__pride_prompt_char"
        __pride_color_echo $__pride_color_trans_pink "$__pride_prompt_char"
        __pride_color_echo $__pride_color_trans_blue "$__pride_prompt_char  "
      case gay
        __pride_color_echo $__pride_color_red "$__pride_prompt_char"
        __pride_color_echo $__pride_color_orange "$__pride_prompt_char"
        __pride_color_echo $__pride_color_yellow "$__pride_prompt_char"
        __pride_color_echo $__pride_color_green "$__pride_prompt_char"
        __pride_color_echo $__pride_color_blue "$__pride_prompt_char"
        __pride_color_echo $__pride_color_purple "$__pride_prompt_char  "
      case pan
        __pride_color_echo $__pride_color_pan_pink "$__pride_prompt_char"
        __pride_color_echo $__pride_color_pan_pink "$__pride_prompt_char"
        __pride_color_echo $__pride_color_pan_yellow "$__pride_prompt_char"
        __pride_color_echo $__pride_color_pan_yellow "$__pride_prompt_char"
        __pride_color_echo $__pride_color_pan_blue "$__pride_prompt_char"
        __pride_color_echo $__pride_color_pan_blue "$__pride_prompt_char  "
      case nonbinary
        __pride_color_echo $__pride_color_nb_yellow "$__pride_prompt_char"
        __pride_color_echo $__pride_color_white "$__pride_prompt_char"
        __pride_color_echo $__pride_color_nb_purple "$__pride_prompt_char"
        __pride_color_echo $__pride_color_black "$__pride_prompt_char  "
      case bi
        __pride_color_echo $__pride_color_bi_pink "$__pride_prompt_char"
        __pride_color_echo $__pride_color_bi_pink "$__pride_prompt_char"
        __pride_color_echo $__pride_color_bi_purple "$__pride_prompt_char"
        __pride_color_echo $__pride_color_bi_purple "$__pride_prompt_char"
        __pride_color_echo $__pride_color_bi_blue "$__pride_prompt_char"
        __pride_color_echo $__pride_color_bi_blue "$__pride_prompt_char  "
      case lesbian
        __pride_color_echo $__pride_color_lesbian_1 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lesbian_2 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lesbian_3 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lesbian_4 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lesbian_5 "$__pride_prompt_char "
      case lipstick
        __pride_color_echo $__pride_color_lipstick_1 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lipstick_2 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lipstick_3 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lipstick_4 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lipstick_5 "$__pride_prompt_char"
        __pride_color_echo $__pride_color_lipstick_6 "$__pride_prompt_char "
      case sankara
        __pride_color_echo $__pride_color_sankara_yellow "$__pride_prompt_char"
        __pride_color_echo $__pride_color_sankara_green "$__pride_prompt_char"
        __pride_color_echo $__pride_color_sankara_red "$__pride_prompt_char"
        __pride_color_echo $__pride_color_sankara_grey "$__pride_prompt_char"
        __pride_color_echo $__pride_color_sankara_black "$__pride_prompt_char "
      case soviet
        set_color -b $__pride_color_soviet_red
        __pride_color_echo $__pride_color_soviet_red " "
        __pride_color_echo $__pride_color_soviet_yellow "☭"
        __pride_color_echo $__pride_color_soviet_red "    "
        set_color normal 
        __pride_color_echo $__pride_color_soviet_red " "
      case default
        set -U __pride_flag trans
        __pride_flag_line
    end
  end
  __pride_flag_line
end
