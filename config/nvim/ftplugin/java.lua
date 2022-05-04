vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.autoindent = true
vim.bo.autoindent = true

-- local dap = require("dap")
-- dap.repl.close()
-- dap.configurations.java = {
-- 	{
-- 		-- You need to extend the classPath to list your dependencies.
-- 		-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
-- 		classPaths = {},
--
-- 		-- If using multi-module projects, remove otherwise.
-- 		projectName = "yourProjectName",
--
-- 		javaExec = "/usr/lib/jvm/java-18-openjdk/bin/java",
-- 		mainClass = "your.package.name.MainClassName",
--
-- 		-- If using the JDK9+ module system, this needs to be extended
-- 		-- `nvim-jdtls` would automatically populate this property
-- 		modulePaths = {},
-- 		name = "Launch YourClassName",
-- 		request = "launch",
-- 		type = "java",
-- 	},
-- }
require("plugin-config.nvim-jdtls")
local dap = require("dap")
dap.repl.close()
