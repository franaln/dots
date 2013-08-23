# .bashrc
# frani

# custom PS1
[ -z "$PS1" ] && return
PS1='\[\e[0;32m\][\u@\h]\[\e[m\] \w $ '

export HISTIGNORE="&:ls:[bf]g:exit:[cxh]:a\ "

HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth


shopt -s histappend
shopt -s checkwinsize

# autocd
shopt -s autocd

# cortar directorios a 5
PROMPT_DIRTRIM=5

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

# alias definitions
if [ -f ~/.bash_alias ]; then . ~/.bash_alias ; fi

# functions definitions
if [ -f ~/.bash_fns ]; then . ~/.bash_fns ; fi

# vars definitions
if [ -f ~/.bash_vars ]; then . ~/.bash_vars ; fi

# private
if [ -f ~/.bash_private ]; then . ~/.bash_private ; fi

# easy navigation :)
. ~/bin/z.sh

