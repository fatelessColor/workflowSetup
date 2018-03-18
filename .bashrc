# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

set -o vi
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




#CUSTOM SETTINGS
#ALIASES:
alias wttr='curl wttr.in/berlin'

alias spaghetti='echo "Yo His palms are sweaty, knees weak, arms are heavy 
There s vomit on his sweater already, mom s spaghetti
He s nervous, but on the surface he looks calm and ready
To drop bombs, but he keeps on forgettin
What he wrote down, the whole crowd goes so loud
He opens his mouth, but the words wont come out
Hes chokin, how, everybodys jokin now
The clocks run out, times up, over, blaow!
Snap back to reality, oh there goes gravity
Oh, there goes Rabbit, he choked
Hes so mad, but he wont give up that easy? No
He wont have it, he knows his whole back citys ropes
It dont matter, hes dope, he knows that, but hes broke
Hes so stacked that he knows, when he goes back to his mobile home, thats when its
Back to the lab again yo, this whole rhapsody
He better go capture this moment and hope it dont pass him1

You better lose yourself in the music, the moment
You own it, you better never let it go
You only get one shot, do not miss your chance to blow
This opportunity comes once in a lifetime you better"'

alias visred='vis -c ~/.config//vis/redcfg'
alias say='toilet --font mono12'
alias clock='tty-clock -B -c'
alias starwars='telnet towel.blinkenlights.nl'
alias schedule='w3m -M ~/_HU/stundenplan3.html'
alias leonid='echo Leonid-san!!'
alias osusongs='nautilus ~/Wine\ Prefixes/osu!/drive_c/users/cubey/Local\ Settings/Application\ Data/osu!/Songs'
alias osu='./.osu.sh'
alias nyancat='cat ~/.config/customscripts/animations/nyancat | ruby -'
alias pacman='cat ~/.config/customscripts/animations/pacman | ruby -'
alias pacmanbig='cat ~/.config/customscripts/animations/pacmanbig | ruby -'
alias dota='echo salt '
alias dota2='echo more salt'
alias darksouls='echo you diededed'
alias wall='exec ~/.config/screenlayout/wallpaper.sh'
alias rwall='exec ~/.config/screenlayout/randomwall.sh'
alias ww='wall 0'
alias minecraft='java -jar ~/Games/.minecraft/minecraft.jar'
alias split='urxvt & disown'
alias fortunerepeat='exec ~/.config/customscripts/randomquote.sh'
alias anifetch='neofetch --image ~/Pictures/wallpaper/anime/ --size 400 --crop_mode fill'
alias muffetfetch='neofetch --image ~/Pictures/wallpaper/muffet/ --size 400 --crop_mode fill'
alias neofetch='neofetch --image ~/Pictures/wallpaper/debian.png --size 400 --crop_offset center'
alias evilfetch='neofetch --image ~/Pictures/wallpaper/logo/ --size 400 --crop_offset center'
