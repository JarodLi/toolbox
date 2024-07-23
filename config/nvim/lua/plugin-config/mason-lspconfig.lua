-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    -- "sumneko_lua",
    "tsserver",
    -- "tailwindcss",
    "bashls",
    -- "cssls",
    "dockerls",
    "emmet_ls",
    "html",
    "jsonls",
    "pyright",
    -- "rust_analyzer",
    "taplo",
    "yamlls",
    -- "gopls",
  },
})

-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP atteches to a given buffer
local lspconfig = require('lspconfig')

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
local telescope = require('telescope.builtin')
local goto_preview = require('goto-preview')
-- local lspsaga = require('lspsaga')


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.document_highlight = false
    client.server_capabilities.code_lens = false
    client.server_capabilities.diagnostics = false
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- 设置普通模式下的 'gd' 快捷键，使用 goto-preview 插件的 goto_preview_definition 函数
    vim.keymap.set('n', 'gd', function()
        goto_preview.goto_preview_definition()
    end, { noremap = true, silent = true })

    vim.keymap.set('n', 'gh', "<cmd>Lspsaga hover_doc<CR>", bufopts)
    vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>", bufopts)

    vim.keymap.set('n', 'gD', function()
        telescope.lsp_definitions({ theme = 'dropdown' })
    end, { noremap = true, silent = true })
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', '<leader>rn', function()
    --   require('lspsaga.rename').rename()
    -- end, { silent = true })
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gr', function()
        telescope.lsp_references({ theme = 'dropdown' })
    end)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
    vim.keymap.set("n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", bufopts)
    vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", bufopts)
    vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", bufopts)
    -- vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
    vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
	-- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
	  vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", bufopts)

	-- mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
	-- 悬浮窗口上翻页，由 Lspsaga 提供
	-- mapbuf("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opt)
	-- 悬浮窗口下翻页，由 Lspsaga 提供
    -- vim.keymap.set("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", bufopts)

    -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
    -- mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    --
    -- -- code action telescope lsp_code_actions已经被remove掉，使用vim.lsp.buf.code_action配合telescope-ui-select使用
    -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- mapbuf("n", "gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opt)
    -- mapbuf("n", "gD", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", opt)
    -- mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
    -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf("n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", opt)
    -- mapbuf("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opt)
    -- mapbuf("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opt)
    -- mapbuf("n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", opt)
    -- -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    -- mapbuf("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
    -- -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    -- mapbuf("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
    -- mapbuf("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opt)
        -- 启用 CodeLens
    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
      buffer = bufnr,
      command = 'CodeLensRefresh',
    })
end

local on_attach1 = function(client, bufnr)
  -- 禁用格式化功能，交给专门插件插件处理
  client.server_capabilities.documentFormattingProvider = false     
  client.server_capabilities.documentRangeFormattingProvider = false

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  -- 绑定快捷键
  require("keybindings").mapLSP(buf_set_keymap)
  require("illuminate").on_attach(client)
  -- 保存时自动格式化
  --vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
end
-- Configure each language
-- How to add LSP for a specific language?
-- 1. use `:Mason` to install corresponding LSP
-- 2. add configuration below
lspconfig.pyright.setup({
	on_attach = on_attach,
})
lspconfig.bashls.setup({
	on_attach = on_attach,
})
lspconfig.lua_ls.setup({
	on_attach = on_attach,
})
lspconfig.dockerls.setup({
	on_attach = on_attach,
})

