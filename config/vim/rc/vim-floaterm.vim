Plug 'voldikss/vim-floaterm'
Plug 'voldikss/LeaderF-floaterm'

let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_toggle = '<F12>'

let g:floaterm_wintype = 'float'
let g:floaterm_position = 'bottomright'
let g:floaterm_width=0.5


nmap <leader>lft :Leaderf! floaterm --nowrap<CR>
