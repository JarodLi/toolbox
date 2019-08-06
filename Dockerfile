FROM centos:latest
ENV container docker
ARG ak
ARG sk

RUN sed -i '/tsflags/d' /etc/yum.conf  

RUN yum install -y wget \
    && yum install -y make \
    && yum install -y gcc-c++\
    && yum install -y zlib-devel \
    && yum install -y perl \
    && yum install -y libffi-devel \
    && yum install -y unzip \
    && yum install -y dos2unix \
    && yum install -y tree \
    && yum install -y ncurses-devel \
    && yum install -y cmake \
    && yum install -y git \
    #&& yum install -y ctags \
    && yum install -y autoconf \
    && yum install -y automake \
    && yum install -y bison \
    && yum install -y flex \
    && yum install -y gperf \
    && yum install -y libtool \
    && yum install -y libtool-ltdl-devel \
    && yum install -y texinfo \
    && yum install -y bison \
    && yum install -y python-devel \
    && yum install -y man \
    && yum install -y man-pages \
    && yum install -y man-pages-zh-CN \
    && yum install -y openssh-server \
    && yum install -y openssh \
    && yum install -y unzip \
    && yum install -y initscripts \
    && yum install -y lsof \
    && yum install -y shadow-utils \
    && yum install -y bind-utils \
    && yum install -y traceroute \
    && yum install -y bash-completion \
# sqlite必须在python3编译前安装
    && yum install -y sqlite \
    && yum install -y sqlite-devel \
    && yum install -y file \
    && yum install -y util-linux \
    && yum install -y which \
    && yum install -y sshpass \
    && yum install -y zip \
    && yum install -y bc

# openssl 1.1.1c
#ADD openssl-1.1.1c.tar.gz /opt
#ADD https://www.openssl.org/source/openssl-1.1.1c.tar.gz /opt

RUN wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz -P /opt \
    && tar xzvf /opt/openssl-1.1.1c.tar.gz -C /opt \
    && cd /opt/openssl-1.1.1c \
    && ./config --prefix=/usr --openssldir=/usr/openssl shared zlib \
    && make \
    && make install \
    && rm -rf /opt/openssl-1.1.1c*

# setuptools  python2
#ADD setuptools-41.0.1.zip /opt
#ADD https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3/setuptools-41.0.1.zip /opt
RUN wget https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3/setuptools-41.0.1.zip -P /opt \
    && unzip /opt/setuptools-41.0.1.zip -d /opt \
    && cd /opt/setuptools-41.0.1 \
    && python setup.py install \
    && rm -rf /opt/setuptools-41.0.1*

# pip  python2
#ADD pip-19.1.1.tar.gz /opt
#ADD https://files.pythonhosted.org/packages/93/ab/f86b61bef7ab14909bd7ec3cd2178feb0a1c86d451bc9bccd5a1aedcde5f/pip-19.1.1.tar.gz /opt
RUN wget https://files.pythonhosted.org/packages/93/ab/f86b61bef7ab14909bd7ec3cd2178feb0a1c86d451bc9bccd5a1aedcde5f/pip-19.1.1.tar.gz -P /opt \
    && tar xzvf /opt/pip-19.1.1.tar.gz -C /opt \
    && cd /opt/pip-19.1.1 \
    && python setup.py install \
    && rm -rf /opt/pip-19.1.1*

# config pip mirror
RUN mkdir -p  ~/.pip/ \
    && echo -e "[global]\nindex-url = https://pypi.mirrors.ustc.edu.cn/simple/\n\n[install]\ntrusted-host = pypi.mirrors.ustc.edu.cn" > ~/.pip/pip.conf

