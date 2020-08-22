Plug 'dense-analysis/ale', { 'for': ['python', 'c', 'go', 'sh']}

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 20
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''


let b:ale_linters = ['flake8', 'pylint']
"ALE can fix files with the ALEFix command.
let g:ale_fixers = {
            \ 'python': ['yapf', 'isort'],
            \ }
noremap <F4> :ALEFix<CR>
let g:ale_fix_on_save = 1

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

