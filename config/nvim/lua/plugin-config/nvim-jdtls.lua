-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.

function tprint(tbl, indent)
	if not indent then
		indent = 0
	end
	local toprint = string.rep(" ", indent) .. "{\r\n"
	indent = indent + 2
	for k, v in pairs(tbl) do
		toprint = toprint .. string.rep(" ", indent)
		if type(k) == "number" then
			toprint = toprint .. "[" .. k .. "] = "
		elseif type(k) == "string" then
			toprint = toprint .. k .. "= "
		end
		if type(v) == "number" then
			toprint = toprint .. v .. ",\r\n"
		elseif type(v) == "string" then
			toprint = toprint .. '"' .. v .. '",\r\n'
		elseif type(v) == "table" then
			toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
		else
			toprint = toprint .. '"' .. tostring(v) .. '",\r\n'
		end
	end
	toprint = toprint .. string.rep(" ", indent - 2) .. "}"
	return toprint
end

on_attach_general = function(client, bufnr)
	-- java使用jdtls自带的格式化工具
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
end

local on_attach_java = function(client, bufnr)
	on_attach_general(client, bufnr)

	require("jdtls").setup_dap({ hotcodereplace = "auto" })
	--
	require("jdtls.dap").setup_dap_main_class_configs({ verbose = true })
	-- require("jdtls.setup").add_commands()
	-- local dap = require("dap")
	-- dap.repl.close()
	-- dap.defaults.fallback.terminal_win_cmd = "10split new"
	-- dap.defaults.fallback.terminal_win_cmd = "tabnew"
end

local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		-- 💀
		"/usr/lib/jvm/java-18-openjdk/bin/java", -- or '/path/to/java11_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- 💀
		"-jar",
		"/root/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		"-configuration",
		"/root/.local/share/nvim/lsp_servers/jdtls/config_linux",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		"/root/workspace/folder",
	},

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			configuration = {
				runtimes = {
					{ name = "JavaSE-1.8", path = "/usr/lib/jvm/java-18-openjdk/" },
				},
			},
			format = {
				settings = {
					url = "/root/java_check/eclipse-formatter-hw.xml",
				},
			},
		},
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {
			-- "/usr1/docker/mount/java_check/com.microsoft.java.debug.plugin-0.36.0.jar",
			vim.fn.glob(
				"/usr2/docker/mount/java_check/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
			),
		},
	},
	on_attach = on_attach_java,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
-- require("jdtls").setup_dap({ hotcodereplace = "auto" })

-- config["on_attach"] = function(client, bufnr)
-- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
-- you make during a debug session immediately.
-- Remove the option if you do not want that.
-- require("jdtls").setup_dap({ hotcodereplace = "auto" })
-- end

-- require("dap").configurations.java = {
-- 	{
-- 		-- type = "java",
-- 		-- request = "attach",
-- 		-- name = "Debug (Attach) - Remote",
-- 		-- hostName = "127.0.0.1",
-- 		-- port = 5005,
-- 	},
-- }

require("jdtls").start_or_attach(config)

-- require("jdtls.dap").setup_dap_main_class_configs()

-- for debug
function get_dap_info()
	print(tprint(require("dap")["adapters"]))
	print(tprint(require("dap")["configurations"]))
end
