-- https://github.com/mfussenegger/nvim-lint

-- WARN: nvim-lint 手动下载诊断工具，确保该诊断工具能被全局调用
-- pip3 install pylint

require("lint").linters_by_ft = {
	-- python = { "pylint", "flake8" },
	python = { "flake8" },
	sh = { "shellcheck" },
	java = { "checkstyle" },
	-- javascript = {"eslint"},
	-- typescript = {"eslint"},
	-- go = {"golangcilint"}
}

require("lint.linters.pylint").args = {
	"json",
	"--rcfile=~/py_check/pylintrc-python3",
	-- "--max-line-length=120",
}

require("lint.linters.flake8").args = {
	"--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
	"--no-show-source",
	"--config=~/py_check/tox.ini",
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

default_severity = {
	["error"] = vim.diagnostic.severity.ERROR,
	["warning"] = vim.diagnostic.severity.WARN,
	["information"] = vim.diagnostic.severity.INFO,
	["hint"] = vim.diagnostic.severity.HINT,
}
