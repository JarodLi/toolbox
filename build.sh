function pre() {
	rm -rf pkgs
	obsutil cp obs://lijian-test/my_pkgs.tar.gz .
	tar xzvf my_pkgs.tar.gz && rm -rf my_pkgs.tar.gz
}

function pre_tmux() {
	#wget https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz -P pkgs/tmux
	#git clone https://github.com/tmux-plugins/tpm pkgs/tmux
	rm -rf pkgs/tmux/oh-my-tmux
	git clone https://github.com/gpakosz/.tmux.git pkgs/tmux/oh-my-tmux
	return 0
}

function pre_python() {
	# rm -rf pkgs/python
	# mkdir -p pkgs/python
	# wget https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3/setuptools-41.0.1.zip -P pkgs/python
	# wget https://files.pythonhosted.org/packages/ce/ea/9b445176a65ae4ba22dce1d93e4b5fe182f953df71a145f557cffaffc1bf/pip-19.3.1.tar.gz -P pkgs/python
	return 0
}

function pre_vim() {
	#wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage pkgs/vim/pkgs
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P pkgs/vim/pkgs
	#curl -fLo pkgs/vim/pkgs/plug.vim  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	#wget http://tamacom.com/global/global-6.6.5.tar.gz -P pkgs/vim/pkgs
	#git clone https://github.com/universal-ctags/ctags.git pkgs/vim/pkgs

	rm -rf pkgs/vim/vim-bundle
	mkdir -p pkgs/vim/vim-bundle
	cd pkgs/vim/vim-bundle
	git clone --depth 1 https://github.com/Yggdroot/indentLine || exit 1
	git clone --depth 1 https://github.com/jiangmiao/auto-pairs || exit 1
	git clone --depth 1 https://github.com/jlanzarotta/bufexplorer || exit 1
	git clone --depth 1 https://github.com/vim-airline/vim-airline || exit 1
	git clone --depth 1 https://github.com/vim-airline/vim-airline-themes || exit 1
	git clone --depth 1 https://github.com/tpope/vim-surround || exit 1
	git clone --depth 1 https://github.com/flazz/vim-colorschemes || exit 1
	git clone --depth 1 https://github.com/bronson/vim-trailing-whitespace || exit 1

	git clone https://github.com/sjl/gundo.vim || exit 1
	git clone https://github.com/dense-analysis/ale.git || exit 1
	git clone https://github.com/Yggdroot/LeaderF.git || exit 1
	git clone https://github.com/ludovicchabant/vim-gutentags.git || exit 1
	git clone https://github.com/kana/vim-textobj-user.git || exit 1
	git clone https://github.com/kana/vim-textobj-indent.git || exit 1
	git clone https://github.com/kana/vim-textobj-syntax.git || exit 1
	git clone https://github.com/kana/vim-textobj-function.git || exit 1
	git clone https://github.com/sgur/vim-textobj-parameter.git || exit 1

	git clone https://github.com/prabirshrestha/vim-lsp.git || exit 1
	git clone https://github.com/MattesGroeger/vim-bookmarks.git || exit 1
	git clone https://github.com/liuchengxu/vista.vim.git || exit 1
	git clone https://github.com/jacoborus/tender.vim.git || exit 1
	git clone https://github.com/lfv89/vim-interestingwords || exit 1

	git clone https://github.com/Shougo/defx.nvim.git || exit 1
	git clone https://github.com/roxma/nvim-yarp.git || exit 1
	git clone https://github.com/roxma/vim-hug-neovim-rpc.git || exit 1
	git clone https://github.com/scrooloose/nerdcommenter.git || exit 1

	git clone https://github.com/sillybun/vim-async.git || exit 1
	# 支持异步运行python || exit 1
	git clone https://github.com/skywind3000/asyncrun.vim.git || exit 1
	git clone https://github.com/skywind3000/asynctasks.vim.git || exit 1
	git clone https://github.com/prabirshrestha/async.vim.git || exit 1
	git clone https://github.com/skywind3000/vim-preview.git || exit 1
	git clone https://github.com/skywind3000/gutentags_plus.git || exit 1
	git clone https://github.com/morhetz/gruvbox || exit 1
	git clone https://github.com/nanotech/jellybeans.vim || exit 1
	git clone https://github.com/mbbill/desertEx || exit 1
	# Python开发环境配置 || exit 1
	#git clone https://github.com/ryanolsonx/vim-lsp-python.git || exit 1
	git clone --recurse-submodules -b master https://github.com/python-mode/python-mode.git || exit 1
	git clone https://github.com/heavenshell/vim-pydocstring || exit 1
	# 安装docstring信赖的doq || exit 1
	git clone https://github.com/Vimjas/vim-python-pep8-indent.git || exit 1
	git clone https://github.com/jeetsukumaran/vim-pythonsense.git || exit 1

	#git clone --recursive https://github.com/ycm-core/YouCompleteMe || exit 1
	# github.com/LooEv/A-bridge-to-YouCompleteMe
	wget -O YouCompleteMe.tar.gz "http://106.53.74.248:8888/YouCompleteMe.tar.gz" || exit 1
	tar xzvf YouCompleteMe.tar.gz
	git clone https://github.com/mg979/vim-visual-multi.git || exit 1
	git clone https://github.com/uguu-org/vim-matrix-screensaver.git || exit 1
	git clone https://github.com/iamcco/markdown-preview.nvim.git || exit 1
	git clone https://github.com/autozimu/LanguageClient-neovim.git || exit 1
	git clone https://github.com/tell-k/vim-autoflake.git || exit 1
	git clone https://github.com/octol/vim-cpp-enhanced-highlight || exit 1
	git clone https://github.com/mhinz/vim-signify || exit 1
	git clone https://github.com/edkolev/tmuxline.vim || exit 1
	git clone https://github.com/tpope/vim-fugitive || exit 1
	git clone https://github.com/bling/vim-bufferline || exit 1
	git clone https://github.com/Shougo/echodoc.vim || exit 1
	git clone https://github.com/tpope/vim-abolish || exit 1
	git clone https://github.com/sbdchd/vim-shebang || exit 1
	git clone https://github.com/justinmk/vim-dirvish || exit 1
	git clone https://github.com/honza/vim-snippets.git || exit 1
	git clone https://github.com/jpalardy/vim-slime || exit 1
	git clone https://github.com/easymotion/vim-easymotion || exit 1
	git clone https://github.com/skywind3000/vim-terminal-help || exit 1
	git clone https://github.com/ekalinin/Dockerfile.vim || exit 1
	git clone https://github.com/voldikss/vim-floaterm || exit 1
	git clone https://github.com/voldikss/LeaderF-floaterm || exit 1
	git clone https://github.com/kien/rainbow_parentheses.vim || exit 1
	git clone https://github.com/neoclide/coc.nvim.git || exit 1
	cd -
}

