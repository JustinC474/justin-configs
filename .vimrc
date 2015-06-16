syntax on

" Awesome colors
colorscheme monokai

" Bottom right numbers
set ruler

" File tabs for JS, CSS, HTML
set autoindent
set tabstop=2
set shiftwidth=2
filetype indent on
" Hightlight tabs and spaces
set listchars=nbsp:.,eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
" Auto update with changes in currently open vim sessions
set autoread
" Turn on highlighting
set hlsearch

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Pathogen for plugin funness
execute pathogen#infect()

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
