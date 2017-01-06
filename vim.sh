#!/bin/sh

echo "Start copying dofiles to the current home directory..."
read -p "The process may override some of the files in your home directory, do you want to continue? [Yn] " yn
case $yn in
    [Yy]* ) break;;
    [Nn]* ) echo "Aborting installation"; exit;;
esac

echo "Copying Vim files..."
mkdir -p $HOME/.vim/colors
mkdir -p $HOME/.vim/syntax
cp -f ./.vimrc $HOME/
cp -f ./molokai/colors/molokai.vim $HOME/.vim/colors

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

echo "VIm Setup complete!"
