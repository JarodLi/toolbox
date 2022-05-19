local packer = require("packer")

packer.startup(function(use)
	-- Packer 可以管理自己本身
	use("wbthomason/packer.nvim")
	-- 自动会话管理
	use({
		"rmagatti/auto-session",
		config = function()
			require("plugin-config.autosession")
		end,
	})
	use({
		"glepnir/dashboard-nvim",
		requires = { "rmagatti/auto-session" },
		config = function()
			require("plugin-config.dashboard")
		end,
	})

	use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
	use({ "mhartington/oceanic-next" })

	use({ "olimorris/onedarkpro.nvim" })
	use({ "glepnir/zephyr-nvim" })
	-- use("ahmedkhalf/project.nvim")
	use("folke/tokyonight.nvim")
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"kyazdani42/nvim-tree.lua",
		-- requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugin-config.nvim-tree")
		end,
	})
	-- use({"romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
	use({ "moll/vim-bbye" })
	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
		config = function()
			require("plugin-config.bufferlines")
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", "akinsho/bufferline.nvim" },
		config = function()
			require("plugin-config.lualine")
		end,
	})
	use({ "kana/vim-textobj-function" })
	use({
		"bps/vim-textobj-python",
		config = function()
			require("plugin-config.textobj")
		end,
		ft = { "python" },
	})
	-- use 'feline-nvim/feline.nvim'
	-- use({"vim-airline/vim-airline"})
	-- use({"kdheepak/tabline.nvim"})
	use({
		"arkav/lualine-lsp-progress",
		-- ft = { "python", "java", "c", "cpp", "lua", "sh", "fish", "markdown" }
	})
	use({ "nvim-telescope/telescope-project.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin-config.telescope")
		end,
	})

	-- telescope extensions
	use("LinArcX/telescope-env.nvim")

	use({
		"p00f/nvim-ts-rainbow", -- 彩虹括号
		config = function()
			require("plugin-config.nvim-ts-rainbow")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"p00f/nvim-ts-rainbow", -- 彩虹括号
		},
		-- run = ":TSUpdate",
		config = function()
			require("plugin-config.nvim-treesitter")
		end,
	})
	use({
		"williamboman/nvim-lsp-installer",
		config = function()
			require("plugin-config.nvim-lsp-installer")
		end,
		-- ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})
	-- 注意lspconfig放到lspsaga后面加载，否则lint来源信息会丢失
	use({
		"neovim/nvim-lspconfig",
		-- requires = { "tami5/lspsaga.nvim" },
		config = function()
			require("plugin-config.nvim-lspconfig")
		end,
		-- ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})
	-- LSP UI 美化
	use({
		"tami5/lspsaga.nvim",
		config = function()
			require("plugin-config.lspsaga")
		end,
		-- ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})

	-- LSP 进度提示
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("plugin-config.fidget")
		end,
		-- ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})
	-- 插入模式获得函数签名
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("plugin-config.lsp_signature")
		end,
		-- ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})
	-- 灯泡提示代码行为
	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			require("plugin-config.nvim-lightbulb")
		end,
		ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})

	-- 自动代码补全系列插件
	use({
		"hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
		requires = {
			{ "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
			{ "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
			{ "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
			{ "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
			{ "hrsh7th/cmp-path" }, -- 路径补全
			{ "hrsh7th/cmp-buffer" }, -- 缓冲区补全
			{ "hrsh7th/cmp-cmdline" }, -- 命令补全
			{ "f3fora/cmp-spell" }, -- 拼写建议
			{ "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
			{ "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
			--{"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全, 可以执行install.sh，将二进制下载下来然后离线安装
			{ "tzachar/cmp-tabnine" },
		},
		config = function()
			require("plugin-config.lsp-cmp")
		end,
		-- ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})

	-- 扩展 LSP 诊断
	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("plugin-config.nvim-lint")
		end,
		ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})

	use("fcying/telescope-ctags-outline.nvim")
	use({ "filipdutescu/renamer.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use({
		"numToStr/Comment.nvim",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("plugin-config.comment")
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugin-config.autopairs")
		end,
	})
	-- use {
	-- "windwp/windline.nvim",
	--config = function()
	---- 插件加载完成后自动运行 lua/conf/windline.lua 文件中的代码
	--require("plugin_config.windline")
	--end
	-- }
	-- 自动保存
	-- use { "Pocco81/AutoSave.nvim", }
	-- 自动恢复光标位置
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("plugin-config.lastplace")
		end,
	})
	-- 搜索时显示条目
	use({
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("plugin-config.nvim-hlslens")
		end,
	})

	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("plugin-config.symbols-outline")
		end,
	})

	-- 显示缩进线
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugin-config.indent-blankline")
		end,
		-- ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})

	-- 快速跳转
	use({
		"phaazon/hop.nvim",
		config = function()
			require("plugin-config.hop")
		end,
	})
	-- 显示光标下相同词汇
	use({
		"RRethy/vim-illuminate",
		config = function()
			require("plugin-config.vim-illuminate")
		end,
	})
	-- 拼写检查器
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("plugin-config.spellsitter")
		end,
	})

	-- 包裹修改
	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("plugin-config.surround")
		end,
	})
	-- ths is a baad
	-- local avar = "hello"
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin-config.gitsigns")
		end,
	})

	-- 代码格式化
	-- use({ "sbdchd/neoformat" })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugin-config.null-ls")
		end,
		ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})

	-- 精美弹窗
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("plugin-config.nvim-notify")
		end,
	})

	-- todo tree
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("plugin-config.todo-comments")
		end,
	})
	-- use { "f-person/git-blame.nvim", }
	use({ "tveskag/nvim-blame-line" })

	use({
		"rmagatti/goto-preview",
		config = function()
			require("plugin-config.goto-preview")
		end,
	})
	use({
		"heavenshell/vim-pydocstring",
		config = function()
			require("plugin-config.pydocstring")
		end,
		ft = { "python" },
	})
	use({
		"chentoast/marks.nvim",
		config = function()
			require("plugin-config.marks")
		end,
	})
	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("plugin-config.glow")
		end,
		ft = { "markdown" },
	})
	-- use({ "leisiji/interestingwords.nvim" })
	-- use({ "justinmk/vim-dirvish" })

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("plugin-config.nvim-dap")
		end,
		ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})
	use({
		"theHamsta/nvim-dap-virtual-text",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("plugin-config.nvim-dap-virtual-text")
		end,
		ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("plugin-config.nvim-dap-ui")
		end,
		ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})

	use({
		"mfussenegger/nvim-jdtls",
		config = function()
			require("plugin-config.nvim-jdtls")
		end,
		ft = { "java" },
	})
	use({
		"wfxr/minimap.vim",
		config = function()
			require("plugin-config.minimap")
		end,
	})
	use({
		"psliwka/vim-smoothie",
		config = function()
			require("plugin-config.vim-smoothie")
		end,
		-- ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugin-config.toggleterm")
		end,
	})
	use({
		"rhysd/accelerated-jk",
		config = function()
			require("plugin-config.accelerated-jk")
		end,
	})
	use({
		"hrsh7th/vim-eft",
		config = function()
			require("plugin-config.vim-eft")
		end,
	})
	use({ "norcalli/nvim-colorizer.lua" })
	use({
		"gbprod/yanky.nvim",
		config = function()
			require("plugin-config.yankv")
		end,
	})
	use({ "kdheepak/lazygit.nvim" })
	use({
		"nvim-pack/nvim-spectre",
		requires = {
			"nvim-lua/plenary.nvim", -- Lua 开发模块
			"BurntSushi/ripgrep", -- 文字查找
		},
		config = function()
			require("plugin-config.nvim-spectre")
		end,
	})
	use({
		"mbbill/undotree",
		config = function()
			require("plugin-config.undotree")
		end,
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("plugin-config.which-key")
		end,
	})
	-- use { 'michaelb/sniprun', run = 'bash ./install.sh'}
	use({
		"michaelb/sniprun",
		config = function()
			require("plugin-config.sniprun")
		end,
		ft = { "python", "lua", "java", "c", "cpp", "markdown", "bash", "fish" },
	})
	-- use({
	-- 	"kassio/neoterm",
	-- 	config = function()
	-- 		require("plugin-config.neoterm")
	-- 	end,
	-- })
end)

-- 实时生效配置
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
