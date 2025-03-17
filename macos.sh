#!/bin/bash
set -e

##############################
# 检查并安装 Homebrew
##############################
if ! command -v brew >/dev/null 2>&1; then
    echo "未检测到 Homebrew，开始安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # 配置 brew 环境变量（根据系统提示，可将下列内容加入 ~/.zprofile 或 ~/.bash_profile）
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew 已安装，更新 Homebrew..."
    brew update
fi

##############################
# 安装基础工具及开发环境
##############################
echo "安装基础工具及开发依赖..."
brew install git curl unzip tree wget less

echo "安装 Python3 及 pip（macOS 自带 python3，但建议更新至 brew 版本）..."
brew install python

echo "安装常用编译工具及库..."
brew install gcc cmake make autoconf automake clang-format libtool ninja gettext pkg-config

echo "安装 Node.js 与 npm..."
brew install node

# 部分 Linux 包在 macOS 下可使用对应工具或不需要安装：
echo "安装 ripgrep、fd（fd-find）等工具..."
brew install ripgrep fd

# 注：xclip/xsel 为 Linux 下剪切板工具，macOS 可使用 pbcopy/pbpaste 替代

##############################
# Python 包安装（neovim 插件）
##############################
echo "使用 pip 安装 pynvim..."
python3 -m pip install --upgrade pip
python3 -m pip install pynvim

##############################
# 安装额外工具及 Node 相关工具
##############################
echo "升级 npm 及安装 tree-sitter-cli..."
npm install -g npm
npm install -g tree-sitter-cli

##############################
# Neovim 相关安装
##############################
echo "安装 neovim 依赖（Lua Rocks 包）..."
brew install luarocks
sudo luarocks install bit
sudo luarocks install lpeg
sudo luarocks install mpack

echo "编译安装 neovim（源码方式，可选，macOS 下也可直接 brew install neovim）："
if [ ! -d "neovim" ]; then
    git clone https://github.com/neovim/neovim.git
fi
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..

##############################
# zsh 及 oh-my-zsh 安装配置
##############################

echo "安装 oh-my-zsh..."
sh -c "$(curl -fsSL https://gitee.com/Devkings/oh_my_zsh_install/raw/master/install.sh)"

echo "安装 oh-my-zsh 插件..."
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ~/.oh-my-zsh/custom/plugins/autoupdate
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/petervanderdoes/git-flow-completion.git ~/.oh-my-zsh/custom/plugins/git-flow-completion
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k

echo "配置 zsh 主题和插件..."
# 添加 powerlevel10k 主题到 ~/.zshrc（若未配置）
if ! grep -q "powerlevel10k.zsh-theme" ~/.zshrc; then
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
fi
# 添加插件列表到 ~/.zshrc（若未配置）
if ! grep -q "plugins=(" ~/.zshrc; then
cat << 'EOF' >> ~/.zshrc

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  git-flow-completion
  autoupdate
)
EOF
fi


##############################
# 安装 gtest、glog、benchmark
##############################
echo "安装 googletest、glog、benchmark..."
brew install googletest glog benchmark

##############################
# 安装数学库相关依赖
##############################
echo "安装数学库依赖 openblas、lapack、arpack、superlu..."
brew install openblas lapack arpack superlu

##############################
# OpenCV 安装（从源码编译或直接安装）
##############################
brew install opencv

echo "所有安装任务已完成！"
