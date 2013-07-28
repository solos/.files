# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ] && [ -f ~/.dircolors/dircolors.256dark ]; then
    eval `dircolors ~/.dircolors/dircolors.256dark`
fi

# vi mode
set -o vi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

FCEDIT=/usr/bin/vim

# fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx

export PYTHON_EGG_CACHE=/var/tmp/egg

export PATH=/usr/bin/:${PATH}
export PATH=/usr/sbin/:${PATH}
export PATH=/usr/local/python/bin:${PATH}
export PATH=/usr/local/python/lib/python2.7/site-packages:${PATH}
export PATH=/usr/bin/java:${PATH}
export PATH=/sbin:${PATH}
export PATH=/usr/local/bin:${PATH}
export PATH=/usr/local/mysql/bin:${PATH}
export PATH=/usr/local/snmp/bin:${PATH}
export PATH=/usr/local/snmp/include:${PATH}
export PATH=/usr/local/snmp/sbin:${PATH}
export PATH=/usr/local/nodejs/bin:${PATH}
export PATH=/usr/local/snappy/:${PATH}
export PATH=/usr/local/gearman/bin/:${PATH}
export PATH=/usr/local/mongodb/bin/:${PATH}
export PATH=/usr/local/fcitx/bin/:${PATH}
export PATH=/opt/texlive/2012/bin/x86_64-linux:${PATH}
export PATH=/usr/local/lib/:${PATH}

export GOROOT=/home/solos/dev/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/usr/local/


if [ -f ~/.xmodmap ]; then
    xmodmap ~/.xmodmap
fi

if [ -f ~/.autojump/etc/profile.d/autojump.sh ]; then
    [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
fi

function _update_ps1() {
   export PS1="$(~/.powerline-shell.py $?)"
}
export PROMPT_COMMAND="_update_ps1"
export LC_ALL="zh_CN.utf8"
export LANG="zh_CN.utf8"