function pre_nvim() {
	rm -rf pkgs/nvim/plugins
	mkdir -p pkgs/nvim/plugins
	cd pkgs/nvim/plugins
	git clone http://github.com/wbthomason/packer.nvim || exit 1
	git clone http://github.com/glepnir/dashboard-nvim || exit 1
	git clone http://github.com/ellisonleao/gruvbox.nvim || exit 1
	git clone http://github.com/rktjmp/lush.nvim || exit 1
	git clone http://github.com/mhartington/oceanic-next || exit 1
	git clone http://github.com/olimorris/onedarkpro.nvim || exit 1
	git clone http://github.com/glepnir/zephyr-nvim || exit 1
	git clone http://github.com/folke/tokyonight.nvim || exit 1
	git clone http://github.com/kyazdani42/nvim-tree.lua || exit 1
	git clone http://github.com/kyazdani42/nvim-web-devicons || exit 1
	git clone http://github.com/akinsho/bufferline.nvim || exit 1
	git clone http://github.com/moll/vim-bbye || exit 1
	git clone http://github.com/nvim-lualine/lualine.nvim || exit 1
	git clone http://github.com/bps/vim-textobj-python || exit 1
	git clone http://github.com/arkav/lualine-lsp-progress || exit 1
	git clone http://github.com/nvim-telescope/telescope.nvim || exit 1
	git clone http://github.com/nvim-telescope/telescope-project.nvim || exit 1
	git clone http://github.com/nvim-lua/plenary.nvim || exit 1
	git clone http://github.com/simrat39/symbols-outline.nvim || exit 1
	git clone http://github.com/LinArcX/telescope-env.nvim || exit 1
	git clone http://github.com/nvim-treesitter/nvim-treesitter || exit 1
	git clone http://github.com/p00f/nvim-ts-rainbow || exit 1
	git clone http://github.com/neovim/nvim-lspconfig || exit 1
	git clone http://github.com/williamboman/nvim-lsp-installer || exit 1
	git clone http://github.com/tami5/lspsaga.nvim || exit 1
	git clone http://github.com/mfussenegger/nvim-jdtls || exit 1
	git clone http://github.com/j-hui/fidget.nvim || exit 1
	git clone http://github.com/ray-x/lsp_signature.nvim || exit 1
	git clone http://github.com/kosayoda/nvim-lightbulb || exit 1
	git clone http://github.com/hrsh7th/nvim-cmp || exit 1
	git clone http://github.com/onsails/lspkind-nvim || exit 1
	git clone http://github.com/hrsh7th/vim-vsnip || exit 1
	git clone http://github.com/hrsh7th/cmp-vsnip || exit 1
	git clone http://github.com/hrsh7th/cmp-nvim-lsp || exit 1
	git clone http://github.com/hrsh7th/cmp-path || exit 1
	git clone http://github.com/hrsh7th/cmp-buffer || exit 1
	git clone http://github.com/hrsh7th/cmp-cmdline || exit 1
	git clone http://github.com/f3fora/cmp-spell || exit 1
	git clone http://github.com/rafamadriz/friendly-snippets || exit 1
	git clone http://github.com/lukas-reineke/cmp-under-comparator || exit 1
	git clone http://github.com/tzachar/cmp-tabnine || exit 1
	git clone http://github.com/mfussenegger/nvim-lint || exit 1
	git clone http://github.com/fcying/telescope-ctags-outline.nvim || exit 1
	git clone http://github.com/filipdutescu/renamer.nvim || exit 1
	git clone http://github.com/numToStr/Comment.nvim || exit 1
	git clone http://github.com/JoosepAlviste/nvim-ts-context-commentstring || exit 1
	git clone http://github.com/windwp/nvim-autopairs || exit 1
	git clone http://github.com/Pocco81/AutoSave.nvim || exit 1
	git clone http://github.com/ethanholz/nvim-lastplace || exit 1
	git clone http://github.com/rmagatti/auto-session || exit 1
	git clone http://github.com/kevinhwang91/nvim-hlslens || exit 1
	git clone http://github.com/lukas-reineke/indent-blankline.nvim || exit 1
	git clone http://github.com/phaazon/hop.nvim || exit 1
	git clone http://github.com/RRethy/vim-illuminate || exit 1
	git clone http://github.com/lewis6991/spellsitter.nvim || exit 1
	git clone http://github.com/ur4ltz/surround.nvim || exit 1
	git clone http://github.com/lewis6991/gitsigns.nvim || exit 1
	git clone http://github.com/sbdchd/neoformat || exit 1
	git clone http://github.com/jose-elias-alvarez/null-ls.nvim || exit 1
	git clone http://github.com/rcarriga/nvim-notify || exit 1
	git clone http://github.com/folke/todo-comments.nvim || exit 1
	git clone http://github.com/tveskag/nvim-blame-line || exit 1
	git clone http://github.com/kana/vim-textobj-function || exit 1
	git clone http://github.com/rmagatti/goto-preview || exit 1
	git clone http://github.com/heavenshell/vim-pydocstring || exit 1
	git clone http://github.com/chentau/marks.nvim || exit 1
	git clone http://github.com/ellisonleao/glow.nvim || exit 1
	git clone http://github.com/leisiji/interestingwords.nvim || exit 1
	git clone http://github.com/justinmk/vim-dirvish || exit 1
	git clone http://github.com/mfussenegger/nvim-dap || exit 1
	git clone http://github.com/theHamsta/nvim-dap-virtual-text || exit 1
	git clone http://github.com/rcarriga/nvim-dap-ui || exit 1
	git clone http://github.com/wfxr/minimap.vim.git || exit 1
	git clone http://github.com/psliwka/vim-smoothie.git || exit 1
	git clone http://github.com/psliwka/vim-smoothie.git || exit 1
	git clone http://github.com/rhysd/accelerated-jkt || exit 1
	git clone http://github.com/hrsh7th/vim-eft || exit 1
	git clone http://github.com/norcalli/nvim-colorizer.lua || exit 1	
	git clone http://github.com/gbprod/yanky.nvim || exit 1	
	git clone http://github.com/kdheepak/lazygit.nvim || exit 1	
	
	cd -
}

