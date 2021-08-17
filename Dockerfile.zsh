FROM basic:latest
ENV container docker

COPY pkgs/zsh/install.sh /opt/install.sh

RUN pacman -S wget zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k --noconfirm \
  #&& curl -Lo /opt/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh  \
  # install.sh maybe fail, please retry
  #
  && bash /opt/install.sh \
  && mkdir -p ~/.oh-my-zsh/plugins/incr \
  && wget http://mimosa-pudica.net/src/incr-0.2.zsh -P ~/.oh-my-zsh/plugins/incr \
  && cp -fpr /usr/share/zsh/plugins/* /root/.oh-my-zsh/plugins/ \
  && echo "source ~/.oh-my-zsh/plugins/incr/incr*.zsh" >> ~/.zshrc \
  && echo "/bin/zsh" >> /etc/shells \
  && chsh -s /bin/zsh 
  #&& git clone https://github.com.cnpmjs.org/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/plugins/zsh-history-substring-search 

#COPY pkgs/zsh/zsh-autosuggestions /root/.oh-my-zsh/plugins/zsh-autosuggestions
#COPY pkgs/zsh/zsh-syntax-highlighting /root/.oh-my-zsh/plugins/zsh-syntax-highlighting

COPY config/zshrc /root/.zshrc

