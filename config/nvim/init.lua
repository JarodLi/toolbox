-- 基础设置
require("basic")
-- 先加载viml相关配置
require("vimplug")
require("plugins-vim")

require("keybindings")
require("colorscheme")

-- Packer 插件管理
require("plugins")

-- 必须要再加载一次lualine，否则bufferline不生效
require("plugin-config.lualine")

require("plugin-config.nvim-lspconfig")
function DEV_MODE()
	open_diagnose()
	vim.wo.number = true
	vim.cmd("IndentBlanklineEnable")
	vim.wo.relativenumber = true
	vim.notify("switch to develop mode")
end

function BROWSER_MODE()
	close_diagnose()
	vim.cmd("IndentBlanklineEnable")
	vim.wo.number = true
	vim.wo.relativenumber = true
	vim.notify("switch to browser mode")
end

function COPY_MODE()
	close_diagnose()
	vim.cmd("IndentBlanklineDisable")
	vim.cmd("set nolist")
	vim.notify("switch to copy mode")
end

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "<leader>sb", ":lua BROWSER_MODE()<CR>", opt)
map("n", "<leader>sd", ":lua DEV_MODE()<CR>", opt)
-- 开启copy模式，可以按住alt，然后鼠标左键选择块，在windows上能直接粘贴
map("n", "<leader>sc", ":lua COPY_MODE()<CR>", opt)
