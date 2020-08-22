FROM basic:latest
ENV container docker

RUN yum install -y zsh \
  && curl -Lo /opt/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh \
  && bash /opt/install.sh \
  && mkdir -p ~/.oh-my-zsh/plugins/incr \
  && wget http://mimosa-pudica.net/src/incr-0.2.zsh -P ~/.oh-my-zsh/plugins/incr \
  && echo "source ~/.oh-my-zsh/plugins/incr/incr*.zsh" >> ~/.zshrc \
  && echo "/bin/zsh" >> /etc/shells \
  && chsh -s /bin/zsh \
  && git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/plugins/zsh-history-substring-search 

COPY config/zshrc /root/.zshrc

