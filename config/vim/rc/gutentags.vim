" vim-gutentags管理gtags的GTAGS\GRTAGS、GPATH等文件
Plug 'ludovicchabant/vim-gutentags'


" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
" 如果你的项目不在 svn/git/hg 仓库中的话，可以在项目根目录 touch 一个空的名为  .root 的文件即可。
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.gtags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
        let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/gtags')
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

" gutentags 可以为我们自动 cs add 命令添加当前更新好的 gtags 数据库到 vim
" ，但是你编辑一个项目还好，如果你同时编辑两个以上的项目，gutentags
" 会把两个数据库都连接到 vim
" 里，于是你搜索一个符号，两个项目的结果都会同时出现，基本没法用了。
" 禁用 gutentags 自动加载 gtags 数据库的行为, 使用gutentags_plus进行管理
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_file_list_command = 'find . -type f -name *.py -o -type f -name *.sh -o -type f -name *.c -type f -name *.h'

" 允许 gutentags 打开一些高级命令和选项.  " gtags出错时使用:GutentagsToggleTrace查看日志
let g:gutentags_define_advanced_commands = 1
