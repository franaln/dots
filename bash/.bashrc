# -*- mode: sh -*-
# .bashrc

# custom PS1
[ -z "$PS1" ] && return
PS1='\[\e[1;34m\][\u@\h]\[\e[m\] \w $ '

export HISTIGNORE="ls:ll:[bf]g:xdotool:exit:mpv:[ \t]*"

HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s checkwinsize

complete -cf sudo

# cortar directorios a 5
PROMPT_DIRTRIM=5

# load bash completion
if [ -f /usr/share/bash-completion/bash_completion ] && ! shopt -oq posix; then
    . /usr/share/bash-completion/bash_completion
fi

# default apps
export EDITOR='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
export BROWSER='chromium'

# my bins
export MYBIN=$HOME/bins

# root
# export LD_LIBRARY_PATH=/home/fran/root/root5/lib:$PYTHONDIR/lib:$LD_LIBRARY_PATH
# export PYTHONPATH=/usr/lib/root:$PYTHONPATH

# alias definitions
if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

# functions definitions
if [ -f ~/.bash_fns ] ; then
    . ~/.bash_fns
fi

# private
if [ -f ~/.bash_priv ]; then
    . ~/.bash_priv
fi

export CUPS_SERVER=localhost
export THEME="dark"
export TERM=xterm-256color # fix colors in emacs for urxvt

# Add local bin
export PATH=/usr/local/bin:~/.local/bin:$MYBIN:$PATH

# Add texlive (mac)
export PATH=:/usr/local/texlive/2023/bin/universal-darwin:$PATH


# urxvt window title
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} echo -ne '\033]0;Terminal - ${PWD}\007"

## autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# if [ -f /etc/profile.d/autojump.bash ] ; then
#     . /etc/profile.d/autojump.bash
# elif [ -f /usr/share/autojump/autojump.sh ] ; then
#     . /usr/share/autojump/autojump.sh
# fi

eval "$(/opt/homebrew/bin/brew shellenv)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/mambaforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/mamba.sh" ]; then
    . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
