noremap <silent><A-1> :tabn 1<cr>
noremap <silent><A-2> :tabn 2<cr>
noremap <silent><A-3> :tabn 3<cr>
noremap <silent><A-4> :tabn 4<cr>
noremap <silent><A-5> :tabn 5<cr>
noremap <silent><A-6> :tabn 6<cr>
noremap <silent><A-7> :tabn 7<cr>
noremap <silent><A-8> :tabn 8<cr>
noremap <silent><A-9> :tabn 9<cr>
noremap <silent><A-m> :tabnew<cr>
noremap <silent><A-l> :tabnext<cr>
noremap <silent><A-h> :tabprevious<cr>
noremap <silent><A-w> :tabclose<cr>
noremap <silent><A-o> :tabonly<cr>

" Open Explore in new tab with current directory
function! Open_Explore(where)
    let l:path = expand("%:p:h")
    if l:path == ''
        let l:path = getcwd()
    endif
    if a:where == 0
        exec 'Explore '.fnameescape(l:path)
    elseif a:where == 1
        exec 'vnew'
        exec 'Explore '.fnameescape(l:path)
        exec 'set modifiable'
    else
        exec 'tabnew'
        exec 'Explore '.fnameescape(l:path)
    endif
    exec 'set modifiable'
endfunc
nnoremap <C-A-o> :call Open_Explore(2)<cr>

"function! Switch_buff_to_tab()
    "let current_buff = bufnr("%")
    "echo current_buff
    "exec 'tab sb '.(current_buff)
"endfunc
"nnoremap <A-m> :call Switch_buff_to_tab()<cr>

" 将buf转成tab
nmap <leader>tb :tab sb
