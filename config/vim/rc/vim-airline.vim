Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
"set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

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


let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#show_tab_nr = 0

let g:airline#extensions#ale#enabled = 0

let g:airline#extensions#vista#enabled = 0

let g:airline_section_c_only_filename = 1
let g:airline_stl_path_style = 'short'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#searchcount#enabled=0
let g:tmuxline_preset = {
\'a'       : '#S',
\'b'       : '',
\'c'       : '',
\'win'     : '#W',
\'cwin'    : '#W',
\'x'       : '%a',
\'y'       : '%R',
\'z'       : '',
\'options' : {'status-justify' : 'left'}}
