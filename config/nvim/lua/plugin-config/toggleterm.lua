require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 10
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = "fish", -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "curved",
		width = 95,
		height = 25,
		-- winblend = 3,
	},
})

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "<F12>", ":ToggleTerm direction=float<CR>", opt)
map("t", "<F12>", "<C-\\><C-n><C-W>h", opt)

--  从term中退出
map("t", "<tab><space>", "<C-\\><C-n><C-W>k:ToggleTerm<CR>", opt)
map("t", "<tab>h", "<C-\\><C-n><C-W>h", opt)
map("t", "<tab>l", "<C-\\><C-n><C-W>l", opt)
map("t", "<tab>j", "<C-\\><C-n><C-W>j", opt)
map("t", "<tab>k", "<C-\\><C-n><C-W>k", opt)
map("t", "<esc>", "<C-\\><C-n>", opt)

-- function _G.set_terminal_keymaps()
-- 	local opts = { noremap = true }
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
-- end
--
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local function inInsert()
	-- 删除 Esc 的映射
	vim.keybinds.dgmap("t", "<Esc>")
end

local Toggleterm = require("toggleterm")
-- 新建终端
local Terminal = require("toggleterm.terminal").Terminal
-- 新建 lazygit 终端
local lazyGit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "curved",
		width = 125,
		height = 32,
		-- winblend = 3,
	},
	on_open = function(term)
		inInsert()
		-- lazygit 中 q 是退出
		vim.keybinds.bmap(term.bufnr, "i", "q", "<cmd>close<CR>", vim.keybinds.opts)
	end,
	on_close = function()
		-- 重新映射 Esc
		vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
	end,
})

-- 新建 ipython 终端
local ipython = Terminal:new({
	cmd = "ipython",
	hidden = true,
	direction = "vertical",
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "curved",
		width = 125,
		height = 32,
		-- winblend = 3,
	},
	on_open = function(term)
		inInsert()
		-- lazygit 中 q 是退出
		vim.keybinds.bmap(term.bufnr, "i", "q", "<cmd>close<CR>", vim.keybinds.opts)
	end,
	on_close = function()
		-- 重新映射 Esc
		vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
	end,
})
-- 定义新的方法
-- Toggleterm.float_toggle = function()
-- 	floatTerm:toggle()
-- end
Toggleterm.lazygit_toggle = function()
	lazyGit:toggle()
end

Toggleterm.ipython_toggle = function()
	ipython:toggle()
end

-- 打开lazy git 终端
vim.keybinds.gmap("n", "<F11>", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", vim.keybinds.opts)
map("t", "<F11>", "<C-\\><C-n><C-W>h", opt)

-- vim.keybinds.gmap("n", "<tab><space>", "<cmd>lua require('toggleterm').ipython_toggle()<CR>", vim.keybinds.opts)

map("n", "<F12>", ":ToggleTerm direction=float<CR>", opt)
map("n", "<tab><space>", ":ToggleTerm direction=vertical<CR>", opt)

-- 退出终端插入模式
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
-- 打开或关闭所有终端
vim.keybinds.gmap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts)
vim.keybinds.gmap("x", "<leader>ss", "<cmd>ToggleTermSendVisualSelection<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap(
-- 	"x",
-- 	"<leader>s",
-- 	"'<,'> lua require'toggleterm'.send_lines_to_terminal('visual')<CR>",
-- 	vim.keybinds.opts
-- )
vim.keybinds.gmap("n", "<leader>ss", "<cmd>ToggleTermSendCurrentLine<CR>", vim.keybinds.opts)
