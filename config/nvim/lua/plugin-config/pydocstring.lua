vim.api.nvim_command('let g:pydocstring_doq_path = "/usr/bin/doq"')
vim.api.nvim_command('let g:pydocstring_formatter = "sphinx"')
vim.api.nvim_command("let g:pydocstring_ignore_init = 1")

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- windows 分屏快捷键
map("n", "<leader>doc", ":Pydocstring<CR>", opt)
