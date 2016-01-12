set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"General
"Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'bling/vim-airline'
"Plugin 'rking/ag.vim'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-surround'
"Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'majutsushi/tagbar'
"Plugin 'scrooloose/nerdtree'
"Plugin 'lilydjwg/colorizer'

"Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'eapache/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'vim-scripts/paredit.vim'

"Old Plugins
Plugin 'scrooloose/syntastic'
Plugin 'groenewege/vim-less'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

" Awesome colors
colorscheme monokai

" Set the mapleader
let mapleader = ","

" Bottom right numbers
set ruler

" No swp files
set noswapfile

" File tabs for JS, CSS, HTML
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2

" use the clipboards of vim and win
set clipboard+=unnamed

" Python specific
autocmd BufReadPre,BufNewFile *.py let b:did_ftplugin = 1
autocmd Filetype python setlocal tabstop=4 shiftwidth=4

" Hightlight tabs and spaces
set listchars=nbsp:.,eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
" Auto update with changes in currently open vim sessions
set autoread
" Turn on highlighting
set hlsearch

" Turn on backspacing
set backspace=2

" CircleCI only - set tabs to be spaces
autocmd BufRead,BufNewFile $CIRCLE_DIR/* setlocal expandtab

" Clojure fuzzy indenting
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

vmap <Leader>t <Plug>(EasyAlign)

function! s:SortSCSS() range
  exec a:firstline . ',' . a:lastline . 'sort'
  exec a:firstline . ',' . a:lastline . 'EasyAlign :'
endfunction

command! -range SortSCSS <line1>,<line2>call s:SortSCSS()

vmap <Leader>socd :SortSCSS<cr>
