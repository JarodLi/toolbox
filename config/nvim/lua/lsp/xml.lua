-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local opts = {
	settings = {},
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = true
		client.resolved_capabilities.document_range_formatting = true

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		-- 绑定快捷键
		require("keybindings").mapLSP(buf_set_keymap)
		require("illuminate").on_attach(client)
		-- 保存时自动格式化
		--vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
	end,
}

-- 查看目录等信息
return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
