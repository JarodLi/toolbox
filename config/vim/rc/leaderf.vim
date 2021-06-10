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


