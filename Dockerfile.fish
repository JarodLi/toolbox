FROM nvim:latest
ENV container docker
RUN pacman -S fish --noconfirm 

#install omf
#RUN curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish 
RUN rm -rf /root/.local/share/omf && rm -rf /root/.local/share/fish && rm -rf /root/.config/fish && rm -rf /root/.config/omf
#COPY pkgs/fish/fish_share /root/.local/share/fish
#COPY pkgs/fish/omf_share /root/.local/share/omf
#COPY pkgs/fish/fish_config /root/.config/fish
#COPY pkgs/fish/omf_config /root/.config/omf
#
RUN curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > /root/fish_install \
  && fish /root/fish_install --noninteractive
RUN echo "omf install bobthefish" | fish \
  && echo "omf theme bobthefish" | fish

COPY config/config.fish /root/.config/fish/config.fish
