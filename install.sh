#!/bin/sh

DIRECTORY=$HOME/dotfiles

if [ -d "$DIRECTORY" ]; then
    echo "Folder 'dotfiles' already exists in your home."
    read -p "Do you want to continue ($DIRECTORY will be overridden)? " yn
    case $yn in
        [Yy]* ) echo "Removing $DIRECTORY"; rm -rf $DIRECTORY; break;;
        [Nn]* ) exit;;
    esac
fi

echo "Cloning repo 'https://github.com/blackout314/dotfiles.git'..."
git clone --recursive https://github.com/blackout314/dotfiles.git $DIRECTORY
git submodule update

cd $DIRECTORY
sh vim.sh
