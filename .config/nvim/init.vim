if exists('g:vscode')
	" copy from nvim clipboard to WM/DE
	set clipboard+=unnamedplus
else
	call plug#begin('~/.vim/plugged')

	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-fugitive'
	" Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	" Plug 'ap/vim-css-color'
	" Plug 'flazz/vim-colorschemes'
	" Plug 'rafi/awesome-vim-colorschemes'
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'mbbill/undotree'
	" Plug 'justinmk/vim-sneak'
	" Plug 'unblevable/quick-scope'
	Plug 'dylanaraps/wal.vim'
	Plug 'lervag/vimtex'
	Plug 'airblade/vim-gitgutter'
	" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	" Plug 'junegunn/fzf.vim'
	" Plug 'chrisbra/csv.vim'
	" Plug 'mcchrish/nnn.vim'
	" Plug 'yggdroot/indentline'
	Plug 'Chiel92/vim-autoformat'
	Plug 'ryanoasis/vim-devicons'
	Plug 'stevearc/vim-arduino'
	Plug 'rust-lang/rust.vim'
	Plug 'github/copilot.vim'

	call plug#end()

	let g:airline_theme='luna'
	let g:airline_powerline_fonts = 1

	colorscheme wal

	" tabs > spaces
	set autoindent
	set tabstop=4
	set shiftwidth=4

	nmap <silent> <c-k> :wincmd k<CR>
	nmap <silent> <c-j> :wincmd j<CR>
	nmap <silent> <c-h> :wincmd h<CR>
	nmap <silent> <c-l> :wincmd l<CR>

	" because vim doesnt like python tab indentation for some reason
	let g:tex_flavor = 'latex'
	let g:vimtex_view_method = 'zathura'

	let g:sneak#label = 1

	" enable built in debugger
	packadd termdebug

	" Autoformatting
	" au BufWrite * :Autoformat
	let g:formatter_yapf_style = '{use_tabs: true, column_limit: 110}'

	" no conceal
	let g:vimtex_syntax_conceal_default = 0
	let g:vim_json_syntax_conceal = 0

	" copy from nvim clipboard to WM/DE
	set clipboard+=unnamedplus

	set mouse=a

	" fancy hybrid number line
	set number relativenumber

	" auto open nerdtree
	autocmd VimEnter * NERDTree | wincmd p
	" close nerdtree with last window
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
	    \ quit | endif
end

