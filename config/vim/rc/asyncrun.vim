Plug 'skywind3000/asyncrun.vim'
""""""""""""""""""""""""""""""
" => asyncrun --异步执行python&C https://github.com/skywind3000/asyncrun.vim
""""""""""""""""""""""""""""""
nnoremap <F5> :call CompileRunGcc()<cr>

func! CompileRunGcc()
        exec "w"
        if &filetype == 'python'
                if search("@profile")
                        exec "AsyncRun kernprof -l -v %"
                        exec "copen"
                        exec "wincmd p"
                elseif search("set_trace()")
                        exec "!python3 %"
                else
                        exec "AsyncRun -raw python3 %"
                        exec "copen"
                        exec "wincmd p"
                endif
        elseif &filetype == 'c'
                exec "AsyncRun gcc % -o %< && ./%<"
                exec "copen"
                exec "wincmd p"
        endif

endfunc

