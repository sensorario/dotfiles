# my nnoremaps

Replace current word in current file

    <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

Replace current word in a whole path

    <Leader>R :!for i in `grep -Rl <C-r><C-w> src/`; do sed -i 's/<C-r><C-w>/<C-r><C-w>/g' $i; done;<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

Sort selection

    <Leader>s :sort<CR>

Run all tests

    <Leader>t :!./runtests<CR>

Open new tab

    <Leader>T :tabe<CR>

Move current file

    <Leader>m :!mv % 

Find current word starting in a directory

    <Leader>f :!grep -Rn <C-r><C-w> src/ --color -U4<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

Show files that contains current word in a directory

    <Leader>F :!grep -Rnl <C-r><C-w> src/

Ok, this is a bit complicated: this instruction move a code like this:

    $hello = $world->hello($foo->bar());

in this kind of code:

    $variable = $foo->bar();
    $hello = $world->hello($variable);

    <Leader>v 0f(vibc$variable<ESC>O$variable<SPACE>=<SPACE><ESC>pA;
