-- https://github.com/phaazon/hop.nvim

require("hop").setup()
local kopts = {noremap = true, silent = true}

-- 搜索并跳转到单词
vim.api.nvim_set_keymap("n", "<leader>hw", "<cmd>HopWord<CR>", kopts)
-- 搜索并跳转到行
vim.api.nvim_set_keymap("n", "<leader>hl", "<cmd>HopLine<CR>", kopts)
-- 搜索并跳转到字符
vim.api.nvim_set_keymap("n", "<leader>hc", "<cmd>HopChar1<CR>", kopts)
