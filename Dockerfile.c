FROM python:latest
ENV container docker

RUN pacman -S gcc --noconfirm \
    && pacman -S glibc --noconfirm \
    && pacman -S clang --noconfirm 

