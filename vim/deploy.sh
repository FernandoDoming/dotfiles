#!/bin/bash

mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/zenburn.vim https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim
curl -o ~/.vim/colors/luna.vim https://raw.githubusercontent.com/notpratheek/vim-luna/master/colors/luna.vim
curl -o ~/.vim/colors/luna-term.vim https://raw.githubusercontent.com/notpratheek/vim-luna/master/colors/luna-term.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "VundleInstall"
