execute pathogen#infect()
syntax on
filetype plugin indent on
let mapleader = ";"
set number 
set showmatch
set encoding=utf-8
set fencs=utf-8,gb2312,gbk     " Sets the default encoding
set hlsearch
set novb  "关闭闪屏
set nocompatible
set backspace=indent,eol,start
set scrolloff=5  "在光标接近底端或顶端时,自动下滚或上滚. 
set t_Co=256 "支持256色

set guioptions-=r
set guioptions-=L
set guioptions-=b
set showtabline=0

set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> 自动定位上次的行号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> When vimrc is edited, reload it
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> color and theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
"colorscheme candy
"colorscheme molokai  
colorscheme zenburn
set guifont=Monaco:h12:b
let g:solarized_termcolors=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => use meta key : http://www.skywind.me/blog/archives/2021
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

call Terminal_MetaMode(0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => move between windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>h <C-W>h
map <leader>l <C-W>l
map <leader>k <C-W>k
map <leader>j <C-W>j
map <leader>c <C-W>c
map <leader>q <C-W>q
map <leader>= <C-W>=
map <leader>+ <C-W>+
map <leader>- <C-W>-
map <leader>< <C-W><
map <leader>> <C-W>>
map <leader>o <C-W>o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => style
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py,*.go,Dockerfile*,dockerfile*,*.sh 
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |
\ set colorcolumn=0
"\ set colorcolumn=120
"
au BufNewFile,BufRead *.yml
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Error /\s\+$/
 nmap <F8> :PymodeLintAuto<CR>
 
 """"""""""""""""""""""""""""""
" => ALE
""""""""""""""""""""""""""""""
"let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>fl :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden = 1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','__pycache__','\.git$','\.DS_Store']
"let g:NERDTreeWinSize=50

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
map <leader>bf :BufExplorer<cr>
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开/关闭缩进线
nmap <leader>i :IndentLinesToggle<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tl :TagbarToggle<CR>
let g:tagbar_left=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
" gtags使用： https://www.v2ex.com/t/561549
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
"noremap <c-n> :LeaderfMru<cr>
"noremap <m-p> :LeaderfFunction!<cr>
"noremap <m-n> :LeaderfBuffer<cr>
"noremap <m-m> :LeaderfTag<cr>
nmap <leader>lb :LeaderfBuffer<CR>
nmap <leader>lt :LeaderfBufTag!<CR>
nmap <leader>lf :LeaderfFunction!<CR>
nmap <leader>lm :LeaderfMru<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_GtagsAutoGenerate = 1 " 打开第1个工程文件时自动生成gtags

""""""""""""""""""""""""""""""
" => gundo plugin
""""""""""""""""""""""""""""""
let g:gundo_prefer_python3 = 1
nnoremap <leader>u :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show statusline
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-move
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:move_key_modifier = 'C'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cs"'            # 替换 ==> "Hello world!" -> 'Hello world!'
" cst"            # 替换-标签(t=tag)  ==> <a>abc</a>a>  -> "abc"
" cst<html>       # 替换标签 ==> <a>abc</a>a>  -> <html>abc</html>html>
" ds"             # 删除  ==> "Hello world!" -> Hello world!
" ysiw"           # 添加(ys=you surround) ==> Hello -> "Hello"
" csw"            # 添加  ==> Hello -> "Hello"
" veeS"           # 添加-两个词   ==> hello world -> "hello world"
" ys$"            # 添加-当前到行尾:
" yss"            # 添加-整行 ==> Hello world -> "Hello world"
" ySS"
" Hello world ->
" "
"    hello world
" "
"# 左符号/右符号 => 带不带空格
" cs([
" (hello) -> [ hello  ]
" 
" cs(]
" (hello) -> [hello])
" ])
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python with virtualenv support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
  "project_base_dir = os.environ['VIRTUAL_ENV']
  "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  "execfile(activate_this, dict(__file__=activate_this))
"EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python-mode
" https://github.com/python-mode/python-mode/blob/develop/doc/pymode.txt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>doc :Pydocstring<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python-mode
" https://github.com/python-mode/python-mode/blob/develop/doc/pymode.txt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'
map <leader>lint :PymodeLint<cr>
map <leader>auto :PymodeLintAuto<cr>
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_indent = 1
let g:pymode_folding = 0
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all

""""""""""""""""""""""""""""""
" => UltriSnip plugin
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""""""""""""""""""""""""""
" => vim-gutentags
""""""""""""""""""""""""""""""
 " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
        let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
        ¦  silent! call mkdir(s:vim_tags, 'p')
   endif"

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

""""""""""""""""""""""""""""""
" => YCM plugin
""""""""""""""""""""""""""""""
" 指定C 头文件tags，需要使用ctags -R --output-format=e-ctags提前生成
set tags+=~/.cache/tags/usr-include.tags
" 关闭函数原型预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
" 关闭静态检查
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf=0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_auto_trigger = 1
"noremap <c-z> <NOP>

"let g:ycm_semantic_triggers =  {
  "\   'c': ['->', '.'],
  "\   'cpp,cuda,objcpp': ['->', '.', '::'],
  "\   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'], }

let g:ycm_semantic_triggers =  {
                        \ 'c': ['->', '.'],
                        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                        \ 'cs,lua,javascript': ['re!\w{2}'],  
                        \ }

" 设置补全白名单
let g:ycm_filetype_whitelist = { 
                        \ "c":1,
                        \ "cpp":1, 
                        \ "objc":1,
                        \ "sh":1,
                        \ "zsh":1,
                        \ "python":1,
                        \ "go":1,
                        \ }


""""""""""""""""""""""""""""""
" => jedi-vim plugin
""""""""""""""""""""""""""""""
let g:jedi#completions_command = "<C-N>"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>e"
autocmd FileType python setlocal completeopt-=preview  
let g:pymode_rope = 0  

""""""""""""""""""""""""""""""
" => vim-go plugin
""""""""""""""""""""""""""""""
"let g:go_disable_autoinstall = 0
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1

""""""""""""""""""""""""""""""
" => gotags plugin
""""""""""""""""""""""""""""""
"let g:tagbar_type_go = {
"		\ 'ctagstype' : 'go',
"		\ 'kinds'     : [
"			\ 'p:package',
"			\ 'i:imports:1',
"			\ 'c:constants',
"			\ 'v:variables',
"			\ 't:types',
"			\ 'n:interfaces',
"			\ 'w:fields',
"			\ 'e:embedded',
"			\ 'm:methods',
"			\ 'r:constructor',
"			\ 'f:functions' ],
"		\ 'sro' : '.',
"		\ 'kind2scope' : {
"			\ 't' : 'ctype',
"			\ 'n' : 'ntype' },
"			\ 'scope2kind' : {
"			\ 'ctype' : 't',
"			\ 'ntype' : 'n' },
"		\ 'ctagsbin'  : 'gotags',
"		\ 'ctagsargs' : '-sort -silent' }


""""""""""""""""""""""""""""""
" => gopls plugin
""""""""""""""""""""""""""""""
"let g:go_def_mode='gopls'

" autocmd BufWritePre *.go :Fmt
