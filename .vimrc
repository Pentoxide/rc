set undofile
set paste
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set cursorline
set colorcolumn=80
set number relativenumber
set scrolloff=8

" autocmd TabClosed * tabprevious
command Q q
nnoremap Q <nop>
nnoremap H gT
nnoremap L gt
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-f> <C-d>zz
nnoremap <C-b> <C-u>zz
nnoremap n nzz
nnoremap N Nzz
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
nnoremap <C-q> :Texplore<CR>
nnoremap <C-a> viwy:Ag <C-R>"<CR>
nnoremap <C-g> viwy:Ag def <C-R>"<CR>
vnoremap <C-a> y:Ag <C-R>"<CR>
vnoremap <C-g> y:Ag def <C-R>"<CR>
nnoremap <C-l> :LLLmPrompt 
vnoremap <C-l> :LLLmExplain Explain the code above

" Gnome terminal Alt workaround
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Colour scheme
syntax on
colorscheme molokai
hi TabLineSel ctermfg=White ctermbg=Black
hi TabLine ctermfg=Black ctermbg=Grey
hi TabLineFill ctermfg=Grey
hi Comment cterm=bold
hi OverLength ctermbg=DarkRed
hi MatchParen ctermfg=233 ctermbg=208 cterm=inverse
match OverLength /\%101v.\+/

call plug#begin()
" Edit
Plug 'tpope/vim-surround'
" Git
Plug 'tpope/vim-fugitive'
" Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
" LLMs
Plug 'pentoxide/local-llm.vim'
call plug#end()

let g:netrw_list_hide='.*\.un\~$,.*\.swp$'

" Plugin fzf
let g:fzf_action = { 'enter': 'tab split' }

" Plugin ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Plugin vim-lsp
let g:lsp_settings = {
\   'pylsp-all': {
\     'disabled': 1,
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}
" if executable('terraform-ls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'terraform-ls',
"         \ 'cmd': {server_info->['terraform-ls', 'serve']},
"         \ 'whitelist': ['terraform'],
"         \ })
" endif

" Plugin lllm
" let g:llm_model = 'qwen2.5-coder:3b'
let g:llm_model = 'qwen2.5-coder:0.5b'
