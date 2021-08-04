Plug 'Yggdroot/LeaderF'
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
"noremap <c-n> :LeaderfMru<cr>
""noremap <m-p> :LeaderfFunction!<cr>
"noremap <m-n> :LeaderfBuffer<cr>
""noremap <m-m> :LeaderfTag<cr>
nmap <leader>l :Leaderf
nmap <leader>bf :Leaderf! buffer<CR>
nmap <leader>lb :Leaderf! buffer<CR>
nmap <leader>lt :LeaderfBufTag!<CR>
nmap <leader>lf :LeaderfFunction!<CR>
"nmap <leader>fl :Leaderf! file<CR>
"nmap <leader>lf :Leaderf! file<CR>
"nmap <leader>lm :Leaderf! mru<CR>
"nmap <leader>lr :Leaderf rg<CR>
""nmap <leader>lf :LeaderfFunction!<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.cache/leader_tags')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_GtagsAutoGenerate = 1 " 打开第1个工程文件时自动生成gtags

"防止rg 卡死
let g:Lf_RgConfig = [
\ "--max-columns=150",
\ "--glob=!node_modules/*",
\ "--glob=!dist/*",
\ ]


" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

"let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" 添加--wd-mode=ac，指定从当前工程目录搜索, 参考: https://github.com/Yggdroot/LeaderF/issues/277
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg --wd-mode=ac -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
