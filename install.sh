sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl 'https://gist.githubusercontent.com/xfanwu/18fd7c24360c68bab884/raw/f09340ac2b0ca790b6059695de0873da8ca0c5e5/xxf.zsh-theme' > ~/.oh-my-zsh/themes/xxf.zsh-theme
sed -i 's/ZSH_THEME=.*/ZSH_THEME="xxf"/' ~/.zshrc

curl https://raw.githubusercontent.com/skaji/remote-pbcopy-iterm2/master/pbcopy > pbcopy
chmod +x pbcopy
sudo mv pbcopy /usr/local/bin/

ln -sf ~/batteries/.zshrc ~/.zshrc

apt-get install git
git config --global user.email "danny.meyer@gmail.com"
git config --global user.name "Danny Meyer"
rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo apt-get install vim
sudo apt-get install virtualenv