function pre_zsh() {
	cd pkgs/zsh/
	rm -rf zsh-syntax*
	rm -rf zsh-auto*
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
	git clone https://github.com/zsh-users/zsh-autosuggestions.git
	cd -
}

function pre_c() {
	rm -rf pkgs/c
	mkdir -p pkgs/c
	cd pkgs/c
	# download gcc and deps
	#wget https://ftp.gnu.org/gnu/mpc/mpc-1.2.0.tar.gz
	#wget https://ftp.gnu.org/gnu/gmp/gmp-6.2.0.tar.xz
	#wget https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.gz
	#wget https://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
	#wget http://isl.gforge.inria.fr/isl-0.22.tar.xz
	# download cmake
	#wget https://github.com/Kitware/CMake/releases/download/v3.18.2/cmake-3.18.2.tar.gz
	#wget https://github.com/Kitware/CMake/releases/download/v3.17.5/cmake-3.17.5-Linux-x86_64.tar.gz
	#wget https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
	# glibc
	#wget https://ftp.gnu.org/gnu/glibc/glibc-2.32.tar.gz
	# cland
	#wget https://github.com/clangd/clangd/releases/download/10.0.0/clangd-linux-10.0.0.zip
	cd -
}

function main() {
	docker images | grep none | awk '{print $3}' | xargs -I{} docker rmi {} -f
	today=$(date "+%Y%m%d")
	build_args="--no-cache"
	docker build . -f Dockerfile.basic -t basic:latest --rm --no-cache || exit 1
	docker build . -f Dockerfile.zsh -t zsh:latest --rm --no-cache || exit 1
	docker build . -f Dockerfile.tmux -t tmux:latest --rm --no-cache || exit 1
	docker build . -f Dockerfile.python -t python:latest --rm || exit 1
	docker build . -f Dockerfile.c -t c:latest --rm --no-cache || exit 1
	docker build . -f Dockerfile.java -t java:latest --rm --no-cache || exit 1
	docker build . -f Dockerfile.vim -t vim:latest --rm --no-cache || exit 1
	docker build . -f Dockerfile.nvim -t nvim:latest --rm --no-cache || exit 1
	docker build . -f Dockerfile.fish -t fish:latest --rm --no-cache || exit 1
	docker build . -f Dockerfile.my -t my:${today} --rm || exit 1
	docker save my:${today} >my_${today}.tar
	obsutil cp my_${today}.tar obs://lijian-test1 && rm -rf my_${today}.tar
}

        pre &&
	pre_tmux 
	pre_zsh &&
	pre_c &&
	pre_python &&
	pre_vim &&
        pre_nvim &&
	main
