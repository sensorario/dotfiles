#!/bin/bash
# @todo add colors
echo ""
echo "Overriding snippets"
rm -rf ~/.vim/snippets
cp -Rf $PWD/snippets ~/.vim/snippets
