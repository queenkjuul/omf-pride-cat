# hashtag must be first character on line for line to be parsed as comment

# flags are in format 
#   flag name color1 [color2]...
# color can be hex or shell color name (red, brrblue, magenta, etc)
# default flags

flag default FF0018 FFA52C FFFF41 008018 0000F9 86007D
flag gay FF0018 FFA52C FFFF41 008018 0000F9 86007D
flag pan FF1B8D FF1B8D FFDA00 FFDA00 1BB3FF 1BB3FF
flag bi D60270 D60270 9B4F96 9B4F96 0038A8 0038A8
flag lesbian D62900 FF9B55 FFFFFF D461A6 A50062
flag lipstick A60061 B95594 D162A8 E5ADD1 C64D53 8C1801
flag trans 55CDFC F7A8B8 FFFFFF F7A8B8 55CDFC
flag nonbinary FFF430 FFFFFF 9C59D1 191919
flag sankara FCD116 009E49 EF2B2D F2F2F2 191919

# cat styles are in format
#   cat_style name 'value' ['value']...
# the quotes are important
# 
# there's no strict reason why your cat can't have multiple values,
# but you can put spaces in the quotes so idk why you would?
# but in case you do, it shouldn't break
# oh! idea! maybe you could shuffle them somehow....
# 
# default cats
cat_style default '(=^･^=)ﾉ'
cat_style slavic '(^._.^)ﾉ'

# prompt characters need a name
# sorry not sorry
# default prompt characters
prompt_char block "█"
prompt_char default "➤"

# emblem styles are the same as cat styles:
#   emblem_style name 'value' ['value']...
# the quotes are important
#
# this could be another cat for all I care
# it's just controlled by a different color variable
# and prints in a different spot
# again, no strict reason why you can't have multiple values here
# default emblems
emblem_style commie "☭"

#dingy thingy bingy

# user-added assets below this line
###################################
cat_style meh '(-__-)'

cat_style  ''

cat_style  ''

cat_style  'happy'

emblem_style percent '%'

prompt_char percent '%'
