# original slavic-cat forked from Toaster https://github.com/oh-my-fish/theme-toaster
# this was forked from slavic-cat https://github.com/yangwao/omf-theme-slavic-cat

set __pride_color_orange FFA52C
set __pride_color_blue 55CDFC
set __pride_color_green A6E22E
set __pride_color_yellow FFF430
set __pride_color_pink F7A8B8
set __pride_color_grey 554F48
set __pride_color_white F1F1F1
set __pride_color_purple 9C59D1
set __pride_color_lilac B77FDD
set __pride_color_red CD0000
set __pride_color_bright_pink f92673
if test -z "$__pride_flag"
  set -U __pride_flag trans
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

  __pride_rainbow $git_status $__pride_color_pink 'D'
  __pride_rainbow $git_status $__pride_color_orange 'R'
  __pride_rainbow $git_status $__pride_color_white 'C'
  __pride_rainbow $git_status $__pride_color_green 'A'
  __pride_rainbow $git_status $__pride_color_blue 'U'
  __pride_rainbow $git_status $__pride_color_lilac 'M'
  __pride_rainbow $git_status $__pride_color_grey '?'
end

function __pride_git_status
  # In git
  if test -n (__pride_git_branch_name)

    #__pride_color_echo $__pride_color_red " ☭ "
    __pride_color_echo $__pride_color_white (__pride_git_branch_name)

    if test -n (__pride_git_status_codes)
      __pride_color_echo $__pride_color_pink ' ●'
      # __pride_color_echo $__pride_color_white ' (^._.^)ﾉ'
      __pride_color_echo $__pride_color_white '(=^･^=)ﾉ'
      __pride_git_status_icons
    else
      __pride_color_echo $__pride_color_green ' ○'
    end
  end
end

function fish_prompt
  set_color $__pride_color_lilac
  if test "$__pride_bind_mode" != "off"
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
    __pride_color_echo $__pride_color_blue ":"
  end
  __pride_color_echo $__pride_color_lilac (prompt_pwd)
  if test "$__pride_commie" != "off"
    __pride_color_echo $__pride_color_red " ☭ "
  end
  __pride_git_status

  echo
  switch $__pride_flag
    case trans
      __pride_color_echo $__pride_color_blue "➤"
      __pride_color_echo $__pride_color_pink "➤"
      __pride_color_echo $__pride_color_white "➤"
      __pride_color_echo $__pride_color_pink "➤"
      __pride_color_echo $__pride_color_blue "➤  "
    case gay
      __pride_color_echo $__pride_color_red "➤"
      __pride_color_echo $__pride_color_orange "➤"
      __pride_color_echo $__pride_color_yellow "➤"
      __pride_color_echo $__pride_color_green "➤"
      __pride_color_echo $__pride_color_blue "➤"
      __pride_color_echo $__pride_color_purple "➤  "
  end
end
