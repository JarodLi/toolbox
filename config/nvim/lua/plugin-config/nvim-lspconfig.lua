-- https://github.com/neovim/nvim-lspconfig
-- 更多样式定制，参见：https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization

-- 诊断样式定制
-- vim.diagnostic.config({
-- 	-- 诊断的虚拟文本
-- 	virtual_text = false,
-- 	-- virtual_text = {
-- 	--     -- 显示的前缀，可选项：'●', '▎', 'x'
-- 	--     -- 默认是一个小方块，不是很好看，所以这里改了
-- 	--     prefix = "●",
-- 	--     -- 是否总是显示前缀？是的
-- 	--     source = "always"
-- 	-- },
-- 	float = {
-- 		-- 是否显示诊断来源？是的
-- 		source = "always",
-- 	},
-- 	-- 在插入模式下是否显示诊断？不要
-- 	update_in_insert = false,
-- })

-- TODO: 写一个function，open/close virtual_text

function close_diagnose()
	vim.diagnostic.config({ virtual_text = false })
end

function open_diagnose()
	vim.diagnostic.config({
		-- 诊断的虚拟文本
		virtual_text = {
			-- 显示的前缀，可选项：'●', '▎', 'x'
			-- 默认是一个小方块，不是很好看，所以这里改了
			prefix = "●",
			-- 是否总是显示前缀？是的
			source = "always",
		},
		float = {
			-- 是否显示诊断来源？是的
			source = "always",
		},
		-- 在插入模式下是否显示诊断？不要
		update_in_insert = false,
	})
end

-- open_diagnose()
close_diagnose()

-- local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
-- local opt = { noremap = true, silent = true }
-- map("v", "<leader>d", "<cmd>lua switch_diagnose()<CR>", opt)
