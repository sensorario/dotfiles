#!/bin/bash
echo ""
echo "Overriding bash aliases"

cp -f $PWD/bash_aliases ~/.bash_aliases
cp -f $PWD/bash_profile ~/.bash_profile
cp -f $PWD/git-completion.bash ~/.git-completion.bash

source ~/.bash_aliases
source ~/.bash_profile
