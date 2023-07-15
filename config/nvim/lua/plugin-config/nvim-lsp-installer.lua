local lsp_installer = require("nvim-lsp-installer")

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	lua_ls = require("lsp.lua"), -- lua/lsp/config/lua.lua
	-- pyright = require("lsp.python"),
	pyright = require("lsp.python"),
	-- jdtls = require("lsp.java"),
	bashls = require("lsp.bash"),
	-- ccls = require("lsp.c"),
	clangd = require("lsp.cpp"),
	Docker = require("lsp.docker"),
	jsonls = require("lsp.json"),
	lemminx = require("lsp.xml"),
	yamlls = require("lsp.yaml"),
	zk = require("lsp.markdown"),
}
-- 自动安装 Language Servers
for name, server_options in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
		-- 使用 cmp_nvim_lsp 代替内置 omnifunc，获得更强的补全体验
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- 代替内置 omnifunc
		server_options.capabilities = capabilities
	end
end

--  下边这段代码，是 lsp_installer 的回调函数，这个函数会在每个 LSP Server 准备好时调用。
lsp_installer.on_server_ready(function(server)
	local config = servers[server.name]
	if config == nil then
		return
	end
	if config.on_setup then
		config.on_setup(server)
	else
		server:setup({})
	end
end)
