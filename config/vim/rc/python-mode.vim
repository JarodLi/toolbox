Plug 'python-mode/python-mode', { 'for': 'python'}
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
"map <leader>lint :PymodeLint<cr>
"map <leader>auto :PymodeLintAuto<cr>
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
