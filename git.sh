#!/bin/sh

echo "Start copying GIT dofiles to the current home directory..."
read -p "The process may override some of the files in your home directory, do you want to continue? [Yn] " yn
case $yn in
    [Yy]* ) break;;
    [Nn]* ) echo "Aborting installation"; exit;;
esac

echo "Copying GIT files..."

cp -f ./.gitconfig $HOME/

echo "GIT Setup complete!"
