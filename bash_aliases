#!/bin/bash


## overwrites

if [ -f ~/.bash_customer ]; then
    . ~/.bash_customer
fi


## bash

alias ll='ls -l'
alias la='ls -latr'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias clean='git clean -f && git reset --hard'


## git

alias gmod='vim -p `git diff --name-only `'
alias gd='git diff'
alias gco='git ckeckout'
alias gc='git commit -v'
