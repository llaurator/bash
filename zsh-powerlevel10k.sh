#!/bin/bash
# @Author: Llaurator
# @Date:   21-10-2021 16:30:34
# @Last Modified by:   Llaurator
# @Last Modified time: 23-10-2021 02:26:59

echo "*********************************************"
echo "Insta·lant  zsh"
echo "*********************************************"
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    sudo apt-get update
    sudo apt-get install zsh fontconfig curl git -y
    chsh -s "$(which zsh)"
fi

echo "*********************************************"
echo "instal·lant oh-my-zsh powerlevel10k"
echo "*********************************************"
echo ""
echo "1. Instal·lant oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo ""
echo "2. Instal·lant el tema powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
sed -i 's@^ZSH_THEME=.*$@ZSH_THEME="powerlevel10k/powerlevel10k"@g' ~/.zshrc

echo ""
echo "3. Instal·lant les font powerline..."
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.local/share/fonts/
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

echo ""
echo "4. Instal·lant els plugins autosuggestions y syntax highlighting..."
# if [ -d ~/.oh-my-zsh/custom/plugins ]; then
#     mkdir -p ~/.oh-my-zsh/custom/plugins
# fi
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
sed -i 's@plugins=(git)@plugins=(git zsh-autosuggestions zsh-syntax-highlighting)@g' ~/.zshrc
echo "alias scp='noglob scp'" >>~/.zshrc
echo ""
echo "Finalitzat! Tanca la sessió i torna a obrir-la altra vegada per veure els canvis"
