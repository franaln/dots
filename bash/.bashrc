# -*- mode: sh -*-
# .bashrc

# custom PS1
[ -z "$PS1" ] && return
PS1='\[\e[1;34m\][\u@\h]\[\e[m\] \w $ '

export HISTIGNORE="&:ls:ll:[bf]g:exit:[cxh]:a\ "

HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s checkwinsize

complete -cf sudo

# cortar directorios a 5
PROMPT_DIRTRIM=5

# colours
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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
export LD_LIBRARY_PATH=/usr/lib/root:$PYTHONDIR/lib:$LD_LIBRARY_PATH

# alias definitions
if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

# functions definitions
if [ -f ~/.bash_fns ] ; then
    . ~/.bash_fns
fi

export PATH=~/.local/bin:$PATH
alias load_root='source ~/root/root/build/bin/thisroot.sh'
