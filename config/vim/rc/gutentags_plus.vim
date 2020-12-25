 " 管理gtags-cscope数据库，自动添加、切换
 Plug 'skywind3000/gutentags_plus', { 'for': ['python', 'c', 'go', 'sh']}
 " change focus to quickfix window after search (optional).
 "let g:gutentags_plus_switch = 1
 let g:gutentags_plus_nomap = 1
 noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
 noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
 noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
 noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
 noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
 noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
 noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
 noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
 noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
 
 "0 or s: Find this symbol
 "1 or g: Find this definition
 "2 or d: Find functions called by this function
 "3 or c: Find functions calling this function
 "4 or t: Find this text string
 "6 or e: Find this egrep pattern
 "7 or f: Find this file
 "8 or i: Find files #including this file
 "9 or a: Find places where this symbol is assigned a value
