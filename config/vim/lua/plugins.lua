local packer = require("packer")
packer.startup(
  function(use)
   -- Packer 可以管理自己本身
   use 'wbthomason/packer.nvim'
   -- 你的插件列表...
   use("folke/tokyonight.nvim")
   use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
   use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
   use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
   use("arkav/lualine-lsp-progress")
   use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
   -- telescope extensions
   use "LinArcX/telescope-env.nvim"
   use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

end)
