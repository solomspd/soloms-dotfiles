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
Plug 'dylanaraps/wal.vim'

call plug#end()

set relativenumber
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
set noet ci pi sts=0 sw=4 ts=4
colorscheme wal
