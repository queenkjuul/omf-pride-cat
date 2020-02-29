# Pride Cat

a customizable fish shell theme featuring cats and LGBT pride flags

[![Oh My Fish](https://img.shields.io/badge/Framework-Oh_My_Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](/LICENSE)


![Pride Cat in action](screenshot.png)

## Installation

#### Requirements
* [Fish shell](https://github.com/fish-shell/fish-shell) - a smart and user-friendly command line
shell for OS X, Linux, and the rest of the family
* [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish) - The Fish shell Framework

Once Oh My Fish is installed:

    omf install https://github.com/queenkjuul/omf-pride-cat

### Options

flag

```
set -U __pride_flag gay            # default is trans. 
                                   # current options: 
                                   # trans
                                   # nonbinary
                                   # gay
                                   # bi
                                   # pan
                                   # lesbian
                                   # lipstick
                                   # soviet
                                   # sankara
```

prompt

    set -U __pride_prompt block        # sets █
                                       # default  ➤
                                       # soviet flag overrides prompt setting

dirty commie

                                       
    set -U __pride_commie off          # default is on
                                       # turns off the hammer and sickle icon. 

username

    set -U __pride_username off        # default is on

hostname

    set -U __pride_hostname off        # default is on 
                                       # only displays if username is on

fish bind mode

    set -U __pride_bind_mode on        # default is off

cat

    set -U __pride_cat_status on       # show always, default
    set -U __pride_cat_status off      # show never
    set -U __pride_cat_status git      # only in git
                                       # like og slavic-cat

which cat

    set -U __pride_cat slavic          # (^._.^)ﾉ
    set -U __pride_cat default         # (=^･^=)ﾉ

### Functions

Reset all theme variables to defaults

    pride_reset_defaults
    
[forked from Slavic Cat](https://github.com/yangwao/omf-theme-slavic-cat) which was in turn [forked from Toaster](https://github.com/oh-my-fish/theme-toaster)

## Features

 * gaaaaayyyyyy
 * Current short version pwd
 * Display branch for Git projects
 * Git project dirty status indicator *meow* **(R,C,A,U,M,?)** *meow*
 * Fish shell vi mode indicator
 * Next line prompt
 * Two unicodes included!
