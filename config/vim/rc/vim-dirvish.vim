Plug 'justinmk/vim-dirvish'
"Plug 'tpope/vim-eunuch'

map <silent> - :Dirvish %<CR>
map <TAB>7 <TAB>v<TAB>l-
map <TAB>8 <TAB>s<TAB>j-

let g:dirvish_relative_paths = 0

"How to override the netrw :Explore, :Sexplore, :Vexplore commands? ~
"Put this in your vimrc: >
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
															      "expand a directory inline (like a tree-style view)
augroup dirvish_config1
  autocmd!
  autocmd FileType dirvish
          \ nnoremap <silent><buffer> b ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>                                                                                                         augroup END                                                                                                                                                                                                                                                                                                                                                                                 
augroup dirvish_config2
autocmd!
" Map `t` to open in new tab.
autocmd FileType dirvish
\  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
\ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
" Map `gr` to reload.
autocmd FileType dirvish nnoremap <silent><buffer>                                                                                                                                            \ gr :<C-U>Dirvish %<CR>
" Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
autocmd FileType dirvish nnoremap <silent><buffer>
\ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
augroup END
