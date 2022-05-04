vim.g.glow_use_pager = true

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- windows 分屏快捷键
map("n", "<leader>p", ":Glow<CR>", opt)
