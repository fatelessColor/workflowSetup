#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim

pacman -Syu $(cat workflowSetup/basicPackages)
pacman -Syu $(cat workflowSetup/creativeTools)
pacman -Syu $(cat workflowSetup/guiPackages)
pacman -Syu $(cat workflowSetup/otherTools)
pacman -Syu $(cat workflowSetup/programmerTools)
rsync -r workflowSetup/.vim/ .vim
rsync -r workflowSetup/.config/ .config
