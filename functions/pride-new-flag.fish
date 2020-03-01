# script to add custom flags to the pride-cat theme
# flags are in the format:
#   name color1 color2 ... color3
# tested with hex values, but can probably use fish builtin colors
# for example
#   pride-new-flag france 0000FF FFFFFF FF0000
# which can then be activated with the pride util like
#   pride flag france

set name $argv[1]
set colors $argv[2..-1]
set -U __pride_flags $__pride_flags $name
eval set -U __pride_flag_$name $colors