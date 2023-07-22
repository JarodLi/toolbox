-- vim.g.dashboard_default_executive = "telescope"
-- vim.g.dashboard_custom_footer = { "Hello World!    " }
--
-- vim.g.dashboard_custom_section = {
-- 	-- a = {
-- 	-- 	description = { "   Open last session          " },
-- 	-- 	command = " RestoreSession",
-- 	-- },
-- 	a = { description = { "    Recently files        " }, command = "Telescope oldfiles" },
-- 	b = { description = { "    Projects              " }, command = "Telescope project" },
-- 	-- c = { description = { "  Edit keybindings      " }, command = "edit ~/.config/nvim/lua/keybindings.lua" },
-- 	-- d = { description = { "    Edit Projects         " }, command = "edit ~/.local/share/nvim/project_nvim/project_history", },
-- 	c = {
-- 		description = { "    Edit Projects         " },
-- 		command = "edit /root/.local/share/nvim/telescope-projects.txt",
-- 	},
-- 	d = {
-- 		description = { "    Jump to bookmarks     " },
-- 		command = "Telescope marks",
-- 	},
-- 	e = { description = { "    Change colorscheme    " }, command = "Telescope colorscheme" },
-- 	-- e = { description = { "  Edit .bashrc          " }, command = "edit ~/.bashrc" },
-- 	-- f = { description = { "  Edit init.lua         " }, command = "edit ~/.config/nvim/init.lua" },
-- 	f = { description = { "    Find file            " }, command = "Telescope find_files" },
-- 	g = { description = { "    Find text            " }, command = "Telescope live_grep" },
-- 	-- i = { description = { "   New file            " }, command = "Telescope live_grep" },
-- }
--
-- vim.g.dashboard_custom_header = {
-- 	[[ ███╗   ███╗███████╗███████╗██████╗  ██████╗  ]],
-- 	[[ ████╗ ████║██╔════╝██╔════╝██╔══██╗██╔═══██╗ ]],
-- 	[[ ██╔████╔██║█████╗  █████╗  ██████╔╝██║   ██║ ]],
-- 	[[ ██║╚██╔╝██║██╔══╝  ██╔══╝  ██╔═══╝ ██║   ██║ ]],
-- 	[[ ██║ ╚═╝ ██║███████╗███████╗██║     ╚██████╔╝ ]],
-- 	[[ ╚═╝     ╚═╝╚══════╝╚══════╝╚═╝      ╚═════╝  ]],
-- }
-- vim.cmd("autocmd FileType dashboard set laststatus=0")
--

db=require('dashboard')

db.setup({
  theme = 'doom',
  config = {
    header = {
        [[ ]],
        [[ ]],
        [[ ]],
        [[ ]],
        [[ ███╗   ███╗███████╗███████╗██████╗  ██████╗  ]],
        [[ ████╗ ████║██╔════╝██╔════╝██╔══██╗██╔═══██╗ ]],
        [[ ██╔████╔██║█████╗  █████╗  ██████╔╝██║   ██║ ]],
        [[ ██║╚██╔╝██║██╔══╝  ██╔══╝  ██╔═══╝ ██║   ██║ ]],
        [[ ██║ ╚═╝ ██║███████╗███████╗██║     ╚██████╔╝ ]],
        [[ ╚═╝     ╚═╝╚══════╝╚══════╝╚═╝      ╚═════╝  ]],
        [[ ]],
        [[ ]],
        [[ ]],
    }, --your header
    center = {
      {
        icon = ' ',
        icon_hl = '',
        desc = 'Recently file           ',
        desc_hl = 'String',
        -- key = 's',
        -- keymap = 's',
        key_hl = 'Number',
        action = 'Telescope oldfiles'
      },
      {
        icon = ' ',
        icon_hl = '',
        desc = 'Projects           ',
        desc_hl = 'String',
        -- key = 'b',
        -- keymap = 'b',
        key_hl = 'Number',
        action = 'Telescope project'
      },
      {
        icon = ' ',
        icon_hl = '',
        desc = 'Edit Projects           ',
        desc_hl = 'String',
        -- key = 'a',
        -- keymap = 'a',
        key_hl = 'Number',
        action = 'edit ~/.local/share/nvim/project_nvim/project_history'
      },
      {
        icon = ' ',
        icon_hl = '',
        desc = 'Jump to bookmarks            ',
        desc_hl = 'String',
        -- key = 'd',
        -- keymap = 'd',
        key_hl = 'Number',
        action = 'Telescope marks'
      },
      {
        icon = ' ',
        icon_hl = '',
        desc = 'Change colorscheme            ',
        desc_hl = 'String',
        -- key = 'i',
        -- keymap = 'i',
        key_hl = 'Number',
        action = 'Telescope colorscheme'
      },
      {
        icon = ' ',
        icon_hl = '',
        desc = 'Find file                 ',
        desc_hl = 'String',
        -- key = 'i',
        -- keymap = 'i',
        key_hl = 'Number',
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        icon_hl = '',
        desc = 'Find text            ',
        desc_hl = 'String',
        -- key = 'j',
        -- keymap = 'j',
        key_hl = 'Number',
        action = 'Telescope live_grep'
      },
    },
    footer = {'--by lijian'}  --your footer
}
}
)
