vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { "Hello World!    " }

vim.g.dashboard_custom_section = {
	-- a = {
	-- 	description = { "   Open last session          " },
	-- 	command = " RestoreSession",
	-- },
	a = { description = { "    Recently files        " }, command = "Telescope oldfiles" },
	b = { description = { "    Projects              " }, command = "Telescope project" },
	-- c = { description = { "  Edit keybindings      " }, command = "edit ~/.config/nvim/lua/keybindings.lua" },
	-- d = { description = { "    Edit Projects         " }, command = "edit ~/.local/share/nvim/project_nvim/project_history", },
	c = {
		description = { "    Edit Projects         " },
		command = "edit /root/.local/share/nvim/telescope-projects.txt",
	},
	d = {
		description = { "    Jump to bookmarks     " },
		command = "Telescope marks",
	},
	e = { description = { "    Change colorscheme    " }, command = "Telescope colorscheme" },
	-- e = { description = { "  Edit .bashrc          " }, command = "edit ~/.bashrc" },
	-- f = { description = { "  Edit init.lua         " }, command = "edit ~/.config/nvim/init.lua" },
	f = { description = { "    Find file            " }, command = "Telescope find_files" },
	g = { description = { "    Find text            " }, command = "Telescope live_grep" },
	-- i = { description = { "   New file            " }, command = "Telescope live_grep" },
}

vim.g.dashboard_custom_header = {
	[[ ███╗   ███╗███████╗███████╗██████╗  ██████╗  ]],
	[[ ████╗ ████║██╔════╝██╔════╝██╔══██╗██╔═══██╗ ]],
	[[ ██╔████╔██║█████╗  █████╗  ██████╔╝██║   ██║ ]],
	[[ ██║╚██╔╝██║██╔══╝  ██╔══╝  ██╔═══╝ ██║   ██║ ]],
	[[ ██║ ╚═╝ ██║███████╗███████╗██║     ╚██████╔╝ ]],
	[[ ╚═╝     ╚═╝╚══════╝╚══════╝╚═╝      ╚═════╝  ]],
}
-- vim.cmd("autocmd FileType dashboard set laststatus=0")
