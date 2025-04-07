#!/bin/bash
set -e

##############################
# 更新系统及安装基础工具
##############################
echo "更新 apt 仓库..."
sudo apt-get update

echo "安装基础工具..."
sudo apt-get install -y git curl unzip tree gzip less zip wget

echo "安装 Python3 及相关开发包..."
sudo apt-get install -y python3 python3-dev python3-pip python3-venv

echo "安装编译工具和常用库..."
sudo apt-get install -y gcc g++ gdb cmake make autoconf automake clang-format libtool ninja-build gettext libtool-bin

echo "安装 Node.js 和 npm..."
sudo apt-get install -y nodejs npm

echo "安装 OpenCV 等依赖所需的库..."
sudo apt install -y build-essential cmake git pkg-config libgtk-3-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
  libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev gfortran openexr libatlas-base-dev python3-dev python3-numpy \
  libtbb2 libtbb-dev libdc1394-22-dev

echo "安装终端工具相关依赖..."
sudo apt-get install -y cmake make gcc g++ pkg-config libuv1-dev libluajit-5.1-dev libmsgpack-dev libtermkey-dev libvterm-dev libunibilium-dev

##############################
# 安装 python 包（neovim）
##############################
echo "安装 pynvim..."
python3 -m pip install pynvim

##############################
# 安装额外工具
##############################
echo "更新 apt 并安装 ripgrep、fd-find、xclip、xsel..."
sudo apt update
sudo apt install -y ripgrep fd-find xclip xsel

echo "升级 Node.js 版本..."
sudo npm install -g n
sudo n stable
sudo npm install -g npm
sudo npm install -g tree-sitter-cli

echo "安装 gettext..."
sudo apt-get install -y gettext

##############################
# Neovim 安装及依赖
##############################
echo "安装 neovim 依赖 (Lua Rocks)..."
sudo luarocks install bit
sudo luarocks install lpeg
sudo luarocks install mpack

echo "克隆 neovim 源码并编译安装..."
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..

##############################
# zsh 及 oh-my-zsh 安装配置
##############################
echo "安装 zsh..."
sudo apt update
sudo apt install -y zsh
chsh -s "$(which zsh)"

echo "安装 oh-my-zsh..."
sh -c "$(curl -fsSL https://gitee.com/Devkings/oh_my_zsh_install/raw/master/install.sh)"

echo "安装 oh-my-zsh 插件..."
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ~/.oh-my-zsh/custom/plugins/autoupdate
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/petervanderdoes/git-flow-completion.git ~/.oh-my-zsh/custom/plugins/git-flow-completion


echo "配置 zsh 主题和插件..."
# 添加 powerlevel10k 主题到 ~/.zshrc（若未配置）
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# 添加插件列表到 ~/.zshrc（若未配置）

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  git-flow-completion
  autoupdate
)

##############################
# 安装 gtest、glog、gbench
##############################
echo "安装 libgtest-dev、libgoogle-glog-dev、libbenchmark-dev..."
sudo apt install -y libgtest-dev libgoogle-glog-dev libbenchmark-dev

##############################
# OpenCV 安装（从源码编译）
##############################
echo "安装 libopencv-dev..."
sudo apt install -y libopencv-dev

echo "克隆 OpenCV 源码及 opencv_contrib..."
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
cd opencv
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D INSTALL_C_EXAMPLES=OFF \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..
make -j"$(nproc)"
sudo make install
sudo ldconfig
cd ../..

##############################
# 安装字体
##############################
sudo cp /path/to/font.ttf /usr/share/fonts/
sudo fc-cache -f -v

##############################
# lazyvim 安装提示
##############################
echo "lazyvim 的安装请参见官方文档：https://github.com/jesseduffield/lazygit#ubuntu"

##############################
# GitLab 安装（Docker 部署）
##############################
echo "通过 Docker 部署 GitLab..."
# 确保已安装 Docker，并设置好环境变量 GITLAB_HOME 指向所需目录
sudo docker run --detach \
  --hostname 110.42.98.106 \
  --publish 443:443 --publish 8080:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume "$GITLAB_HOME/config:/etc/gitlab" \
  --volume "$GITLAB_HOME/logs:/var/log/gitlab" \
  --volume "$GITLAB_HOME/data:/var/opt/gitlab" \
  --shm-size 256m \
  registry.gitlab.cn/omnibus/gitlab-jh:latest

echo "所有安装任务已完成！"
