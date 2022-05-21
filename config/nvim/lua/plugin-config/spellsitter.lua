-- https://github.com/lewis6991/spellsitter.nvim

require("spellsitter").setup(
    {
        enable = true
    }
)
vim.o.spell = false
vim.o.spelllang = "en_us,cjk"
