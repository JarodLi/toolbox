" 依赖async.vim
nmap <F10> :windo lcl\|ccl<CR>
"nmap <TAB><SPACE> :windo lcl\|ccl<CR>

nnoremap <TAB><SPACE> : call CloseQuickfixAndPreview()<cr>
func! CloseQuickfixAndPreview()
        exec ":windo lcl\|ccl"
        exec "pc"
endfunc

"如果有已打开文件，先复用，没有的话使用标签
"如果想将当前buffer打开为tab， :tab sb xx
"如果想将tab打开为buf， 直接关闭tab即可
set switchbuf=useopen,usetab,newtab


" 假设默认是开启的，一般不会直接开启quickfix来使用
let s:open_quickfix = 1
nnoremap <TAB><SPACE> : call Quickfix()<cr>
func! Quickfix()
        if s:open_quickfix == 1
                exec ":windo lcl\|ccl"
                exec "pc"
                let s:open_quickfix = 0
        else
                exec ":copen"
                let s:open_quickfix = 1
        endif
endfunc
