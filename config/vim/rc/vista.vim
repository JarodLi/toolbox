Plug 'liuchengxu/vista.vim'

"nmap 1 :Vista!!<CR>
nmap <A-`> :Vista!!<CR>
let g:vista_sidebar_position = 'vertical topleft'
autocmd FileType vista nnoremap <buffer> q :call vista#sidebar#Close()<CR>
let g:vista#renderer#enable_icon = 0
let g:vista_fold_toggle_icons = ['▼', '▶']
let g:vista_default_executive = 'ctags'
let g:vista_sidebar_width = 50
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
