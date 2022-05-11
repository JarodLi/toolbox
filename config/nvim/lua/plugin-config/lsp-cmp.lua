local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	---@diagnostic disable-next-line: redundant-parameter
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` users.
			-- require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` users.
			-- vim.fn["UltiSnips#Anon"](args.body)

			-- For `snippy` users.
			-- require'snippy'.expand_snippet(args.body)
		end,
	},
	-- 补全源
	sources = cmp.config.sources({
		-- { name = "nvim_lsp" },
		-- For vsnip users.
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "cmdline" },
		{ name = "spell" },

		-- For luasnip users.
		-- { name = 'luasnip' },

		--For ultisnips users.
		-- { name = 'ultisnips' },

		-- -- For snippy users.
		-- { name = 'snippy' },
	}),

	-- 快捷键设置
	mapping = require("keybindings").cmp(cmp),

	-- 格式化补全菜单
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 50,
			before = function(entry, vim_item)
				vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
				return vim_item
			end,
		}),
	},

	-- 对补全建议排序
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			require("cmp-under-comparator").under,
			require("cmp_tabnine.compare"),
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		-- cmd中使用cmp补全无法使用tab，暂时注释掉
	        -- { name = "cmdline" },
	}),
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require("lspconfig").clangd.setup({
	capabilities = capabilities,
})
