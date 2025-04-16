#!/bin/bash

# Check for --no-dict flag
for arg in "$@"; do
    if [ "$arg" == "--no-dict" ]; then
        SKIP_DICT=true
        break
    fi
done

if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Install curl and try again."
    exit 1
fi

if ! command -v ag  &> /dev/null; then
    echo "Error: silversearcher-ag (ag) is not installed. Install silversearcher-ag and try again."
    exit 1
fi

# Check if universal-ctags is installed
if ! command -v ctags >/dev/null 2>&1; then
    echo "Error: 'ctags' (required by Tagbar plugin) is not installed."
    echo "Please install universal-ctags before proceeding."
    echo "See: https://github.com/universal-ctags/ctags"
    exit 1
fi

# Check if it's universal-ctags and not the legacy one
if ! ctags --version 2>&1 | grep -q 'Universal'; then
    echo "Error: The installed 'ctags' is not Universal Ctags that is recommended by Tagbar plugin authors."
    echo "Please install universal-ctags from https://github.com/universal-ctags/ctags"
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

if [ "$SKIP_DICT" = false ]; then
    # Ensure the Vim spell directory exists
    mkdir -p ~/.vim/spell
    ln -sf "$REPO_DIR/spell/en.utf-8.add" ~/.vim/spell/en.utf-8.add
fi

# Open Vim, run the PlugInstall command to install all plugins listed in .vimrc,
# and then automatically quit Vim once the installation is complete.
vim +PlugInstall +qall

echo "Vim configured!"
