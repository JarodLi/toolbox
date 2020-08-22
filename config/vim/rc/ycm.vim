"Plug 'ycm-core/YouCompleteMe', { 'for': ['python', 'c', 'go', 'sh']}
Plug 'ycm-core/YouCompleteMe'

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

" 设置补全白名单。 
let g:ycm_filetype_whitelist = {
                        \ "c":1,
                        \ "cpp":1,
                        \ "objc":1,
                        \ "sh":1,
                        \ "zsh":1,
                        \ "python":1,
                        \ "go":1,
                        \ }


let g:ycm_python_interpreter_path = '/usr/bin/python'
let g:ycm_python_sys_path = ['/usr/lib/python3.8/site-packages']
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
