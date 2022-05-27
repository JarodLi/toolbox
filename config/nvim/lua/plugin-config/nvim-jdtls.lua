-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.

local on_attach_java = function(client, bufnr)
	-- on_attach_general(client, bufnr)
	require("jdtls").setup_dap({ hotcodereplace = "auto" })

	require("jdtls.dap").setup_dap_main_class_configs()
	require("jdtls.setup").add_commands()
	local dap = require("dap")
	dap.repl.close()
	dap.defaults.fallback.terminal_win_cmd = "10split new"
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
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml"  }),

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
				"/usr1/docker/mount/java_check/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
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

require("jdtls").start_or_attach(config)

-- require("jdtls.dap").setup_dap_main_class_configs()
