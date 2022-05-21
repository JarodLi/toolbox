-- https://github.com/ray-x/lsp_signature.nvim

require("lsp_signature").setup(
    {
        bind = true,
        -- 边框样式
        handler_opts = {
            -- double、rounded、single、shadow、none
            border = "rounded"
        },
        -- 自动触发
        floating_window = false,
        -- 绑定按键
        toggle_key = "<C-n>",
        -- 虚拟提示关闭
        hint_enable = true,
        max_width = 120,
        max_height = 20,
        -- 正在输入的参数将如何突出显示
        hi_parameter = "LspSignatureActiveParameter"
    }
)
