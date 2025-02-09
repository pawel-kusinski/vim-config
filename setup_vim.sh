#!/bin/bash

if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Install curl and try again."
    exit 1
fi

# Create directory for storing swap files
mkdir -p ~/.vim/swap//

# Get the directory of the current script (i.e., the location of the git repository)
REPO_DIR="$(dirname "$(realpath "$0")")"

# Download and install Vim-Plug (plugin manager)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Backup existing .vimrc if it exists
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.backup
    echo "Backed up existing .vimrc to .vimrc.backup"
fi

# Create symbolic link to the repository's .vimrc
ln -s "$REPO_DIR/.vimrc" ~/.vimrc

# Open Vim, run the PlugInstall command to install all plugins listed in .vimrc,
# and then automatically quit Vim once the installation is complete.
vim +PlugInstall +qall

echo "Vim configured!"
