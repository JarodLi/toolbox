#!/bin/bash
# 注意，执行之前，先打开nvim，执行:PackerCompile
MOUNT_DIR="/usr1/docker/mount"

ln -s "${MOUNT_DIR}"/gitconfig /root/.gitconfig
# ln -s "${MOUNT_DIR}"/py_check /root/py_check
# ln -s "${MOUNT_DIR}"/java_check /root/java_check
rm -rf /root/.zshrc.my && ln -s "${MOUNT_DIR}"/zshrc.my /root/.zshrc.my
rm -rf /root/.zsh_history && ln -s "${MOUNT_DIR}"/zsh_history /root/.zsh_history
rm -rf /root/.tmux/resurrect && ln -s "${MOUNT_DIR}"/resurrect /root/.tmux/resurrect
mkdir -p /root/.pip && ln -s "${MOUNT_DIR}"/pip.conf /root/.pip/pip.conf                                                                                        
# FIXME                                                                                                                                                         
# rm -rf /root/.local/share/nvim
# ln -s "${MOUNT_DIR}"/nvim /root/.local/share/nvim
                                                                                                                                                                
rm /root/.config/cheat/cheatsheets/personal                                                                                                                     
ln -s "${MOUNT_DIR}"/cheat_personal /root/.config/cheat/cheatsheets/personal                                                                                    
                                                                                                                                                                
ln -s "${MOUNT_DIR}"/pm/projects /root/.pm/projects                                                                                                             
ln -s "${MOUNT_DIR}"/ssh /root/.ssh                                                                                                                             
rm -rf /root/.local/share/autojump && ln -s "${MOUNT_DIR}"/autojump /root/.local/share/autojump                                                                 
ln -s "${MOUNT_DIR}"/ansible/hosts /etc/ansible/hosts                                                                                                           
ln -s "${MOUNT_DIR}"/vim_tasks.ini /root/.vim/tasks.ini
ln -s "${MOUNT_DIR}"/kube/ /root/.kube
mkdir -p /root/.local/share/fish/ && rm -rf /root/.local/share/fish/fish_history && ln -s "${MOUNT_DIR}"/fish/fish_history /root/.local/share/fish/fish_history
ln -s "${MOUNT_DIR}"/TabNine /root/.local/share/TabNine
mkdir -p /root/.m2 && ln -s "${MOUNT_DIR}"/settings.xml /root/.m2/settings.xml                                                                                  
#rm -rf /etc/resolv.conf && ln -s "${MOUNT_DIR}"/resolv.conf /etc/resolv.conf                                                                                   
ln -s "${MOUNT_DIR}"/telescope-projects.txt /root/.local/share/nvim/telescope-projects.txt                                                                      
rm -rf /usr/bin/checkstyle && ln -s "${MOUNT_DIR}"/java_check/checkstyle /usr/bin/checkstyle                                                                    
                                                                                                                                                                
cd - || exit 1

pip3 install flask_restx
pip3 install flask_restful
pip3 install httpx
pip3 install pure-sasl

pip3 install allure-pytest
pip3 install pytest_httpx
pip3 install pytest-mock
pip3 install pytest-html
pip3 install pytest-cov
pip3 install mock
pip3 install pytest
pip3 install faker
pip3 install tenacity
pip3 install coverage
