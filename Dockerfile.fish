FROM zsh:latest
ENV container docker
RUN pacman -S fish --noconfirm 
#RUN curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
COPY pkgs/fish/omf /root/.local/share/omf
COPY pkgs/fish/config /root/.config/omf
