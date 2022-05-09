local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("没有找到 bufferline")
	return
end

-- bufferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
	options = {
		mode = "buffers",
		-- mode = "tabs",
		numbers = "none",
		indicator_icon = "▎",
		show_buffer_close_icon = false,
		-- buffer_close_icon = "",
		buffer_close_icon = "",
		always_show_bufferline = true,
		show_tab_indicators = true,
		modified_icon = "●",
		-- close_icon = '',
		-- show_close_icon = false,
		-- show_tab_indicators = true,
		-- always_show_bufferline = true,
		-- separator_style = "thick",
		separator_style = "thin",
		left_trunc_marker = "",
		right_trunc_marker = "",
		-- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
		close_command = "Bdelete! %d",
		-- 侧边栏配置
		-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		-- 使用 nvim 内置 LSP  后续课程会配置
		diagnostics = false,
		-- 可选，显示 LSP 报错图标
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
		groups = {
			items = {
				require("bufferline.groups").builtin.pinned:with({ icon = "" }),
			},
		},
	},
})

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- bufferline
-- 左右Tab切换
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-.>", ":BufferLineMoveNext<CR>", opt)
map("n", "<A-,>", ":BufferLineMovePrev<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<A-w>", ":Bdelete!<CR>", opt)
map("n", "<A-p>", ":BufferLineTogglePin<CR>", opt)
map("n", "<A-k>", ":BufferLinePick<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<A-o>", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- 切换buffer时先把nvimtree关闭，防止出现窗口错乱
map("n", "<A-1>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 1<CR>", opt)
map("n", "<A-2>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 2<CR>", opt)
map("n", "<A-3>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 3<CR>", opt)
map("n", "<A-4>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 4<CR>", opt)
map("n", "<A-5>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 5<CR>", opt)
map("n", "<A-6>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 6<CR>", opt)
map("n", "<A-7>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 7<CR>", opt)
map("n", "<A-8>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 8<CR>", opt)
map("n", "<A-9>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 9<CR>", opt)
map("n", "<A-l>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 9<CR>", opt)
map("n", "<A-h>", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:BufferLineGoToBuffer 9<CR>", opt)

-- TODO: 切换tab时出现nvim崩溃问题，先把close nvim tree关闭
-- map("n", "<A-1>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 1<CR>", opt)
-- map("n", "<A-2>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 2<CR>", opt)
-- map("n", "<A-3>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 3<CR>", opt)
-- map("n", "<A-4>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 4<CR>", opt)
-- map("n", "<A-5>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 5<CR>", opt)
-- map("n", "<A-6>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 6<CR>", opt)
-- map("n", "<A-7>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 7<CR>", opt)
-- map("n", "<A-8>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 8<CR>", opt)
-- map("n", "<A-9>", ":SymbolsOutlineClose<CR>:BufferLineGoToBuffer 9<CR>", opt)

map("n", "<leader>bf", ":SymbolsOutlineClose<CR>:Leaderf! buffer --nowrap --fullScreen<CR>", opt)
-- map("n", "<leader>bf", ":NvimTreeClose<CR>:SymbolsOutlineClose<CR>:Leaderf! buffer --nowrap --fullScreen<CR>", opt)
