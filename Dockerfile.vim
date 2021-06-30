FROM java:latest
ENV container docker

ADD pkgs/vim/pkgs/* /opt/
RUN rm -rf /usr/lib/python3.9/site-packages/clang
RUN pacman -S vim clang --noconfirm

RUN mkdir -p /root/.vim/{autoload,bundle,rc} \
    && mv /opt/plug.vim ~/.vim/autoload/

# nvim
    #&& wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
RUN cd /opt &&  chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract && cp -fpr ./squashfs-root/usr/* /usr/\
    && mkdir -p ~/.config \
    && ln -s ~/.vim ~/.config/nvim \
    && ln -s ~/.vimrc ~/.config/nvim/init.vim \
    && rm -rf /opt/nvim.appimage \
    && ln -s /usr/bin/vim /usr/bin/vi 

# 使用universal ctags进行前端符号分析定义，提供给gtags使用（GNU tags）
# GTags （或者叫做 GNU GLOBAL）比起 ctags 来说，有几个主要的优点：
# 不但能查定义，还能查引用
# 原生支持 6 种语言（C，C++，Java，PHP4，Yacc，汇编）
# 扩展支持 50+ 种语言（包括 go/rust/scala 等，基本覆盖所有主流语言）
# 使用性能更好的本地数据库存储符号，而不是 ctags 那种普通文本文件
# 支持增量更新，每次只索引改变过的文件
# 多种输出格式，能更好的同编辑器相集成

# gtags for LeaderF and cscope, for vista
# archlinux中，ctags已经被universal-ctags收编
#RUN pacman -S universal-ctags --noconfirm \
RUN pacman -S ctags --noconfirm \
    && pacman -S global --noconfirm 

# 使用pygments进行前端符号分析引用，提供给gtags使用（GNU tags）
RUN pip3 install pygments

# 把所有插件copy进去
COPY pkgs/vim/vim-bundle /root/.vim/bundle/

# 安装markdown-preview
RUN cd /root/.vim/bundle/markdown-preview.nvim/app \
    && yarn install

# YCM
#ADD YouCompleteMe.tar.gz /root/.vim/bundle
RUN pacman -S cmake make --noconfirm 
RUN cd /root/.vim/bundle/ \
    #&& git clone --recursive https://github.com/ycm-core/YouCompleteMe \
    #&& /root/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang \
    # 支持java： --java-complete会去下载eclipse.jdt.ls，下载失败概率高。 直接使用下载好的，建议link使用
    #&& /root/.vim/bundle/YouCompleteMe/install.py --clangd-completer --java-complete \
    && mkdir -p /root/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/eclipse.jdt.ls/target/ \
    && ln -s /opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/ /root/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/eclipse.jdt.ls/target/repository \
    && /root/.vim/bundle/YouCompleteMe/install.py --clangd-completer \
    && cp /root/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py /root/

# 安装bash的lsp server, shfmt
RUN pacman -S npm shfmt --noconfirm \ 
    && npm i -g bash-language-server

# 安装LC
RUN cd /root/.vim/bundle/LanguageClient-neovim \
    && bash install.sh

# python-mode doc功能依赖
RUN pip install doq \
    && pacman -S pyright --noconfirm

COPY config/vim/vimrc /root/.vimrc
COPY config/vim/rc /root/.vim/rc
COPY config/vim/ycm_extra_conf.py /root/.vim/
