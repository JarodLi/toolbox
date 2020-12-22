function pre()
{
    rm -rf pkgs
    obsutil cp obs://lijian-test/my_pkgs.tar.gz .
    tar xzvf my_pkgs.tar.gz && rm -rf my_pkgs.tar.gz 
}


function pre_tmux()
{
    rm -rf pkgs/tmux
    mkdir -p pkgs/tmux
    wget https://github.com/tmux/tmux/releases/download/3.2-rc/tmux-3.2-rc2.tar.gz -P /pkgs/tmux
    git clone https://github.com/tmux-plugins/tpm pkgs/tmux
}

function pre_python()
{
    rm -rf pkgs/python
    mkdir -p pkgs/python
    wget https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3/setuptools-41.0.1.zip -P pkgs/python
    wget https://files.pythonhosted.org/packages/ce/ea/9b445176a65ae4ba22dce1d93e4b5fe182f953df71a145f557cffaffc1bf/pip-19.3.1.tar.gz -P pkgs/python
}

function pre_vim()
{
    rm -rf pkgs/vim
    mkdir -p pkgs/vim/pkgs
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage pkgs/vim/pkgs
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim pkgs/vim/pkgs
    curl -fLo pkgs/vim/pkgs/plug.vim  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    wget http://tamacom.com/global/global-6.6.5.tar.gz -P pkgs/vim/pkgs
    git clone https://github.com/universal-ctags/ctags.git pkgs/vim/pkgs

    rm -rf pkgs/vim/vim-bundle
    mkdir -p pkgs/vim/vim-bundle
    cd pkgs/vim/vim-bundle
    git clone --depth 1 https://github.com/Yggdroot/indentLine || exit 1
    git clone --depth 1 https://github.com/jiangmiao/auto-pairs || exit 1 || exit 1
    git clone --depth 1 https://github.com/jlanzarotta/bufexplorer || exit 1
    git clone --depth 1 https://github.com/bling/vim-airline || exit 1
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
    git clone https://github.com/prabirshrestha/async.vim.git || exit 1
    git clone https://github.com/skywind3000/vim-preview.git || exit 1
    git clone https://github.com/skywind3000/gutentags_plus.git || exit 1
    git clone https://github.com/morhetz/gruvbox || exit 1
    git clone https://github.com/nanotech/jellybeans.vim || exit 1
    git clone https://github.com/mbbill/desertEx || exit 1
    # Python开发环境配置 || exit 1
    git clone https://github.com/ryanolsonx/vim-lsp-python.git || exit 1
    git clone --recurse-submodules -b master https://github.com/python-mode/python-mode.git || exit 1
    git clone https://github.com/heavenshell/vim-pydocstring || exit 1
   # 安装docstring信赖的doq || exit 1
    git clone https://github.com/Vimjas/vim-python-pep8-indent.git || exit 1
    git clone https://github.com/jeetsukumaran/vim-pythonsense.git || exit 1

    git clone --recursive https://github.com/ycm-core/YouCompleteMe || exit 1
    git clone https://github.com/mg979/vim-visual-multi.git || exit 1
    git clone https://github.com/uguu-org/vim-matrix-screensaver.git || exit 1
    cd -
}

function pre_zsh()
{
    cd pkgs/zsh/
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
    git clone https://github.com/zsh-users/zsh-autosuggestions.git
}


function pre_c()
{
    rm -rf pkgs/c
    mkdir -p pkgs/c
    cd pkgs/c
    # download gcc and deps
    wget https://ftp.gnu.org/gnu/mpc/mpc-1.2.0.tar.gz
    wget https://ftp.gnu.org/gnu/gmp/gmp-6.2.0.tar.xz
    wget https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.gz
    wget https://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
    wget http://isl.gforge.inria.fr/isl-0.22.tar.xz 
    # download cmake
    #wget https://github.com/Kitware/CMake/releases/download/v3.18.2/cmake-3.18.2.tar.gz
    wget https://github.com/Kitware/CMake/releases/download/v3.17.5/cmake-3.17.5-Linux-x86_64.tar.gz
    wget https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
    # glibc
    wget https://ftp.gnu.org/gnu/glibc/glibc-2.32.tar.gz
    # cland
    wget https://github.com/clangd/clangd/releases/download/10.0.0/clangd-linux-10.0.0.zip
}

function main()
{
    today=$(date "+%Y%m%d")
    build_args="--no-cache"
    docker build . -f Dockerfile.basic -t basic:latest --rm --no-cache || exit 1
    docker build . -f Dockerfile.zsh -t zsh:latest --rm --no-cache || exit 1
    docker build . -f Dockerfile.tmux -t tmux:latest --rm --no-cache || exit 1
    docker build . -f Dockerfile.python -t python:latest --rm --no-cache || exit 1
    docker build . -f Dockerfile.vim -t vim:latest --rm --no-cache || exit 1
    docker build . -f Dockerfile.my  -t my:${today} --rm --no-cache || exit 1
    docker save my:${today} > my_${today}.tar
    obsutil cp my_${today}.tar obs://lijian-test && rm -rf my_${today}.tar
}

#pre &&
#pre_tmux &&
#pre_zsh &&
#pre_python &&
#pre_vim && 
main
