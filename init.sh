#!/bin/bash
# 注意，执行之前，先打开nvim，执行:PackerCompile
CONFIG_DIR_GIT="/usr1/toolbox/config"
MOUNT_DIR_LOCAL="/usr1/mount"

link_file() {
	local host_file="$1"      # 宿主机上的文件
	local container_file="$2" # 容器内的文件

# 检查文件是否存在
	if [ ! -f "${host_file}" ]; then
		# 文件不存在，创建一个空的文件
		mkdir -p "$(dirname "${host_file}")"
		touch "${host_file}"
	else
		echo "文件 '${host_file}' 已存在"
	fi

	mkdir -p "$(dirname "${container_file}")"
	rm -rf "${container_file}"
	ln -s "${host_file}" "${container_file}"
	echo "link file "host:${host_file}" to "container:${container_file}""
}

link_dir() {
	local host_dir="$1"      # 宿主机上的文件
	local container_dir="$2" # 容器内的文件

	# 检查文件是否存在
	if [ ! -d "${host_dir}" ]; then
		# 文件不存在，创建一个空的文件
		mkdir -p "${host_dir}"
	else
		echo "dir '${host_dir}' 已存在"
	fi

	mkdir -p "$(dirname "${container_dir}")"
	rm -rf "${container_dir}"
	ln -s "${host_dir}" "${container_dir}"
	echo "link dir "host:${host_dir}" to "container:${container_dir}""
}

# 定义一个数组，包含多组参数
files_to_link=(
	"${MOUNT_DIR_LOCAL}/gitconfig" "/root/.gitconfig"
	"${CONFIG_DIR_GIT}/zshrc.my" "/root/.zshrc.my"
	"${MOUNT_DIR_LOCAL}/zsh_history" "/root/.zsh_history"
	"${CONFIG_DIR_GIT}/pm/projects" "/root/.pm/projects"
	"${MOUNT_DIR_LOCAL}/pip.conf" "/root/.pip/pip.conf"
	# "${CONFIG_DIR_GIT}/ansible/hosts" "/etc/ansible/hosts"
	"${MOUNT_DIR_LOCAL}/fish/fish_history" "/root/.local/share/fish/fish_history"
	"${MOUNT_DIR_LOCAL}/telescope-projects.txt" "/root/.local/share/nvim/telescope-projects.txt"
	"/docker.sock" "/var/run/docker.sock"
	"${MOUNT_DIR_LOCAL}/obsutilconfig" "/root/.obsutilconfig"

	# {"${CONFIG_DIR_GIT}/settings.xml","/root/.m2/settings.xml"}
	# {"${CONFIG_DIR_GIT}/java_check/checkstyle","/usr/bin/checkstyle"}
	# {"${CONFIG_DIR_GIT}/java_check","/root/java_check"}
	# {"${CONFIG_DIR_GIT}/vim_tasks.ini","/root/.vim/tasks.ini"}
)

dirs_to_link=(
	"${CONFIG_DIR_GIT}/py_check" "/root/py_check"
	"${MOUNT_DIR_LOCAL}/resurrect" "/root/.tmux/resurrect"
	"${CONFIG_DIR_GIT}/cheat_personal" "/root/.config/cheat/cheatsheets/personal"
	"${MOUNT_DIR_LOCAL}/TabNine" "/root/.local/share/TabNine"
	"${MOUNT_DIR_LOCAL}/ssh" "/root/.ssh"
	"${MOUNT_DIR_LOCAL}/autojump" "/root/.local/share/autojump"
	"${MOUNT_DIR_LOCAL}/kube/" "/root/.kube"
	#"${CONFIG_DIR_GIT}/nvim/lua/" "/root/.vim/lua"
	"${CONFIG_DIR_GIT}/nvim/lua/" "/root/.config/nvim/lua"
)

# 使用 for 循环调用 link_file 函数
for ((i = 0; i < ${#files_to_link[@]}; i+=2)); do
	arg1="${files_to_link[i]}"
	arg2="${files_to_link[$((i + 1))]}"

	link_file "$arg1" "$arg2"
done


# 使用 for 循环调用 link_file 函数
for ((i = 0; i < ${#dirs_to_link[@]}; i+=2)); do
	arg1="${dirs_to_link[i]}"
	arg2="${dirs_to_link[$((i + 1))]}"

	link_dir "$arg1" "$arg2"
done

# FIXME
# rm -rf /root/.local/share/nvim
# ln -s "${CONFIG_DIR_GIT}"/nvim /root/.local/share/nvim

# echo "export HTTPS_PROXY=http://l00534690:Osf%2F11%21%40@proxyhk.huawei.com:8080" >> /root/.config/fish/config.fish
# echo "export HTTP_PROXY=http://l00534690:Osf%2F11%21%40@proxyhk.huawei.com:8080" >> /root/.config/fish/config.fish

# 注释掉maven settings.xml中的maven-default-http-blocker配置： nvim  /opt/maven/conf/settings.xml
# 安装cbu中心maven仓库证书
# cd /usr/lib/jvm/java-18-openjdk/lib/security || exit 1
# keytool -keystore cacerts -importcert -alias HWITEnterpriseCA1 -file /usr1/docker/mount/install_maven_ca/ca/HWITEnterpriseCA1.cer -storepass changeit
# keytool -keystore cacerts -importcert -alias HuaweiITRootCA -file /usr1/docker/mount/install_maven_ca/ca/HuaweiITRootCA.cer -storepass changeit
# cd - || exit 1

# pip3 install flask_restx
# pip3 install flask_restful
# pip3 install httpx
# pip3 install pure-sasl
#
# pip3 install allure-pytest
# pip3 install pytest_httpx
# pip3 install pytest-mock
# pip3 install pytest-html
# pip3 install pytest-cov
# pip3 install mock
# pip3 install pytest
# pip3 install faker
# pip3 install tenacity
# pip3 install coverage

# cp seccomponent-1.1.7-release.x86_64.rpm / && cd / && rpm2cpio seccomponent-1.1.7-release.x86_64.rpm | cpio -div && cd -
# echo "/usr/local/seccomponent/lib" >/etc/ld.so.conf.d/scc.conf && ldconfig
