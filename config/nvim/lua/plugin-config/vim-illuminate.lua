-- https://github.com/RRethy/vim-illuminate

-- 禁止高亮的文件类型
-- 虽然 vista_kind 和 toggleterm 还没有安装
-- 但并不影响使用，反正后续都会装上
vim.g.Illuminate_ftblacklist = {
    "NvimTree",
    "vista_kind",
    "toggleterm"
}
 vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
 vim.api.nvim_set_keymap(
    "n",
    "<a-p>",
    '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
    { noremap = true }
 )
