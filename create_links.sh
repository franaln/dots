#! /usr/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=~/.dots
time=$(date +%Y%m%d_%H%m%S)
oldsuffix="old.$time"

# list of files/folders to symlink in homedir
files_home="bashrc bash_alias bash_fns bash_vars emacs"



#files_config=""


# Links files to home
for file in $files_home; do

  absfile=~/.$file
  
  # if file exists and is no symlink, move it to .dotfiles
  if [[ -e $absfile ]] && ! [[ -h $absfile ]]; then
    mv ~/.$file ~/$file.$oldsuffix
  fi
  # if file doesn't exist, link it
  if ! [[ -e $absfile ]]; then
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
  fi
done


# Links files/folders to ~/.config


# others
ln -s /home/fran/dots/screenrc /home/fran/.screenrc
