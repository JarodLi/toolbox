Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp' "在vim中支持lsp功能的插件
Plug 'ryanolsonx/vim-lsp-python'  "vim-lsp的python配置插件
Plug 'autozimu/LanguageClient-neovim'
Plug 'lgranie/vim-lsp-java'


""""""""""""""""""""""""""""""
" => vim-lsp plugin
""""""""""""""""""""""""""""""
":LspCodeAction Gets a list of possible commands that can be applied to a file so it can be fixed (quick fix)
":LspDeclaration        Go to the declaration of the word under the cursor, and open in the current window
":LspDefinition Go to the definition of the word under the cursor, and open in the current window
":LspDocumentDiagnostics        Get current document diagnostics information
":LspDocumentFormat     Format entire document
":LspDocumentRangeFormat        Format document selection
":LspDocumentSymbol     Show document symbols
":LspHover      Show hover information
":LspImplementation     Show implementation of interface in the current window
":LspNextError  jump to next error
":LspNextReference      jump to next reference to the symbol under cursor
":LspPeekDeclaration    Go to the declaration of the word under the cursor, but open in preview window
":LspPeekDefinition     Go to the definition of the word under the cursor, but open in preview window
":LspPeekImplementation Go to the implementation of an interface, but open in preview window
":LspPeekTypeDefinition Go to the type definition of the word under the cursor, but open in preview window
":LspPreviousError      jump to previous error
":LspPreviousReference  jump to previous reference to the symbol under cursor
":LspReferences Find references
":LspRename     Rename symbol
":LspStatus     Show the status of the language server
":LspTypeDefinition     Go to the type definition of the word under the cursor, and open in the current window
":LspWorkspaceSymbol    Search/Show workspace symbol


if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
else
  echohl ErrorMsg
  echom 'Sorry, `pyls` is not installed. See :h vim-lsp-python for more details on setup.'
  echohl NONE
endif

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'allowlist': ['sh'],
        \ })
endif

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support"
let g:lsp_highlight_references_enabled = 1
"highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

nmap <leader>ld :LspDefinition<CR>
nmap <leader>lpd :LspPeekDefinition<CR>
nmap <leader>lh :LspHover<CR>
nmap <leader>lr :LspRename<CR>
nmap <leader>lc :LspReferences<CR>
"nmap <leader>lf :LspDocumentRangeFormat<CR>


let g:vim_lsp_java = {
  \ 'eclipse_jdtls' : {
    \ 'repository': expand('/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'),
    \ 'config': 'config_linux',
    \ 'workspace': expand('$WORKSPACE'),
  \ },
\ }


""""""""""""""""""""""""""""""
" => language-client
""""""""""""""""""""""""""""""

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_settingsPath = expand('~/.vim/languageclient.json')
let g:LanguageClient_selectionUI = 'quickfix'
let g:LanguageClient_diagnosticsList = v:null
let g:LanguageClient_hoverPreview = 'Never'

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/bin/pyls'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'sh': ['bash-language-server', 'start'],
    \ }
noremap <leader>rd :call LanguageClient#textDocument_definition()<cr>
noremap <leader>rc :call LanguageClient#textDocument_references()<cr>
noremap <leader>rh :call LanguageClient#textDocument_hover()<cr>
noremap <leader>rr :call LanguageClient#textDocument_rename()<cr>
noremap <leader>ri :call LanguageClient#textDocument_implementation()<cr>
noremap <leader>rt :call LanguageClient#textDocument_typeDefinition()<cr>


