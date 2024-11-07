#!/bin/bash

# Get the directory of the current script (i.e., the location of the git repository)
REPO_DIR="$(dirname "$(realpath "$0")")"

# Download and install Vim-Plug (plugin manager)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nodejs for coc
curl -sL install-node.vercel.app/lts | bash

# Install clangd for C/C++ coc
sudo apt install -y clangd

# Backup existing .vimrc if it exists
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.backup
    echo "Backed up existing .vimrc to .vimrc.backup"
fi

# Create symbolic link to the repository's .vimrc
ln -s "$REPO_DIR/.vimrc" ~/.vimrc

# Create the config directory if it doesn't exist
mkdir -p ~/.vim/config/

# Backup the existing coc-settings.json if it exists
if [ -f ~/.vim/coc-settings.json ]; then
    mv ~/.vim/coc-settings.json ~/.vim/coc-settings.json.backup
    echo "Backed up existing coc-settings.json"
fi

# Create symbolic link to the repository's coc-settings.json
ln -s "$REPO_DIR/coc-settings.json" ~/.vim/coc-settings.json

# Open Vim, run the PlugInstall command to install all plugins listed in .vimrc,
# and then automatically quit Vim once the installation is complete.
vim +PlugInstall +qall

# Install coc-clangd for C/C++ support in coc.nvim
vim +'CocInstall -sync coc-clangd' +qall

echo "Vim configured!"
