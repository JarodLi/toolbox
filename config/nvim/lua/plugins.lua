local packer = require("packer")

packer.startup(function(use)
	-- Packer 可以管理自己本身
	use("wbthomason/packer.nvim")
	use("glepnir/dashboard-nvim")

	use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
	use({ "mhartington/oceanic-next" })
	use({ "olimorris/onedarkpro.nvim" })
	use({ "glepnir/zephyr-nvim" })
	-- use("ahmedkhalf/project.nvim")
	use("folke/tokyonight.nvim")
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	-- use({"romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "bps/vim-textobj-python" })
	-- use 'feline-nvim/feline.nvim'
	-- use({"vim-airline/vim-airline"})
	-- use({"kdheepak/tabline.nvim"})
	use("arkav/lualine-lsp-progress")
	-- use({ "nvim-telescope/telescope-project.nvim" })
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })

	use({ "simrat39/symbols-outline.nvim" })
	-- telescope extensions
	use("LinArcX/telescope-env.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"p00f/nvim-ts-rainbow", -- 彩虹括号
		},
		run = ":TSUpdate",
	})
	-- lspconfig
	use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
	-- LSP UI 美化
	use({ "tami5/lspsaga.nvim" })

	-- LSP 进度提示
	use({ "j-hui/fidget.nvim" })
	-- 插入模式获得函数签名
	use({ "ray-x/lsp_signature.nvim" })
	-- 灯泡提示代码行为
	use({ "kosayoda/nvim-lightbulb" })

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
	})

	-- 扩展 LSP 诊断
	use({ "mfussenegger/nvim-lint" })

	use("fcying/telescope-ctags-outline.nvim")
	use({ "filipdutescu/renamer.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	use({ "numToStr/Comment.nvim", requires = { "JoosepAlviste/nvim-ts-context-commentstring" } })
	use("windwp/nvim-autopairs")
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
	use({ "ethanholz/nvim-lastplace" })
	-- 自动会话管理
	use({ "rmagatti/auto-session" })
	-- 搜索时显示条目
	use({ "kevinhwang91/nvim-hlslens" })

	-- 显示缩进线
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- 快速跳转
	use({ "phaazon/hop.nvim" })
	-- 显示光标下相同词汇
	use({ "RRethy/vim-illuminate" })
	-- 拼写检查器
	use({ "lewis6991/spellsitter.nvim" })

	-- 包裹修改
	use({ "ur4ltz/surround.nvim" })
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- 代码格式化
	-- use({ "sbdchd/neoformat" })
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

	-- 精美弹窗
	use({ "rcarriga/nvim-notify" })

	-- todo tree
	use({ "folke/todo-comments.nvim" })
	-- use { "f-person/git-blame.nvim", }
	use({ "tveskag/nvim-blame-line" })

	use({ "kana/vim-textobj-function" })
	use({ "rmagatti/goto-preview" })
	use({ "heavenshell/vim-pydocstring" })
	use({ "chentau/marks.nvim" })
	use({ "ellisonleao/glow.nvim" })
	-- use({ "leisiji/interestingwords.nvim" })
	-- use({ "justinmk/vim-dirvish" })

	use({ "mfussenegger/nvim-dap" })
	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "rcarriga/nvim-dap-ui" })

	use("mfussenegger/nvim-jdtls")
	use("wfxr/minimap.vim")
	use("psliwka/vim-smoothie")
	use("rhysd/accelerated-jk")
	use("hrsh7th/vim-eft")
	use("akinsho/toggleterm.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("gbprod/yanky.nvim")
	use({                                                                                                                       
	   "nvim-pack/nvim-spectre",
	   requires = {
	   "nvim-lua/plenary.nvim", -- Lua 开发模块
	   "BurntSushi/ripgrep", -- 文字查找
	   },
	   })
	use("mbbill/undotree")
	use("folke/which-key.nvim")

end)

-- 实时生效配置
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
