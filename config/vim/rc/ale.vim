Plug 'dense-analysis/ale', { 'for': ['python', 'c', 'cpp', 'go', 'sh', 'java', 'cpp']}

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 20
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
    \ 'python': ['flake8', 'pylint', 'pyright'],
    \ 'sh': ['language_server'],
    \ 'xml': ['xmllint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang'],

    \ }
"ALE can fix files with the ALEFix command.
let g:ale_fixers = {
            \  '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['yapf', 'autopep8',  'autoimport', 'isort', 'black', 'add_blank_lines_for_python_control_statements'],
            \ 'java': ['google_java_format'],
            \ 'sh': ['shfmt'],
            "\ 'cpp': ['astyle', 'clang-format', 'clangtidy'],
            \ 'c': ['clang-format'],
            \ }
noremap <F4> :ALEFix<CR>
" 关闭保存时自动修复，防止文件太大时卡顿的问题
let g:ale_fix_on_save = 0

let g:ale_python_pylint_options = '--max-line-length=79 --rcfile=~/py_check/pylintrc'
let g:ale_python_flake8_options = '--max-line-length=79 --select E122,E123,E126,E127,E128,E129,E265,E402,F821,W503,W504,W605,W606,E203,F841'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" 提供关闭ale和fix_on_save的方式
let s:enable_ale = 1
nnoremap <leader>a : call ToggleAle()<cr>
func! ToggleAle()
        if s:enable_ale == 1
                let g:ale_fix_on_save = 0
                exec "ALEDisable"
                let s:enable_ale=0
        else
                let g:ale_fix_on_save = 1
                exec "ALEEnable"
                let s:enable_ale=1
endfunction

let g:ale_java_eclipselsp_path = '/opt/eclipse.jdt.ls/'
let g:ale_java_eclipselsp_config_path = '/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux'
let g:ale_java_eclipselsp_executable = '/usr/bin/java'
let g:ale_java_google_java_format_executable = 'google-java-format'

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"使用本地的.clang-format配置文件，先查找当前工程目录，再递归向上找
let g:ale_c_clangformat_use_local_file = 1
