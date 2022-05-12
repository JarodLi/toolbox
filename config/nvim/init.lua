-- 基础设置
require("basic")
-- 先加载viml相关配置
require("vimplug")
require("plugins-vim")

-- require('keybindings')
require("colorscheme")

-- Packer 插件管理
require("plugins")

-- 插件配置
require("plugin-config.nvim-tree")
-- require("plugin-config.barbar")
require("plugin-config.lualine")
-- require("plugin-config.tabline")
-- require("plugin-config.feline")
require("plugin-config.bufferlines")
require("plugin-config.telescope")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-lsp-installer")
require("plugin-config.lspsaga")
-- 注意lspconfig放到lspsaga后面加载，否则lint来源信息会丢失
require("plugin-config.nvim-lspconfig")
-- require("lsp.setup")
require("plugin-config.lsp-cmp")
require("plugin-config.comment")
require("plugin-config.autopairs")
-- require("plugin-config.windline")
-- require("plugin-config.autosave")
require("plugin-config.lastplace")
-- require("plugin-config.autosession")
require("plugin-config.nvim-hlslens")
require("plugin-config.indent-blankline")
require("plugin-config.hop")
require("plugin-config.vim-illuminate")
require("plugin-config.spellsitter")
require("plugin-config.surround")
require("plugin-config.gitsigns")
require("plugin-config.fidget")
require("plugin-config.lsp_signature")
require("plugin-config.nvim-lint")
-- require("plugin-config.neoformat")
require("plugin-config.null-ls")
require("plugin-config.nvim-lightbulb")
require("plugin-config.nvim-notify")
require("plugin-config.todo-comments")
-- require("plugin-config.git-blame")
require("plugin-config.dashboard")
-- require("plugin-config.project")
require("plugin-config.textobj")
require("plugin-config.symbols-outline")
require("plugin-config.goto-preview")
require("plugin-config.pydocstring")
require("plugin-config.marks")
require("plugin-config.glow")
require("plugin-config.nvim-dap")
require("plugin-config.nvim-dap-ui")
require("plugin-config.nvim-dap-virtual-text")
-- require("plugin-config.nvim-jdtls")
require("plugin-config.minimap")
require("plugin-config.vim-smoothie")
require("plugin-config.accelerated-jk")
require("plugin-config.vim-eft")
require("plugin-config.toggleterm")
require("nvim-ts-rainbow")
require("plugin-config.yankv")


function DEV_MODE() 
       open_diagnose()
       vim.wo.number = true
       vim.wo.relativenumber = true
       vim.notify("switch to develop mode")
   end

   function BROWSER_MODE()
       close_diagnose()
       vim.wo.number = true
       vim.wo.relativenumber = false
       vim.notify("switch to browser mode")
   end

   local map = vim.api.nvim_set_keymap
   local opt = { noremap = true, silent = true }

   map("n", "<leader>b", ":lua BROWSER_MODE()<CR>", opt)
   map("n", "<leader>d", ":lua DEV_MODE()<CR>", opt)

