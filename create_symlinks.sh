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
mv -v .bash_profile $old_dir 2> /dev/null

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
ln -sf $dotfiles_dir/.bash_profile ~/.bash_profile


if [[ $DESKTOP_SESSION == 'plasma' ]]; then
    # Archive old stuff
    mkdir -p $old_dir/kde $old_dir/kde/autostart-scripts $old_dir/kde/plasma-workspace/env
    mv -v .config/kdeglobals $old_dir/kde 2> /dev/null
    mv -v .config/kglobalshortcutsrc $old_dir/kde 2> /dev/null
    mv -v .config/khotkeysrc $old_dir/kde 2> /dev/null
    mv -v .config/konsolerc $old_dir/kde 2> /dev/null
    mv -v .config/kwinrc $old_dir/kde 2> /dev/null
    mv -v .config/plasma-org.kde.plasma.desktop-appletsrc $old_dir/kde 2> /dev/null
    mv -v .config/autostart-scripts/ssh-add.sh $old_dir/kde/autostart-scripts 2> /dev/null
    mv -v .config/plasma-workspace/env/askpass.sh $old_dir/kde/plasma-workspace/env 2> /dev/null

    # Create symlinks
    mkdir -p .config/plasma-workspace/env .config/autostart-scripts
    ln -sf $dotfiles_dir/kde/kdeglobals .config/kdeglobals
    ln -sf $dotfiles_dir/kde/kglobalshortcutsrc .config/kglobalshortcutsrc
    ln -sf $dotfiles_dir/kde/khotkeysrc .config/khotkeysrc
    ln -sf $dotfiles_dir/kde/konsolerc .config/konsolerc
    ln -sf $dotfiles_dir/kde/kwinrc .config/kwinrc
    ln -sf $dotfiles_dir/kde/plasma-org.kde.plasma.desktop-appletsrc .config/plasma-org.kde.plasma.desktop-appletsrc
    ln -sf $dotfiles_dir/kde/autostart-scripts/ssh-add.sh .config/autostart-scripts/ssh-add.sh
    ln -sf $dotfiles_dir/kde/plasma-workspace/env/askpass.sh .config/plasma-workspace/env/askpass.sh
fi