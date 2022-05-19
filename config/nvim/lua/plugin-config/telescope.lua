local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

telescope.setup({
	defaults = {
		-- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
		initial_mode = "insert",
		-- 窗口内快捷键
		mappings = require("keybindings").telescopeList,
	},
	pickers = {
		-- 内置 pickers 配置
		find_files = {
			-- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
			-- theme = "dropdown",
		},
	},
	extensions = {
		-- 扩展插件配置
		ctags_outline = {
			--ctags option
			ctags = { "ctags" },
			--ctags filetype option
			ft_opt = {
				aspvbs = "--asp-kinds=f",
				awk = "--awk-kinds=f",
				c = "--c-kinds=fp",
				cpp = "--c++-kinds=fp --language-force=C++",
				cs = "--c#-kinds=m",
				erlang = "--erlang-kinds=f",
				fortran = "--fortran-kinds=f",
				java = "--java-kinds=m",
				javascript = "--javascript-kinds=f",
				lisp = "--lisp-kinds=f",
				lua = "--lua-kinds=f",
				matla = "--matlab-kinds=f",
				pascal = "--pascal-kinds=f",
				php = "--php-kinds=f",
				python = "--python-kinds=fm --language-force=Python",
				ruby = "--ruby-kinds=fF",
				scheme = "--scheme-kinds=f",
				sh = "--sh-kinds=f",
				sql = "--sql-kinds=f",
				tcl = "--tcl-kinds=m",
				verilog = "--verilog-kinds=f",
				vim = "--vim-kinds=f",
				go = "--go-kinds=f",
				rust = "--rust-kinds=fPM",
				ocaml = "--ocaml-kinds=mf",
			},
		},

		project = {
			base_dirs = {
				-- {'/root/.config/nvim'},
				-- {'~/dev/src3', max_depth = 4},
				-- {path = '/root/.config/nvim'},
				-- {path = '~/dev/src5', max_depth = 2},
			},
			hidden_files = true, -- default: false
		},
	},
})
-- telescope extensions
pcall(telescope.load_extension, "env")

pcall(telescope.load_extension, "ctags_outline")
pcall(telescope.load_extension, "project")
