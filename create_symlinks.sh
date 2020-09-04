#!/bin/bash

# NOTE: for this to work you need to clone the repo to ~/dotfiles


# Variables
#==========
dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
old_dir=~/.old_dotfiles

# Move existing dot files and folders
#======================================
cd 
mkdir $old_dir
mv -v .bash_aliases $old_dir 2> /dev/null
mv -v .bashrc $old_dir 2> /dev/null
mv -v .gitconfig $old_dir 2> /dev/null
mv -v .inputrc $old_dir 2> /dev/null
mv -v .mdlrc $old_dir 2> /dev/null
mv -v .nanorc $old_dir 2> /dev/null
mv -v .pre-commit-config.yaml $old_dir 2> /dev/null
mv -v .pylintrc $old_dir 2> /dev/null
mv -v .style.yapf $old_dir 2> /dev/null

# Create symlinks in the home folder
#===================================
ln -sf $dotfiles_dir/.bash_aliases ~/.bash_aliases
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/.gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/.inputrc ~/.inputrc
ln -sf $dotfiles_dir/.mdlrc ~/.mdlrc
ln -sf $dotfiles_dir/.nanorc ~/.nanorc
ln -sf $dotfiles_dir/.pre-commit-config.yaml ~/.pre-commit-config.yaml
ln -sf $dotfiles_dir/.pylintrc ~/.pylintrc
ln -sf $dotfiles_dir/.style.yapf ~/.style.yapf


if [[ $DESKTOP_SESSION == 'plasma' ]]; then
    mkdir $old_dir/kde
    mv -v .config/kdeglobals $old_dir/kde 2> /dev/null
    mv -v .config/kglobalshortcutsrc $old_dir/kde 2> /dev/null
    mv -v .config/khotkeysrc $old_dir/kde 2> /dev/null
    ln -sf $dotfiles_dir/kde/kdeglobals .config/kdeglobals
    ln -sf $dotfiles_dir/kde/kglobalshortcutsrc .config/kglobalshortcutsrc
    ln -sf $dotfiles_dir/kde/khotkeysrc .config/khotkeysrc
fi