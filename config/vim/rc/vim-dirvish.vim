Plug 'justinmk/vim-dirvish'
"Plug 'tpope/vim-eunuch'

map <silent> - :Dirvish %<CR>
map <TAB>7 <TAB>v<TAB>l-
map <TAB>8 <TAB>s<TAB>j-

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish
          \ nnoremap <silent><buffer> t ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR> 
augroup END
