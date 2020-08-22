FROM zsh:latest
ENV container docker

COPY pkgs/tmux /opt

RUN yum install -y libevent-devel  bison  ncurses-devel \
#RUN wget https://github.com/tmux/tmux/releases/download/3.2-rc/tmux-3.2-rc2.tar.gz -P /opt \
    && cd /opt \
    && tar xzvf tmux-3*.tar.gz \
    && cd  tmux-3* \ 
    && ./configure \
    && make \
    && make install \
    && echo "/usr/local/bin/tmux" >> /root/.zshrc \
    && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
    #&& mv /opt/tpm ~/.tmux/plugins/tpm \
    # plugins无法自动下载，提前下载好ADD进去
    && tar xzvf /opt/tmux-plugins.tar.gz -C /root/.tmux/plugins \
    && rm -rf /opt/tmux-plugins.tar.gz \
    && cd /root \
    && rm -rf /opt/tmux*

COPY config/tmux/tmux.conf /root/.tmux.conf 



