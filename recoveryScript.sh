#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim

apt-get install $(cat workflowSetup/basicPackages)
rsync -r workflowSetup/.vim .vim
