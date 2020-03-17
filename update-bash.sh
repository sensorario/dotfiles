#!/bin/bash
echo ""
echo "Overriding bash aliases"

cp -f $PWD/bash_aliases ~/.bash_aliases
cp -f $PWD/zshrc ~/.zshrc

source ~/.bash_aliases
source ~/.bash_profile
