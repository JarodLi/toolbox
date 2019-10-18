" execute pathogen#infect()

call plug#begin('~/.vim/bundle')
Plug 'lfv89/vim-interestingwords'
Plug 'itchyny/vim-cursorword'
Plug 'Shougo/defx.nvim'
Plug 'majutsushi/tagbar'
Plug 'tell-k/vim-autopep8'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json', { 'for': 'json'}
Plug 'matze/vim-move'
Plug 'python-mode/python-mode', { 'for': 'python'}
Plug 'heavenshell/vim-pydocstring', { 'for': 'python'}
Plug 'tmhedberg/SimpylFold'
Plug 'jnurmine/Zenburn'
Plug 'vim-scripts/UltiSnips'
Plug 'davidhalter/jedi-vim', { 'for': 'python'}
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'sjl/gundo.vim'
Plug 'dense-analysis/ale', { 'for': ['python', 'c', 'go', 'sh']}
Plug 'Yggdroot/LeaderF'
" vim-gutentags管理gtags的GTAGS\GRTAGS、GPATH等文件
Plug 'ludovicchabant/vim-gutentags'
" 管理gtags-cscope数据库，自动添加、切换
Plug 'skywind3000/gutentags_plus'
Plug 'justinmk/vim-dirvish'
"git对比，暂时注释，防止切换文件时卡死
"Plug 'mhinz/vim-signify'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'Shougo/echodoc.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'skywind3000/vim-preview'
Plug 'sillybun/vim-repl', { 'for': 'python'}
Plug 'sillybun/vim-async', { 'for': 'python'}
Plug 'sillybun/zytutil', { 'for': 'python'}
Plug 'sillybun/vim-autodoc', { 'for': 'python'}
Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'ycm-core/YouCompleteMe', { 'for': ['python', 'c', 'go', 'sh']}
Plug 'MattesGroeger/vim-bookmarks'

" vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp' "在vim中支持lsp功能的插件
Plug 'ryanolsonx/vim-lsp-python'  "vim-lsp的python配置插件

" LCN, 比vim-lsp好用
Plug 'autozimu/LanguageClient-neovim'

call plug#end()

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
"开启关闭paste模式
set pastetoggle=<leader>p

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> vim-bookmarks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> vim-interestingwords

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1


"=> rainbow_parentheses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


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

"防止出现特殊字符
"call Terminal_MetaMode(0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => move between windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <TAB>h <C-W>h
map <TAB>l <C-W>l
map <TAB>k <C-W>k
map <TAB>j <C-W>j
map <TAB>c <C-W>c
map <TAB>q <C-W>q
map <TAB>= <C-W>=
map <TAB>+ <C-W>+
map <TAB>- <C-W>-
map <TAB>< <C-W><
map <TAB>> <C-W>>
map <TAB>o <C-W>o
map <TAB>v <C-W>v
map <TAB>s <C-W>s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => style
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py,*.go,Dockerfile*,dockerfile*,*.sh,*.c 
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

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Error /\s\+$/
 "nmap <F8> :PymodeLintAuto<CR>
 
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

let g:ale_python_pylint_options = '--max-line-length=140'
let g:ale_python_flake8_options = '--max-line-length=140'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>fl :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden = 1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','__pycache__','\.git$','\.DS_Store']
"let g:NERDTreeWinSize=50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> defx
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'botright',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

map <silent> - :Defx<CR>
" Avoid the white space highting issue
autocmd FileType defx match ExtraWhitespace /^^/
" Keymap in defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> o
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  "nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

" Defx icons
let g:defx_icons_enable_syntax_highlight = 1


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
" => TagBar  --使用LeaderF替代
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "-------- general ----------
  " <CR>: 回车跳到定义位置
  " p: 跳到定义位置，但光标仍然在tagbar原位置
  " P: 打开一个预览窗口显示标签内容，如果在标签处回车跳到vim编辑页面内定义处，则预览窗口关闭
  " <C-N>: 跳到下一个标签页的顶端
  " <C-P>: 跳到上一个（或当前）标签页的顶端
  " <Space>: 底行显示标签原型
  "
  " ---------- Folds ----------
  " + 展开标签内容
  " -  折叠标签内容

