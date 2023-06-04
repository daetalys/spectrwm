#!/bin/bash

# Define the repository and clone destination
REPO="git@gitlab.com:daetalys/spectrwm.git"
CLONE_DEST="$XDG_DOCUMENTS_DIR/Projects/SpectrWM"

# Clone the repository
git clone $REPO $CLONE_DEST

# Ask the user if they want to copy or symlink the files
read -p "Do you want to (c)opy the files or create (s)ymlinks? " -n 1 -r
echo    # move to a new line

if [[ $REPLY =~ ^[Cc]$ ]]
then
    # The user chose to copy the files
    cp -r $CLONE_DEST/.config/ $HOME/.config/

    # Remove the cloned repository
    rm -rf $CLONE_DEST
elif [[ $REPLY =~ ^[Ss]$ ]]
then
    # The user chose to create symlinks
    mkdir -p $HOME/.config/spectrwm
    ln -s $CLONE_DEST/.config/spectrwm/baraction.sh $HOME/.config/spectrwm/baraction.sh
    ln -s $CLONE_DEST/.config/spectrwm/spectrwm.conf $HOME/.config/spectrwm/spectrwm.conf
    ln -s $CLONE_DEST/.conkyrc $HOME/.conkyrc
fi
