#!/bin/bash
echo ""
echo "Overriding snippets"

rm -rf ~/.vim/snippets
cp -Rf $PWD/snippets ~/.vim/snippets