" *  展开所有标签
 "= 折叠所有标签
 " o 在折叠与展开间切换，按o键，折叠标签，再按一次o，则展开标签，如此来回切换
 "
 " ---------- Misc -----------
 " s: 切换排序，一次s，则让标签按字典排序，再一次s，则按照文件内出现顺序排序
 " x: 是否展开tagbar标签栏，x展开，再一次x，则缩小标签栏
 " <F1>:
 "切换快捷键帮助页面，F1一次出现快捷键帮助页面，在一次F1，快捷键帮助页面隐藏。
 "
nmap <leader>tl :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_sort = 1 
"let Tlist_Sort_Type = "order"


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
nmap <leader>l :Leaderf
nmap <leader>bf :Leaderf! buffer<CR>
nmap <leader>lb :Leaderf! buffer<CR>
nmap <leader>lt :LeaderfBufTag!<CR>
"nmap <leader>fl :Leaderf! file<CR>
nmap <leader>lf :Leaderf! file<CR>
nmap <leader>lm :Leaderf! mru<CR>
nmap <leader>lr :Leaderf rg<CR>
"nmap <leader>lf :LeaderfFunction!<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.cache/tags')
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
"The plugin contains all you need to develop python applications in Vim.
"
"Support Python version 2.6+ and 3.2+
"Syntax highlighting
"Virtualenv support
"Run python code (<leader>r)
"Add/remove breakpoints (<leader>b)
"Improved Python indentation
"Python motions and operators (]], 3[[, ]]M, vaC, viM, daC, ciM, ...)
"Improved Python folding
"Run multiple code checkers simultaneously (:PymodeLint)
"Autofix PEP8 errors (:PymodeLintAuto)
"Search in python documentation (<leader>K)
"Code refactoring
"Intellisense code-completion
"Go to definition (<C-c>g)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'
map <leader>doc :Pydocstring<cr>
map <leader>lint :PymodeLint<cr>
map <leader>auto :PymodeLintAuto<cr>
" 禁用run功能，将<leader>r快捷键让出来
let g:pymode_run_bind = '<leader>rrrrrrrr'
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
" => vim-autopep8
""""""""""""""""""""""""""""""
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" Do not fix these errors/warnings (default: E226,E24,W6) 
let g:autopep8_ignore=""
"Fix only these errors/warnings (e.g. E4,W) 
let g:autopep8_select=""
"Maximum number of additional pep8 passes (default: 100)
let g:autopep8_pep8_passes=100
"Set maximum allowed line length (default: 79)
let g:autopep8_max_line_length=140
"Enable possibly unsafe changes (E711, E712) (default: non defined) 
"add aggressive option (--aggressive)
let g:autopep8_aggressive=1
"add more aggressive options (--aggressive --aggressive)
let g:autopep8_aggressive=2
"Number of spaces per indent level (default: 4) 
let g:autopep8_indent_size=4
"Disable show diff window
let g:autopep8_disable_show_diff=1
"Chose diff window type. (default: horizontal)
"# default
let g:autopep8_diff_type='horizontal'
let g:autopep8_diff_type='vertical'
"Automatically format every time saving a file.
let g:autopep8_on_save = 0

""""""""""""""""""""""""""""""
" => UltriSnip plugin
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""""""""""""""""""""""""""
" => gtags
""""""""""""""""""""""""""""""
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

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
	silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_file_list_command = 'find . -type f -name *.py -o -type f -name *.sh -o -type f -name *.c -type f -name *.h'

""""""""""""""""""""""""""""""
" => gutentags_plus
""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""
" => cscope
""""""""""""""""""""""""""""""
" cscope
set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope

