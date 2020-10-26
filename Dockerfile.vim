FROM python:latest
ENV container docker

ADD pkgs/vim/pkgs/* /opt/
RUN pacman -S vim clang --noconfirm

RUN mkdir -p /root/.vim/{autoload,bundle,rc} \
    && mv /opt/plug.vim ~/.vim/autoload/

# nvim
    #&& wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
RUN cd /opt &&  chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract && cp -fpr ./squashfs-root/usr/* /usr/\
    && mkdir -p ~/.config \
    && ln -s ~/.vim ~/.config/nvim \
    && ln -s ~/.vimrc ~/.config/nvim/init.vim \
    && rm -rf /opt/nvim.appimage

# 使用universal ctags进行前端符号分析定义，提供给gtags使用（GNU tags）
# GTags （或者叫做 GNU GLOBAL）比起 ctags 来说，有几个主要的优点：
# 不但能查定义，还能查引用
# 原生支持 6 种语言（C，C++，Java，PHP4，Yacc，汇编）
# 扩展支持 50+ 种语言（包括 go/rust/scala 等，基本覆盖所有主流语言）
# 使用性能更好的本地数据库存储符号，而不是 ctags 那种普通文本文件
# 支持增量更新，每次只索引改变过的文件
# 多种输出格式，能更好的同编辑器相集成

# gtags for LeaderF and cscope
RUN pacman -S universal-ctags --noconfirm \
    && pacman -S global --noconfirm 

# 使用pygments进行前端符号分析引用，提供给gtags使用（GNU tags）
RUN pip3 install pygments

# 把所有插件copy进去
COPY pkgs/vim/vim-bundle /root/.vim/bundle/

# YCM
#ADD YouCompleteMe.tar.gz /root/.vim/bundle
RUN pacman -S cmake make --noconfirm \
    && cd /root/.vim/bundle/ \
    #&& git clone --recursive https://github.com/ycm-core/YouCompleteMe \
    #&& /root/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang \
    && /root/.vim/bundle/YouCompleteMe/install.py --clangd-completer \
    && cp /root/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py /root/

COPY config/vim/vimrc /root/.vimrc
COPY config/vim/rc /root/.vim/rc
COPY config/vim/ycm_extra_conf.py /root/.vim/
