Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
"set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"* enable/disable displaying buffers with a single tab. (c) >
let g:airline#extensions#tabline#show_buffers = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_symbols.linenr=' l:'
let g:airline_symbols.colnr=''
let g:airline_symbols.whitespace=' '


let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 0
