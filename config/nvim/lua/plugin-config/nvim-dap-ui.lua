-- https://github.com/rcarriga/nvim-dap-ui
local dap = require("dap")
local dapui = require("dapui")
-- -- 初始化调试界面
-- dapui.setup({
-- 	sidebar = {
-- 		-- dapui 的窗口设置在右边
-- 		position = "right",
-- 	},
-- })
-- -- 如果开启或关闭调试，则自动打开或关闭调试界面
-- dap.listeners.after.event_initialized["dapui_config"] = function()
-- 	dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- 	dap.repl.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- 	dap.repl.close()
-- end
-- -- 显示或隐藏调试界面
-- vim.keybinds.gmap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", vim.keybinds.opts)
--
-- local dapui = require("dapui")

-- 定义各种图标

vim.fn.sign_define("DapBreakpoint", {
	text = "🛑",
	texthl = "LspDiagnosticsSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "LspDiagnosticsSignInformation",
	linehl = "DiagnosticUnderlineInfo",
	numhl = "LspDiagnosticsSignInformation",
})

vim.fn.sign_define("DapBreakpointRejected", {
	text = "",
	texthl = "LspDiagnosticsSignHint",
	linehl = "",
	numhl = "",
})

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "o", "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	 sidebar = {                                                                    
	     -- You can change the order of elements in the sidebar
	     elements = {
		 -- Provide as ID strings or tables with "id" and "size" keys
		 {
		     id = "scopes",
		     size = 0.40, -- Can be float or integer > 1
		 },
		 { id = "watches", size = 0.2 },
		 { id = "stacks", size = 0.2 },
		 { id = "breakpoints", size = 0.2 },
	     },
	     size = 45,
	     position = "right", -- Can be "left", "right", "top", "bottom"
	 },
	 tray = {
	     elements = { "repl" },
	     size = 8,
	     position = "bottom", -- Can be "left", "right", "top", "bottom"
	 },
	 floating = {  [2/4]
	     max_height = 40, -- These can be integers or a float between 0 and 1.
	     max_width = 40, -- Floats will be treated as percentage of your screen.
	     border = "rounded", -- Border style. Can be "single", "double" or "rounded"
	     mappings = {
		 close = { "q", "<Esc>" },
	     },
	 },
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
}) -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
	-- dap.repl.close()
	dap.defaults.fallback.terminal_win_cmd = "5split new"
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap.defaults.fallback.terminal_win_cmd = "5split new"
