local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		-- Formatting ---------------------
		--  brew install shfmt
		formatting.shfmt,
		-- StyLua
		formatting.stylua,
		-- python
		formatting.black.with({
			extra_args = { "line-length", "120" },
		}),
		-- yapf无法配置max-line-length=120，暂时屏蔽
		formatting.yapf.with({
			extra_args = { "--style={column_limit=120}" },
		}),
		-- formatting.autopep8,
		formatting.autopep8.with({
			extra_args = { "--max-line-length", "120" },
		}),
		formatting.isort,

		-- c
		-- formatting.clang_format.with({
		-- 	filetypes = { "c", "cpp" },
		-- }),

		-- java使用jdtls自带格式化工具
		-- formatting.uncrustify.with({
		-- 	filetypes = {
		-- 		"java",
		-- 	},
		-- }),

		-- frontend
		formatting.prettier.with({ -- 只比默认配置少了 markdown
		     filetypes = {
			 "javascript",
			 "javascriptreact",
			 "typescript",                                                 
			 "typescriptreact",
			 "vue",
			 "css",
			 "scss",
			 "less",
			 "html",
			 "json",
			 -- "yaml",
			 "graphql",
			 -- "xml", -- xml使用lsp自带格式化
		     },
		     prefer_local = "node_modules/.bin",
		     extra_args = function(params)
			 if params.ft == "markdown" or params.ft == "vimwiki" then
			     return { "--tab-width", "4" }
			 elseif params.ft == "xml" then
			     return { "--parser", "xml" }
			 end
		     end,
		     condition = function()
			 return vim.fn.executable("prettier") > 0
		     end,
		}),
		-- formatting.fixjson,
		-- formatting.black.with({ extra_args = { "--fast" } }),
	},
	-- 保存自动格式化
	-- on_attach = function(client)
	--   if client.resolved_capabilities.document_formatting then
	--     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	--   end
	-- end,
})

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- map("v", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opt)
map("n", "<F4>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
-- local vimp = require("vimp")
-- vimp.vnoremap(opt, "<leader>f", vim.lsp.buf.range_formatting)

function format_range_operator()
	local old_func = vim.go.operatorfunc -- ERROR: Error executing lua: <path to init.lua>: attampt to index field 'go' (a nil value)
	_G.op_func_formatting = function()
		local start = vim.api.nvim_buf_get_mark(0, "[")
		local finish = vim.api.nvim_buf_get_mark(0, "]")
		vim.lsp.buf.range_formatting({}, start, finish)
		vim.go.operatorfunc = old_func
		_G.op_func_formatting = nil
	end
	vim.go.operatorfunc = "v:lua.op_func_formatting"
	vim.api.nvim_feedkeys("g@", "n", false)
end
map("v", "<leader>f", "<cmd>lua format_range_operator()<CR>", opt)
