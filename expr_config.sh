#!/bin/bash

# 检查是否存在~/download/software目录，不存在则创建
if [ ! -d ~/download/software ]; then
    mkdir -p ~/download/software
fi
sudo apt-get update
sudo apt-get install -y git curl wget unzip
# 安装nerd-fonts
cd ~/download/software
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
# 解压到/usr/share/fonts
sudo tar -xf JetBrainsMono.tar.xz -C /usr/share/fonts
# 更新字体缓存
fc-cache -f -v

cd ~/download/software
echo -e "\033[47;36m ---------- Neovim -------- \033[0m"
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
./nvim-linux64/bin/nvim
# 创建软连接
sudo ln -s ~/download/software/nvim-linux64/bin/nvim /usr/bin/nvim
git clone https://github.com/Eureka422/nvim-migrate.git
mkdir -p ~/.config/nvim
cp -r nvim-migrate/* ~/.config/nvim

# 配置终端
echo -e "\033[47;36m ---------- Zsh -------- \033[0m"
sudo apt-get update
sudo apt-get install -y zsh

sudo chsh -s /bin/zsh
# 安装oh-my-zsh
echo -e "\033[47;36m ---------- Oh-my-zsh -------- \033[0m"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# 安装starship
echo -e "\033[47;36m ---------- Starship -------- \033[0m"
curl -fsSL https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
starship preset pastel-powerline -o ~/.config/starship.toml