RUN pip install paramiko \
    && pip install cliff \
    && pip install crypto \
    && pip install ipython \ 
    && pip install ansible \
    && pip install pycrypto \
    && pip install numpy==1.15.1 \
    && pip install pandas==0.20.3 \
    && pip install openpyxl==2.5.4 \
    && pip install IPy==0.83 \
    && pip install Cython==0.28.4 \
    && pip install PyInstaller==3.2.1  \
    && pip install xlrd==1.1.0 \
    && pip install xlwt==1.1.2 \
    && pip install pycdlib==1.0.0 \ 
    && pip install PyYAML==3.13 \
    && pip install jinja2==2.7.3 \
    && pip install pyping \
    && pip install ecdsa \
    #&& pip install jupyter \
    #&& pip install notebook \
    && pip install ipdb \
    && pip install pylint \
    && pip install flake8

# obsutil
#ADD obsutil_linux_amd64.tar.gz /opt
RUN wget https://obs-community.obs.cn-north-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz -P /opt \
    && tar xzvf /opt/obsutil_linux_amd64.tar.gz -C /opt \
    && cp /opt/obsutil_linux_amd64_5.1.6/obsutil /usr/bin \
    && obsutil config -i=$ak -k=$sk -e=obs.cn-north-1.myhwclouds.com \
    && rm -rf /opt/obsutil_linux_amd64*

# rg 索引工具，LeaderF会用到，需要在python3编译前安装，否则yum-config-manager工具无法使用 https://github.com/BurntSushi/ripgrep#installation
RUN yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo \
    && yum install -y ripgrep


# python 3.7.3
#ADD Python-3.7.3.tar.xz /opt
#ADD https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz /opt
#RUN wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz -P /opt \
RUN obsutil cp obs://sftp-test/Python-3.7.3.tar.xz /opt \
    && tar xJvf /opt/Python-3.7.3.tar.xz -C /opt \
    && cd /opt/Python-3.7.3 \
    && ./configure --enable-shared --prefix=/usr --with-openssl=/usr/ \
    && make \
    && make install \
    && rm -rf /usr/bin/python \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && rm -rf /opt/Python-3.7.3*

# fix bug: yum not support python3
RUN sed -i "s/\(^#.*\)python.*/\1python2/g" /usr/bin/yum \
    && sed -i "s/\(^#.*\)python.*/\1python2/g" /usr/libexec/urlgrabber-ext-down

# ldconfig
RUN echo "/usr/lib/" > /etc/ld.so.conf.d/usr.conf \
    && echo "/usr/lib64/" >> /etc/ld.so.conf.d/usr.conf \
    && ldconfig

# setuptools for python3
#ADD setuptools-41.0.1.zip /opt
#ADD https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3/setuptools-41.0.1.zip /opt
RUN wget https://files.pythonhosted.org/packages/1d/64/a18a487b4391a05b9c7f938b94a16d80305bf0369c6b0b9509e86165e1d3/setuptools-41.0.1.zip -P /opt \
    && unzip /opt/setuptools-41.0.1.zip -d /opt \
    && cd /opt/setuptools-41.0.1 \
    && python setup.py install \
    && rm -rf /opt/setuptools-41.0.1*

# pip for python3
#ADD pip-19.1.1.tar.gz /opt
#ADD https://files.pythonhosted.org/packages/93/ab/f86b61bef7ab14909bd7ec3cd2178feb0a1c86d451bc9bccd5a1aedcde5f/pip-19.1.1.tar.gz /opt
RUN wget https://files.pythonhosted.org/packages/93/ab/f86b61bef7ab14909bd7ec3cd2178feb0a1c86d451bc9bccd5a1aedcde5f/pip-19.1.1.tar.gz -P /opt \
    && tar xzvf /opt/pip-19.1.1.tar.gz -C /opt \
    && cd /opt/pip-19.1.1 \
    && python setup.py install \
    && rm -rf /opt/pip-19.1.1*

RUN pip install paramiko \
    && pip install cliff \
    && pip install crypto \
    && pip install ipython \ 
    && pip install ansible \
    && pip install pycrypto \
    && pip install pandas \
    && pip install openpyxl \
    && pip install IPy \
    && pip install Cython \
    && pip install PyInstaller \
    && pip install xlrd \
    && pip install xlwt \
    && pip install pycdlib \
    && pip install pyping \
    && pip install ecdsa \
    && pip install jupyter \
    && pip install notebook \
    && pip install ipdb \
    && pip install pylint \
    && pip install flake8
    

# sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""
RUN echo "root:123" | chpasswd

# huawei sdk
#ADD sdk.zip /opt
RUN wget https://codeload.github.com/huaweicloud/huaweicloud-sdk-python-obs/zip/master -P /opt \
    && unzip /opt/master -d /opt \
    && cd /opt/huaweicloud-sdk-python-obs-master/src \
    && python setup.py install \
    && rm -rf /opt/huaweicloud-sdk-python-obs-master* \
    && rm -rf /opt/sdk.zip


# vim8.1
RUN mkdir -p /root/.vim/{autoload,bundle}
#ADD vim8.1.tar.gz /opt
RUN cd /opt \
    #&& git clone https://github.com/vim/vim.git \
    && obsutil cp obs://sftp-test/vim8.1.tar.gz . \
    && tar xzvf vim8.1.tar.gz \
    && cd /opt/vim \
    && ./configure --with-features=huge --enable-python3interp=dynamic  --with-python-config-dir=/usr/lib/python3.7/config --enable-cscope --enable-multibyte \
    && make \
    && make install \
    && rm -rf /opt/vim/.git \
    && rm -rf /usr/bin/vi \
    && ln -s /usr/local/bin/vim /usr/bin/vi \
    && curl -LSso /root/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# YCM
#ADD YouCompleteMe.tar.gz /root/.vim/bundle
RUN cd /root/.vim/bundle/ \
    #&& git clone --recursive https://github.com/ycm-core/YouCompleteMe \
    && obsutil cp obs://sftp-test/YouCompleteMe.tar.gz . \
    && tar xzvf YouCompleteMe.tar.gz \
    && rm -rf /root/.vim/bundle/YouCompleteMe/.git \
    #&& /root/.vim/bundle/YouCompleteMe/install.py --clang-completer --go-completer \
    && /root/.vim/bundle/YouCompleteMe/install.py --clang-completer  \
    && cp /root/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py /root/

# universal ctags
RUN cd /opt \
    # && git clone https://github.com/universal-ctags/ctags.git \
    && obsutil cp obs://sftp-test/ctags.tar.gz . \
    && tar xzvf ctags.tar.gz \
    && cd ctags \ 
    && ./autogen.sh \
    && ./configure --prefix=/usr/bin/universal-ctags \
    && make \
    && make install \
    && rm -rf /usr/bin/ctags \
    && ln -s /usr/bin/universal-ctags/bin/ctags  /usr/bin/ctags \
    && cd /usr/ \
    && ctags -R --output-format=e-ctags

# gtags for LeaderF and cscope
# https://www.gnu.org/software/global/download.html
#RUN wget http://tamacom.com/global/global-6.6.3.tar.gz -P /opt \
RUN cd /opt \
    # fix c99 compile bug
    && obsutil cp obs://sftp-test/global-6.6.3.tar.gz . \
    && tar xzvf /opt/global-6.6.3.tar.gz -C /opt \
    && cd /opt/global-6.6.3 \
    && bash reconf.sh \
    && ./configure \
    && make \
    && cp -fp gtags/gtags /usr/bin \
    && cp -fp gtags-cscope/gtags-cscope /usr/bin \
    && cp -fp global/global /usr/bin 

RUN yum install -y cscope

