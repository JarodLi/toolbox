vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
	gmap = vim.api.nvim_set_keymap,
	bmap = vim.api.nvim_buf_set_keymap,
	dgmap = vim.api.nvim_del_keymap,
	dbmap = vim.api.nvim_buf_del_keymap,
	opts = { noremap = true, silent = true },
}

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- windows 分屏快捷键
map("n", "<TAB>|", ":vsp<CR>", opt)
map("n", "<TAB>_", ":sp<CR>", opt)
-- 关闭当前
map("n", "<TAB>c", "<C-w>c", opt)
-- 关闭其他
map("n", "<TAB>o", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<TAB>h", "<C-w>h", opt)
map("n", "<TAB>j", "<C-w>j", opt)
map("n", "<TAB>k", "<C-w>k", opt)
map("n", "<TAB>l", "<C-w>l", opt)
map("n", "<TAB>=", "<C-w>=", opt)
map("n", "<TAB>-", "<C-w>-", opt)
map("n", "<TAB>>", "<C-w>>", opt)
map("n", "<TAB><", "<C-w><", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize +2<CR>", opt)
map("n", "<C-Right>", ":vertical resize -2<CR>", opt)
map("n", "<TAB><", ":vertical resize +5<CR>", opt)
map("n", "<TAB>>", ":vertical resize -5<CR>", opt)
-- 上下比例
map("n", "<TAB>+", ":resize +5<CR>", opt)
map("n", "<TAB>-", ":resize -5<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "<TAB>=", "<C-w>=", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- 正常模式下按ESC取消高亮显示
map("n", "<ESC>", ":nohlsearch<CR>", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
-- map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + - 键打开关闭tree
map("n", "<A-->", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "A", action = "create" },
	{ key = "D", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
	{ key = "-", action = "dir_up" },
	{ key = "<leader>p", action = "preview" },
}

-- Telescope
-- 查找文件
map("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>", opt)
-- 查找文字
map("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<CR>", opt)
-- 查找当前buffer内容
map("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find theme=dropdown<CR>", opt)
-- 查找帮助文档
map("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", opt)
-- 查找最近打开的文件
map("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<CR>", opt)
-- 查找 marks 标记
map("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", opt)

map("n", "<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>", opt)

-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
--map("n", "<leader>bf", ":Telescope buffers<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	-- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)

	-- code action
	-- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
	mapbuf("n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", opt)

	-- go xx
	-- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	-- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
	-- mapbuf("n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", opt)
	mapbuf("n", "gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opt)
	mapbuf("n", "gD", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", opt)
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)

	-- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	-- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)

	mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	mapbuf("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opt)

	-- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	mapbuf("n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", opt)
	mapbuf("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opt)
	-- diagnostic
	-- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	-- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	-- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	-- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
	mapbuf("n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", opt)
	-- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
	mapbuf("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
	-- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
	mapbuf("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)

	-- mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
	-- 悬浮窗口上翻页，由 Lspsaga 提供
	-- mapbuf("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opt)
	-- 悬浮窗口下翻页，由 Lspsaga 提供
	mapbuf("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opt)
	-- 没用到
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {

		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

		-- 自定义代码段跳转到下一个参数
		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "i", "s" }),

		-- 自定义代码段跳转到上一个参数
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),

		-- Super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		-- end of super Tab
	}
end

map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map("n", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map("v", "<leader>rn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

return pluginKeys
