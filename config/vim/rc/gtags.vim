
"只写 C/C++/Java 的话，gtags 原生支持。如想要更多语言，那么 gtags 是支持使用 ctags/universal-ctags 或者 pygments 来作为分析前端支持 50+ 种语言。
"使用 ctags/universal-ctags "作为前端只能生成定义索引不能生成引用索引，因此使用pygments
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope
