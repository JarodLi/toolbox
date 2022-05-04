-- https://github.com/folke/todo-comments.nvim

require("todo-comments").setup(
    {
        keywords = {
            -- alt ： 别名
            FIX = {
                icon = " ",
                color = "#DC2626",
                alt = {"FIXME", "BUG", "FIXIT", "ISSUE", "!"}
            },
            TODO = {icon = " ", color = "#10B981"},
            HACK = {icon = " ", color = "#7C3AED"},
            WARN = {icon = " ", color = "#FBBF24", alt = {"WARNING", "XXX"}},
            PERF = {icon = " ", color = "#FC9868", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
            NOTE = {icon = " ", color = "#2563EB", alt = {"INFO"}}
        }
    }
)

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }
-- 查找 TODO 标签
map("n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<CR>", opt)
