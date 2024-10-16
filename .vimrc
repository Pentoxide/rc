set paste
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set cursorline
set colorcolumn=80
set number relativenumber
hi TabLineSel ctermfg=White ctermbg=Black
hi TabLine ctermfg=Black ctermbg=Grey
hi TabLineFill ctermfg=Grey
nnoremap H gT
nnoremap L gt
syntax on
colorscheme molokai
highlight Comment cterm=bold
highlight OverLength ctermbg=DarkRed
match OverLength /\%101v.\+/