# plugin
#RUN rm -rf /root/.vim/bundle
#ADD bundle.tar.gz /root/.vim/
RUN cd /root/.vim/bundle/ \
    && git clone --depth 1 https://github.com/scrooloose/nerdtree \
    && git clone --depth 1 https://github.com/Yggdroot/indentLine \
    && git clone --depth 1 https://github.com/tell-k/vim-autopep8 \
    && git clone --depth 1 https://github.com/jiangmiao/auto-pairs \
    && git clone --depth 1 https://github.com/jlanzarotta/bufexplorer \
    && git clone --depth 1 https://github.com/plasticboy/vim-markdown \
    && git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim \
    #&& git clone --depth 1 https://github.com/majutsushi/tagbar \
    #&& git clone --depth 1 https://github.com/scrooloose/syntastic \
    #&& git clone --depth 1 https://github.com/vim-scripts/taglist.vim \
    && git clone --depth 1 https://github.com/bling/vim-airline \
    && git clone --depth 1 https://github.com/vim-airline/vim-airline-themes \
    && git clone --depth 1 https://github.com/tpope/vim-surround \
    && git clone --depth 1 https://github.com/vim-scripts/indentpython.vim \
    && git clone --depth 1 https://github.com/tpope/vim-fugitive \
    && git clone --depth 1 https://github.com/flazz/vim-colorschemes \
    && git clone --depth 1 https://github.com/altercation/vim-colors-solarized \
    && git clone --depth 1 https://github.com/bronson/vim-trailing-whitespace \
    && git clone --depth 1 https://github.com/Glench/Vim-Jinja2-Syntax \
    && git clone --depth 1 https://github.com/elzr/vim-json \
    && git clone --depth 1 https://github.com/matze/vim-move \
    #&& git clone --recurse-submodules https://github.com/python-mode/python-mode.git \
    && obsutil cp obs://sftp-test/python-mode.tar.gz . \
    && tar xzvf python-mode.tar.gz \
    && rm -rf python-mode.tar.gz \
    #&& git clone https://github.com/python-mode/python-mode.git \
    && git clone https://github.com/heavenshell/vim-pydocstring \
    && git clone https://github.com/tmhedberg/SimpylFold \
    && git clone https://github.com/jnurmine/Zenburn \
    && git clone https://github.com/vim-scripts/UltiSnips \
    && git clone https://github.com/davidhalter/jedi-vim \
    && git clone https://github.com/honza/vim-snippets.git \
    && git clone https://github.com/MarcWeber/vim-addon-mw-utils.git \
    && git clone https://github.com/sjl/gundo.vim \
    && git clone https://github.com/dense-analysis/ale.git \
    && git clone https://github.com/Yggdroot/LeaderF.git \
    && git clone https://github.com/ludovicchabant/vim-gutentags.git \
    && git clone https://github.com/justinmk/vim-dirvish.git \
    && git clone https://github.com/mhinz/vim-signify.git \
    && git clone https://github.com/kana/vim-textobj-user.git \
    && git clone https://github.com/kana/vim-textobj-indent.git \
    && git clone https://github.com/kana/vim-textobj-syntax.git \
    && git clone https://github.com/kana/vim-textobj-function.git \
    && git clone https://github.com/sgur/vim-textobj-parameter.git \
    && git clone https://github.com/Shougo/echodoc.vim.git \
    && git clone https://github.com/tpope/vim-unimpaired.git \
    && git clone https://github.com/skywind3000/gutentags_plus.git \
    && git clone https://github.com/skywind3000/vim-preview.git \
    && find . -name ".git" | xargs -I{} rm -rf {}

# timezone
ENV TimeZone=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime \
    && echo $TimeZone > /etc/timezone 

RUN cd /opt/ \
    && git clone https://github.com/JarodLi/toolbox/ 

ENV MY=/opt/toolbox/
# vimrc and ycm_conf
RUN cp $MY/vimrc /root/.vimrc  \
    && cp $MY/ycm/ycm_extra_conf.py /root/.ycm_extra_conf.py

# jupyter
RUN jupyter notebook --generate-config \
    && cp -fp $MY/jupyter/jupyter_notebook_config.py /root/.jupyter \
    && cp -fp $MY/jupyter/jupyter.service /usr/lib/systemd/system 

# profile
RUN cat $MY/profile.my >> /etc/profile 

RUN rm -rf $MY

CMD ["/usr/sbin/init"]
