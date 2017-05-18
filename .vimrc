set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"File search
Plugin 'kien/ctrlp.vim'
Plugin 'burke/matcher'

"General
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'bling/vim-airline'
"Plugin 'rking/ag.vim'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-surround'
"Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'majutsushi/tagbar'
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

"Markdown
Plugin 'gabrielelana/vim-markdown'

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
colorscheme harlequin

" Set the mapleader
let mapleader = ","

" Bottom right numbers
set ruler

" Line numbers
set number
set relativenumber

" No swp files
set noswapfile

" File tabs for JS, CSS, HTML
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" use the clipboards of vim and win
set clipboard+=unnamed

" Python specific
autocmd BufReadPre,BufNewFile *.py let b:did_ftplugin = 1
autocmd Filetype python setlocal tabstop=4 shiftwidth=4

" Rainbow Parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Hightlight tabs and spaces
set listchars=nbsp:.,eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Auto update with changes in currently open vim sessions
set autoread

" Turn on highlighting
set hlsearch

" Turn on backspacing
set backspace=2

set wildmenu " visual autocomplete for command menu

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

" Auto open the quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow

" vim-fugitive hotkeys
" Git grep for word under cursor
nnoremap gr :Ggrep <cword> *<CR>
nnoremap gp :Git push<CR>
nnoremap gc :Gcommit<CR>
nnoremap gl :Glog<CR>
nnoremap gd :Gdiff<CR>
nnoremap gs :Gstatus<CR>
nnoremap gb :Gblame<CR>

"The Silver Searcher
if executable('ag')
  "Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  "Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable('matcher')
  let g:ctrlp_match_func = { 'match': 'GoodMatch' }

  function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

    " Create a cache file if not yet exists
    let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
    if !( filereadable(cachefile) && a:items == readfile(cachefile) )
      call writefile(a:items, cachefile)
    endif
    if !filereadable(cachefile)
      return []
    endif

    " a:mmode is currently ignored. In the future, we should probably do
    " something about that. the matcher behaves like "full-line".
    let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
    if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
      let cmd = cmd.'--no-dotfiles '
    endif
    let cmd = cmd.a:str

    return split(system(cmd), "\n")

  endfunction
end

" Open NerdTree with Ctrl + N
map <C-n> :NERDTreeToggle<CR>

" Map resize functions to <Leader> + and - / _ and =
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
