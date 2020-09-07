"call plug#begin('~/.vim/bundle')

Plug 'liuchengxu/vista.vim'
"call plug#end()



nmap 1 :Vista!!<CR>
let g:vista_sidebar_position = 'vertical topleft'
autocmd FileType vista nnoremap <buffer> q :call vista#sidebar#Close()<CR>
let g:vista#renderer#enable_icon = 0
let g:vista_fold_toggle_icons = ['+', '+']
