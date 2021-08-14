FROM zsh:latest
ENV container docker

COPY pkgs/tmux /opt

RUN pacman -S tmux --noconfirm \
    && echo "/usr/bin/tmux" >> /root/.zshrc \
    && mv /opt/oh-my-tmux /root/ \
    && ln -s -f /root/oh-my-tmux/.tmux.conf ~/.tmux.conf \
    && ln -s -f /root/oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local \
    && git clone https://github.com.cnpmjs.org/tmux-plugins/tpm ~/.tmux/plugins/tpm \
    #&& mv /opt/tpm ~/.tmux/plugins/tpm \
    # plugins无法自动下载，提前下载好ADD进去
    && tar xzvf /opt/tmux-plugins.tar.gz -C /root/.tmux/plugins \
    && rm -rf /opt/tmux-plugins.tar.gz \
    && cd /root \
    && rm -rf /opt/tmux*

COPY config/tmux/tmux.conf /root/tmux.conf.my
RUN cat /root/tmux.conf.my >> /root/oh-my-tmux/.tmux.conf.local



