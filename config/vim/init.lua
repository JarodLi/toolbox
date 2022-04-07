
-- 基础设置
require('basic')
-- 先加载viml相关配置
require('vimplug')
require("plugins-vim")

-- require('keybindings')
require("colorscheme")


-- Packer 插件管理
require("plugins")

-- 插件配置
require("plugin-config.nvim-tree")
-- require("plugin-config.bufferlines")
 require("plugin-config.barbar")
-- require("plugin-config.lualine")
-- require("plugin-config.feline")
require("plugin-config.telescope")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-lsp-installer")
require('plugin-config.lspsaga')
-- 注意lspconfig放到lspsaga后面加载，否则lint来源信息会丢失
require("plugin-config.nvim-lspconfig")
-- require("lsp.setup")
require('plugin-config.lsp-cmp')
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
require("plugin-config.nvim-lightbulb")
require("plugin-config.nvim-lint")
-- require("plugin-config.neoformat")
require("plugin-config.null-ls")
require("plugin-config.nvim-notify")
require("plugin-config.todo-comments")
-- require("plugin-config.git-blame")
require("plugin-config.dashboard")
require("plugin-config.project")

