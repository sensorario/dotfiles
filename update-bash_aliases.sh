#!/bin/bash
echo ""
echo "Overriding bash aliases"

cp -f $PWD/bash_aliases ~/.bash_aliases
cp -f $PWD/git-completion.bash ~/.git-completion.bash

source ~/.bash_aliases
