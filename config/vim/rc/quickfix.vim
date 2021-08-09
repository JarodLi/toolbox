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
