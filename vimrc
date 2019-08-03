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
""始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
""在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>a :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
nmap <Leader>a :ALEDetail<CR>
" Check Python files with flake8 and pylint.
"let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
"let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

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
" => Vim-move
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
" => YCM plugin
""""""""""""""""""""""""""""""
" 避免和snipmate tab冲突
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
set tags+=./tags,/usr/include/tags,/usr/local/go/src/tags,/usr/lib/python3.7/tags
let g:ycm_seed_identifiers_with_syntax=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion = '<C-a>'
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'], }
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :
"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" :
"\<PageUp>"
set shortmess+=c

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
