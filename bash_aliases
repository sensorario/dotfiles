#!/bin/bash

if [ -f ~/.bash_customer ]; then
    . ~/.bash_customer
fi

# moving between folders
alias home='cd'
alias ll='ls -l'
alias la='ls -latr'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias clean='git clean -f && git reset --hard'
alias todo='grep -Ri todo src --color'

# vim
alias vmod='vim -p `git diff --name-only `'

# git
alias ga='git add .'
alias gap='git add -p'
alias gc='git commit -v'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gbm='git branch -m'
alias gr='git reset --hard'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
