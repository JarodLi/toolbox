

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp' "在vim中支持lsp功能的插件
Plug 'ryanolsonx/vim-lsp-python'  "vim-lsp的python配置插件

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

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support"
let g:lsp_highlight_references_enabled = 1
"highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

nmap <leader>ld :LspDefinition<CR>
nmap <leader>lpd :LspPeekDefinition<CR>
nmap <leader>lh :LspHover<CR>
" renaming时会卡死，使用jedi的rename
nmap <leader>lr :LspRename<CR>
nmap <leader>lc :LspReferences<CR>
nmap <leader>lf :LspDocumentRangeFormat<CR>

