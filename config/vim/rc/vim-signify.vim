Plug 'mhinz/vim-signify'
nmap <leader>gd :SignifyDiff<CR>
"nmap <leader>ge :SignifyEnable<CR>

let s:signify_enable = 1
nnoremap <leader>ge : call SignifyEnable()<cr>
func! SignifyEnable()
        if s:signify_enable == 1
                exec "SignifyDisable"
                let s:signify_enable=0
        else
                exec "SignifyEnable"
                let s:signify_enable=1
        endif
endfunc
