" Load Pathogen and plugins.
execute pathogen#infect()

" Colorscheme settings.
syntax on
set background=dark
colorscheme gruvbox

" Text editor settings.
set expandtab
set shiftwidth=4
set softtabstop=4
set cinoptions+=t0
set smartindent
let g:load_doxygen_syntax=1
set mouse=a
set backspace=indent,eol,start

" Leader key and tab switch mapping.
let mapleader="\<Space>"
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader>l :tabn<CR>

" Tmux compatibility settings.
set t_ut=
