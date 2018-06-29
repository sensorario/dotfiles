#!/bin/bash
# @todo add colors
echo ""
echo "Overriding colorscheme"

cp -rf $PWD/vim/colors ~/.vim/colors

rm -rf Despacio && git clone https://github.com/AlessandroYorba/Despacio.git && cd Despacio/colors/ && mv despacio.vim ~/.vim/colors/ && cd - && rm -rf Despacio
