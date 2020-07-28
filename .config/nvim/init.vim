call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ap/vim-css-color'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'

call plug#end()

set relativenumber
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
set autoindent noexpandtab tabstop=4 shiftwidth=4
colorscheme nord
