FROM zsh:latest
ENV container docker
RUN pacman -S fish --noconfirm \
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
