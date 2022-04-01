FROM python:latest
ENV container docker

#RUN pacman -S gcc --noconfirm \
    #&& pacman -S glibc --noconfirm \
    #&& pacman -S clang --noconfirm 


RUN cd /opt \
    && git clone https://github.com/alexmurray/cstyle.git \
    && cd cstyle \
    && pip3 install . \
    && cstyle --generate-config > ~/.cstyle