""""""""""""""""""""""""""""""
" => vim-lsp plugin
""""""""""""""""""""""""""""""
":LspCodeAction Gets a list of possible commands that can be applied to a file so it can be fixed (quick fix)
":LspDeclaration        Go to the declaration of the word under the cursor, and open in the current window
":LspDefinition Go to the definition of the word under the cursor, and open in the current window
":LspDocumentDiagnostics        Get current document diagnostics information
":LspDocumentFormat     Format entire document
":LspDocumentRangeFormat        Format document selection
":LspDocumentSymbol     Show document symbols
":LspHover      Show hover information
":LspImplementation     Show implementation of interface in the current window
":LspNextError  jump to next error
":LspNextReference      jump to next reference to the symbol under cursor
":LspPeekDeclaration    Go to the declaration of the word under the cursor, but open in preview window
":LspPeekDefinition     Go to the definition of the word under the cursor, but open in preview window
":LspPeekImplementation Go to the implementation of an interface, but open in preview window
":LspPeekTypeDefinition Go to the type definition of the word under the cursor, but open in preview window
":LspPreviousError      jump to previous error
":LspPreviousReference  jump to previous reference to the symbol under cursor
":LspReferences Find references
":LspRename     Rename symbol
":LspStatus     Show the status of the language server
":LspTypeDefinition     Go to the type definition of the word under the cursor, and open in the current window
":LspWorkspaceSymbol    Search/Show workspace symbol

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support"
let g:lsp_highlight_references_enabled = 1
"highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

nmap ld :LspDefinition<CR>
nmap lpd :LspPeekDefinition<CR>
nmap lh :LspHover<CR>
"nmap lr :LspRename<CR> "renaming时会卡死，使用jedi的rename
nmap lc :LspReferences<CR>
nmap lf :LspDocumentRangeFormat<CR>


"""""""""""""""""""""""""""""
" => LanguageClient-neovim
""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }
" lsp不支持python的rename
"nnoremap lh :call LanguageClient#textDocument_hover()<CR>
"nnoremap ld :call LanguageClient#textDocument_definition()<CR>
"nnoremap lc :call LanguageClient#textDocument_references()<CR>
"nnoremap lf :call LanguageClient#textDocument_rangeFormatting_sync()<CR>


"""""""""""""""""""""""""""""
" => vim preview
""""""""""""""""""""""""""""""
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>


""""""""""""""""""""""""""""""
" => YCM plugin
""""""""""""""""""""""""""""""
" 指定C 头文件tags，需要使用ctags -R --output-format=e-ctags提前生成
set tags+=/usr/tags
" 关闭函数原型预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
" 关闭静态检查
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = '/root/.ycm_extra_conf.py'
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

" 设置补全白名单。 python使用jedi-vim进行补全
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
let g:jedi#usages_command = "<leader>ca"
let g:jedi#rename_command = "<leader>r"
autocmd FileType python setlocal completeopt-=preview  
let g:pymode_rope = 0  
" jedi补全pandas太慢，暂时换成YCM补全
let g:jedi#completions_enabled = 0

""""""""""""""""""""""""""""""
" => REPL plugin https://github.com/sillybun/vim-repl
""""""""""""""""""""""""""""""
nnoremap <leader>re :REPLToggle<Cr>
let g:sendtorepl_invoke_key = "<leader>w"
let g:repl_position = 0
let g:repl_program = {
                        \       'python': 'ipython',
                        \       'default': 'bash'
                        \       }
let g:repl_ipython_version = '7.7'
let g:repl_position = 3
let g:repl_python_automerge = 1
let g:repl_console_name = 'ZYTREPL'
let g:repl_auto_sends = ['class ', 'def ', 'for ', 'if ', 'while ']
let g:repl_cursor_down = 1
let g:repl_width = 75
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>

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
