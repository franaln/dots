# -*- mode: sh -*-
# .bashrc

# custom PS1
[ -z "$PS1" ] && return
PS1='\[\e[1;34m\][\u@\h]\[\e[m\] \w $ '

export HISTIGNORE="&:ls:ll:[bf]g:exit:mpv:[cxh]:a\ :[ \t]*"

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
export EDITOR='emacs -nw'
export BROWSER='chromium'

# my bins
export MYBIN=$HOME/bin

# SVN@CERN
export SVNPHYS='svn+ssh://svn.cern.ch/reps/atlasphys'
export SVNUNLP='svn+ssh://svn.cern.ch/reps/UNLP'

# root
# export LD_LIBRARY_PATH=/home/fran/root/root5/lib:$PYTHONDIR/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/usr/lib/root:$PYTHONPATH

# alias definitions
if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

# functions definitions
if [ -f ~/.bash_fns ] ; then
    . ~/.bash_fns
fi

# autojump
. /etc/profile.d/autojump.bash

export CUPS_SERVER=localhost
export THEME="dark"
