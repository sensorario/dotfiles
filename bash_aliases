#!/bin/bash

if [ -f ~/.bash_customer ]; then
    . ~/.bash_customer
fi

alias ll='ls -l'
alias la='ls -latr'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias clean='git clean -f && git reset --hard'
alias todo='grep -Ri todo src --color'
