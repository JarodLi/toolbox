FROM python:latest
ENV container docker


ADD pkgs/c/* /opt/
RUN yum install -y bison \
    && cd /opt/gmp-6.2.0 \ 
    && ./configure --prefix=/usr/local/gmp-6.2.0 \
    && make \
    && make install  \
    && echo "/usr/local/gmp-6.2.0/lib" >> /etc/ld.so.conf.d/usr.conf \
    && cd /opt \
    && rm -rf /opt/gmp* \

    && cd /opt/mpfr-4.1.0 \
    && ./configure --prefix=/usr/local/mpfr-4.1.0 --with-gmp=/usr/local/gmp-6.2.0/ \
    && make \
    && make install \ 
    && echo "/usr/local/mpfr-4.1.0/lib" >> /etc/ld.so.conf.d/usr.conf \
    && cd /opt \
    && rm -rf /opt/mpfr* \

    && cd /opt/mpc-1.2.0 \
    && ./configure --prefix=/usr/local/mpc-1.2.0 --with-gmp=/usr/local/gmp-6.2.0/ --with-mpfr=/usr/local/mpfr-4.1.0/ \
    && make \
    && make install \
    && echo "/usr/local/mpc-1.2.0/lib" >> /etc/ld.so.conf.d/usr.conf \
    && cd /opt \
    && rm -rf /opt/mpc* \

    && cd /opt/isl-0.22 \
    && ./configure --with-gmp-prefix=/usr/local/gmp-6.2.0/ --prefix=/usr/local/isl-0.22 \
    && make \
    && make install \
    && echo "/usr/local/isl-0.22/lib" >> /etc/ld.so.conf.d/usr.conf \
    && cd /opt \
    && rm -rf /opt/isl* \
   
    && cd /etc/ld.so.conf.d \
    && ldconfig  \
 
    # 编译gcc
    && cd /opt/gcc-10.2.0 \
    && ./configure --prefix=/usr/local/gcc-10.2.0 --enable-threads=posix --disable-checking --enable--long-long --enable-languages=c,c++ --with-gmp=/usr/local/gmp-6.2.0/ --with-mpfr=/usr/local/mpfr-4.1.0/ --with-mpc=/usr/local/mpc-1.2.0/ --with-isl=/usr/local/isl-0.22 --disable-multilib \
    && echo "/usr/local/gcc-10.2.0/lib" >> /etc/ld.so.conf.d/usr.conf \
    && cd /etc/ld.so.conf.d \
    && ldconfig \ 
    && cd - \
    && make -j 4 \
    && make install \
    #&& yum remove -y gcc \
    && rm -rf /usr/bin/gcc \
    && ln -s /usr/local/gcc-10.2.0/bin/gcc /usr/bin/gcc \
    && rm -rf /usr/bin/g++ \
    && ln -s /usr/local/gcc-10.2.0/bin/g++ /usr/bin/g++ \
    && rm -rf /usr/bin/cc \
    && ln -s /usr/local/gcc-10.2.0/bin/gcc /usr/bin/cc \
    && rm -rf /usr/bin/c++ \
    && ln -s /usr/local/gcc-10.2.0/bin/g++ /usr/bin/c++ \
    && rm -rf /usr/lib64/libstdc++.so.6 \
    && ln -s /usr/local/gcc-10.2.0/lib64/libstdc++.so.6.0.28 /usr/lib64/libstdc++.so.6 \
    && cd /opt \
    && rm -rf /opt/gcc* \

    #&& cd /opt/cmake-3.18.2 \
    #&& ./bootstrap \
    #&& gmake \
    #&& gmake install \

    # 编译make , 依赖python3
    && cd /opt/make-4.3 \
    && ./configure \
    && make \
    && make install \
    && yum remove -y make \
    && cd /opt \
    && rm -rf /opt/make* \

   # 编译glibc
   && cd /opt/glibc-2.32 \
   && mkdir build \
   && cd build \
   && ../configure  --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin \
   && make \
   # 找不到lnss_test2编译失败可以忽略
   && make install || ls -l /lib64/libc.so.6 | grep 2.32 \
   && localedef -i en_US -f UTF-8 en_US.UTF-8 \
   && cd /opt \
   && rm -rf /opt/glibc* \

# 编译clangd： https://clang.llvm.org/get_started.html
# clangd介绍: https://clangd.llvm.org/
   && cd /opt \
   && unzip clangd-linux-10.0.0.zip  \
   && cp /opt/clangd_10.0.0/bin/clangd /usr/local/bin/clangd \
   && rm -rf /opt/clangd* 

RUN rm -rf /var/lib/rpm/*db* \
    && rpm --rebuilddb
