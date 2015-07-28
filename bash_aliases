#!/bin/bash

alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -la"

if [ -f ~/.bash_customer ]; then
    . ~/.bash_customer
fi
