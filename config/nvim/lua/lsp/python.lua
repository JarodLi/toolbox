-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local opts = {
	-- 禁用 Pyright 的诊断信息（只使用 pylint）
	handlers = {
		---@diagnostic disable-next-line: unused-vararg
		["textDocument/publishDiagnostics"] = function(...) end,
	},

	settings = {},
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交给专门插件插件处理
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

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
