Plug 'tell-k/vim-autoflake', { 'for': ['python']}
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_all_unused_variables=1
let g:autoflake_disable_show_diff=1
autocmd FileType python map <buffer> <F5> :call Autoflake()<CR><CR>
