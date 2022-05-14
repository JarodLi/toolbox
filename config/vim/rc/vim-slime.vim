Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>ss :SlimeSendCurrentLine<CR>
