
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

map('i', ']m', "<Plug>(textobj-python-function-n)", opt)
map('i', '[m', "<Plug>(textobj-python-function-p)", opt)
