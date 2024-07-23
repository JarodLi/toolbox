-- https://github.com/mfussenegger/nvim-lint

-- WARN: nvim-lint 手动下载诊断工具，确保该诊断工具能被全局调用
-- pip3 install pylint

require("lint").linters_by_ft = {
	python = { "pylint", "flake8" },
	-- python = { "flake8" },
	sh = { "shellcheck" },
	java = { "checkstyle" },
	-- javascript = {"eslint"},
	-- typescript = {"eslint"},
	-- go = {"golangcilint"}
}


require("lint.linters.pylint").args = {
	"-f",
	"json",
	"--rcfile=/root/py_check/pylintrc-python3",
	-- "--max-line-length=120",
}

require("lint.linters.flake8").args = {
	"--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
	"--no-show-source",
	"--config=/root/py_check/tox.ini",
	"--max-line-length=120",
	"-",
}

require("lint.linters.checkstyle").args = {
	"-c",
	"/root/java_check/checkstyle_ruleset_8.20.xml",
}

-- 何时触发检测：
-- BufEnter    ： 载入 Buf 后
-- BufWritePost： 写入文件后
-- 由于搭配了 AutoSave，所以其他的事件就不用加了

vim.cmd([[
au BufEnter * lua require('lint').try_lint()
au BufWritePost * lua require('lint').try_lint()
]])
-- 修改virtual_text显示格式，该方法在lspconfig中定义
-- open_diagnose()

default_severity = {
	["error"] = vim.diagnostic.severity.ERROR,
	["warning"] = vim.diagnostic.severity.WARN,
	["information"] = vim.diagnostic.severity.INFO,
	["hint"] = vim.diagnostic.severity.HINT,
}

-- 配置诊断图标
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- 配置诊断信息显示格式
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- 可以自定义前缀符号
    format = function(diagnostic)
      return string.format('%s: %s', diagnostic.source, diagnostic.message)
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always", -- 这将确保在浮动窗口中始终显示诊断来源
  },
})

