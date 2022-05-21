vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.autoindent = true
vim.bo.autoindent = true
-- 不能开启smartindent，否则py代码第一行#开头的注释无法对齐
-- vim.o.smartindent = true
-- vim.opt.listchars:append("space:.")
-- vim.opt.listchars:append("eol:↴")

function run()
    local args = vim.fn.input("run args: ")
    run_cmd = "!python3 % " .. args
    vim.api.nvim_command(run_cmd)
end
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
map("n", "<leader>r", ":lua run()<cr>", opt)
