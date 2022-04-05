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

# Use like: $ ismac && echo "THIS IS A MAC" || echo "THIS IS A LINUX"
ismac() {
    if [ $(uname) == "Darwin" ]
    then
        return 0
    else
        return 1
    fi
}
export -f ismac

if [ $(uname) == "Darwin" ]
then
    shred() {
       gshred "$@"
    }
    export -f shred
fi

if [ $(uname) == "Darwin" ]
then
    LS="gls --color"  # install with brew install coreutils
    alias ls="$LS"
else
    LS="ls --color=auto"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls="$LS"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll="$LS -alF"
alias la="$LS -A"
alias l="$LS" #added by Naftali on 2/20/11
alias lrt="$LS -lrt | tail -n"

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
if [ $(uname) == "Darwin" ]
then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
    fi
else
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi
fi

alias quit='exit'
alias oo='openoffice.org >& /dev/null'
alias mkae='make'
alias clare='clear'
alias clera='clear'
alias claer='clear'
alias clar='clear'
alias okular='okular >& /dev/null'
alias lynx='lynx -accept-all-cookies'
alias phyton='python'
alias pyton='python'
alias pyhton='python'
alias pyton='python'
alias pytohn='python'
alias acroread='acroread >& /dev/null'
alias eom='eom >& /dev/null'
alias iv='vim -O'
alias vi='vim -O'
alias vs='vim -O'
#alias ipython='ipython --pylab'
alias findf='find . -type f | xargs grep --color'
alias libreoffice='libreoffice4.1'
alias ctags='/usr/bin/ctags'  # There's also one in /usr/local/bin/ctags, which is some kind of old version
alias cutc='cut -d ","'
alias gdb='gdb --quiet'
export EDITOR='vim'

PS1="\`if [ \$? = 0 ]; then echo \[\e[32\;1m\]\u@\h:\w\\$ \[\e[0m\]; else echo \[\e[31\;1m\]\u@\h:\w\\$ \[\e[0m\]; fi\`"

set -o vi

#echo "O Naftali, Almightly Lord of the terminal, by Your Grace bestow Your Greatness upon Your lowly, humble, and undeserving servant, $HOSTNAME." 1>&2

# Sets the Mail Environment Variable
MAIL=/var/spool/mail/naftali && export MAIL

# Add ~/bin to PATH
export PATH=$HOME/bin:$PATH

# Add cabal to PATH
export PATH=$HOME/.cabal/bin:$PATH

# Add julia to PATH
export PATH=$HOME/repos/julia:$PATH

# Add go to PATH
export GOPATH=$HOME/go

# Add arc to PATH
export PATH=$PATH:$HOME/repos/arcanist/bin/

export TERM=xterm  # So that when vim closes, you don't see crap everywhere above in iterm2. Also, go to prefs->profiles->terminal and uncheck "Save lines to scrollback in alternate screen mode"
