# Pride Cat

a highly customizable fish shell theme featuring cats and pride flags

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

This can be installed without Oh My Fish, you'll need to run `fish hooks/install.fish` first, then copy the function files to where they belong. 

### Configuration

pride-cat includes a configuration utility to easily tweak its appearance, located in `functions/pride.fish`

If you have the pride.fish file installed in `~/.config/fish/functions` (which it should be if you installed using oh-my-fish) then you can call the config script by simply invoking `pride`

`pride` follows the syntax `pride command value`

flag

```
pride flag default                 # default is trans. 
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

Custom flags can be added. See the [Custom Flags](#custom-flags) documentation below. 

prompt

    pride prompt block                 # sets █
                                       # default  ➤
                                       # soviet flag overrides prompt setting

dirty commie

                                       
    pride commie off                   # default is on
                                       # turns off the hammer and sickle icon. 

username

    pride username off                 # default is on

hostname

    pride hostname off                 # default is on 
                                       # only displays if username is on

fish bind mode

    pride bind mode on                 # default is off

cat status

    pride cat_status on                # show always, default
    pride cat_status off               # show never
    pride cat_status git               # only in git repos
                                       # like og slavic-cat

cat icon

    pride cat_style slavic             # (^._.^)ﾉ
    pride cat_style default            # (=^･^=)ﾉ

reset config

    pride reset                        # sets all above options to defaults

Reset all theme variables to defaults

    pride_reset_defaults

## Custom Flags

Custom flags can be easily added to pride-cat, assuming they follow the same simple design (just stripes)

New flag definitions follow a very simple format:

    name color1 color2 color3 ... colorN

Color values can be shell values (red, brred, blue, magenta, etc) or they can be hex values (FF0000). To add a flag to your local pride config, run

    pride add_flag name color1 color2 ... colorN

and then you switch to it using the normal 

    pride flag name

for example, to make a French flag prompt, we would run:

```
pride add_flag france 0000FF FFFFFF FF0000
pride flag france
```
Flag definitions are set as universal variables with the convention `__pride_flag_$name`, so you can see them in `set -U`. Use `set -e __pride_flag_$name` to remove. Flag names must also be present in the `$__pride_flags` list in order to function (which the `pride add_flag` command does of course, but in case of exceptions)

## Features

 * gaaaaayyyyyy
 * Current short version pwd
 * Display branch for Git projects
 * Git project dirty status indicator *meow* **(R,C,A,U,M,?)** *meow*
 * Fish shell vi mode indicator
 * Next line prompt
 * Two unicodes included!

## TODO

 * enable custom prompt characters besides just arrow and block
 * enable custom "cat" icons to allow for custom emoticons or emojis
 * allow customization of the "commie" character as well
 * allow customization of the prompt layout using `pride`


## Credits

[forked from Slavic Cat](https://github.com/yangwao/omf-theme-slavic-cat) which was in turn [forked from Toaster](https://github.com/oh-my-fish/theme-toaster)