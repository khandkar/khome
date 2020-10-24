set nu
set t_Co=256
syntax enable
set background=dark
colorscheme zenburn
let &colorcolumn=join(range(80,80),",")
match  ErrorMsg '\s\+$'  " Trailing whitespace
