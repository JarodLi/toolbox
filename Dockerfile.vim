FROM tmux:latest
ENV container docker

ADD pkgs/vim/pkgs/* /opt/
#COPY pkgs/vim/pkgs /opt

RUN rm -rf /var/lib/rpm/*db* \
    && rpm --rebuilddb 
RUN yum install -y ncurses-devel
RUN mkdir -p /root/.vim/{autoload,bundle,rc}
#ADD pkgs/vim8.2-20200820.tar.gz /opt
RUN cd /opt/vim \
    && ./configure --with-features=huge --enable-python3interp=dynamic  --with-python-config-dir=/usr/lib/python3.7/config --enable-cscope --enable-multibyte --enable-luainterp=yes \
    && make \
    && make install \
    && rm -rf /usr/bin/vi \
    && ln -s /usr/local/bin/vim /usr/bin/vi \
    && cd /root/ \
    && rm -rf /opt/vim* \
    #&& curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    && mv /opt/plug.vim ~/.vim/autoload/

# nvim
    #&& wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
RUN cd /opt &&  chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract && cp -fpr ./squashfs-root/usr/* /usr/\
    && mkdir -p ~/.config \
    && ln -s ~/.vim ~/.config/nvim \
    && ln -s ~/.vimrc ~/.config/nvim/init.vim \
    && rm -rf /opt/nvim.appimage


# 使用universal ctags进行前端符号分析定义，提供给gtags使用（GNU tags）
# universal ctags
RUN cd /opt \
    #&& wget http://www.digip.org/jansson/releases/jansson-2.12.tar.gz \
    #&& tar xzvf jansson-2.12.tar.gz \
    && cd jansson* && ./configure && make && make check && make install \
    && cp /usr/local/lib/pkgconfig/jansson.pc  /usr/lib64/pkgconfig/ \
    && echo "/usr/local/lib" >> /etc/ld.so.conf.d/usr.conf \
    && ldconfig \
    && rm -rf /opt/jansson* \
    && yum install autoconf automake -y \
#ADD pkgs/ctags.tar.gz /opt
    #&& git clone https://github.com/universal-ctags/ctags.git \
    && cd /opt/ctags \ 
    && ./autogen.sh \
    && ./configure --prefix=/usr/bin/universal-ctags --enable-json \
    && make \
    && make install \
    && rm -rf /usr/bin/ctags \
    && ln -s /usr/bin/universal-ctags/bin/ctags  /usr/bin/ctags \
    #&& cd /usr/ \
    #&& ctags -R --output-format=e-ctags \
    && rm -rf /opt/ctags


# 使用pygments进行前端符号分析引用，提供给gtags使用（GNU tags）

# GTags （或者叫做 GNU GLOBAL）比起 ctags 来说，有几个主要的优点：
# 不但能查定义，还能查引用
# 原生支持 6 种语言（C，C++，Java，PHP4，Yacc，汇编）
# 扩展支持 50+ 种语言（包括 go/rust/scala 等，基本覆盖所有主流语言）
# 使用性能更好的本地数据库存储符号，而不是 ctags 那种普通文本文件
# 支持增量更新，每次只索引改变过的文件
# 多种输出格式，能更好的同编辑器相集成
RUN pip3 install pygments

# gtags for LeaderF and cscope
# 先安装编译依赖包
RUN yum install -y bison flex gperf libtool libtool-ltdl-devel texinfo  \

# https://www.gnu.org/software/global/download.html
#RUN wget http://tamacom.com/global/global-6.6.5.tar.gz -P /opt  \
# fix c99 compile bug
#&& obsutil cp obs://lijian-test/global-6.6.5.tar.gz . \
    #&& tar xzvf /opt/global-6.6.5.tar.gz -C /opt \
    && cd /opt/global-6.6.5 \
    && bash reconf.sh \
    && ./configure --with-sqlite3  \
    && make \
    && make install \
    && rm -rf /opt/global* \
    && yum remove -y texinfo, libtool-ltdl-devel libtool gperf flex bison 

# 把所有插件copy进去
COPY pkgs/vim/vim-bundle /root/.vim/bundle/

# 安装时使用系统clang，否则可能会出现和glibc版本不兼容的情况
RUN yum install -y cmake clang
# YCM
#ADD YouCompleteMe.tar.gz /root/.vim/bundle
RUN cd /root/.vim/bundle/ \
    #&& git clone --recursive https://github.com/ycm-core/YouCompleteMe \
    #&& /root/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang \
    && /root/.vim/bundle/YouCompleteMe/install.py --clangd-completer \
    && cp /root/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py /root/

COPY config/vim/vimrc /root/.vimrc
COPY config/vim/rc /root/.vim/rc
COPY config/vim/ycm_extra_conf.py /root/.vim/
