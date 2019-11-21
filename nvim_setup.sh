sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
mkdir -p ~/.config/nvim
cat init.nvim > ~/.config/nvim/init.vim
