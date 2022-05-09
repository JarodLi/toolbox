vim.cmd("let g:minimap_width = 20")
vim.cmd("let g:minimap_highlight_range=1")
vim.cmd("let g:minimap_highlight_search=1")
vim.cmd("let g:minimap_git_colors=1")
vim.cmd('let g:minimap_close_filetypes=["NvimTree"]')

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- windows 分屏快捷键
 map("n", "<A-=>", ":MinimapToggle<CR>", opt)

