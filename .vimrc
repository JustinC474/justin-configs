set nocompatible              " be improved, required
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
"
" Get this to work later
"Plugin 'ycm-core/YouCompleteMe'

"Typescript
Plugin 'leafgarland/typescript-vim'

"Syntaxt
Plugin 'prettier/vim-prettier'
Plugin 'posva/vim-vue'
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

"Old Plugins
"Plugin 'scrooloose/syntastic'
"Plugin 'groenewege/vim-less'

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

set cursorline

" Use 24bit insteand of 8bit colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

function! DarkMode()
  colorscheme molokai
  " Switch to dark mode for iTerm
  silent !osascript -e 'tell app "System Events" to keystroke "d" using {shift down, option down}'
endfunction

function! LightMode()
  colorscheme nuvola
  " Make the EOL character gray
  hi NonText ctermfg=7 guifg=gray
  " Switch to light mode for iTerm
  silent !osascript -e 'tell app "System Events" to keystroke "l" using {shift down, option down}'
endfunction

command! DarkMode call DarkMode()
command! LightMode call LightMode()

nnoremap dm :DarkMode<CR>
nnoremap lm :LightMode<CR>

if system('date +%H') > 18
    call DarkMode()
else
    call LightMode()
endif

" Set the mapleader
let mapleader = ","

" Bottom right numbers
set ruler

" Line numbers
set number

" No swp files
set noswapfile

" File tabs for JS, CSS, HTML
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" use the clipboards of vim and win
set clipboard=unnamed

" Python specific
autocmd BufReadPre,BufNewFile *.py let b:did_ftplugin = 1
autocmd Filetype python setlocal tabstop=4 shiftwidth=4

" PEP8 via Flake8
autocmd FileType python map <buffer> <Leader>o :call flake8#Flake8()<CR>

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

" quick tab
" tab backwards
map <C-]> gT
" tab forwards
map <C-\> gt

" vim-fugitive hotkeys
" Git grep for word under cursor
nnoremap gr :Ggrep <cword> *<CR>
nnoremap gp :Git push<CR>
nnoremap gc :Gcommit<CR>
nnoremap gl :Glog<CR>
nnoremap gd :Gdiff<CR>
nnoremap gs :Gstatus<CR>
" Ignore whitespace changes in git blame
nnoremap gb :Gblame -w -M<CR>

" hub browse the commit under the cursor
nnoremap  :!hub browse -- commit/<cword> *<CR>

" Ctrl P ignore
let g:ctrlp_custom_ignore = 'node_modules'

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

" Ignore files for NERDTree
let NERDTreeIgnore=['__init__.py', '__pycache__']

" Open NerdTree with Ctrl + N
map <C-n> :NERDTreeToggle<CR>
" Ignore python files
let NERDTreeIgnore=['\.egg-info$', '__init__\.py$', '__pycache__$']

" Map resize functions to <Leader> + and - / _ and =
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
