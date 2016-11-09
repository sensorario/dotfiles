#!/bin/bash

if [ -f ~/.bash_customer ]; then
    . ~/.bash_customer
fi

alias ll='ls -l'
alias la='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
