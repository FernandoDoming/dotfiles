#!/bin/bash

if [ "$(dpkg-query -l vim)" != "0" ]; then
  echo "Vim is not installed. Installing ..."

  if [ "$(id -u)" != "0" ]; then
    echo "Sorry, you are not root. Run as root to install vim"
    exit 1
  else
    apt-get install -y vim
  fi
fi

mkdir -p ~/.vim/colors
mkdir -p ~/.vim/plugin

curl -o ~/.vim/colors/zenburn.vim https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim
curl -o ~/.vim/colors/luna.vim https://raw.githubusercontent.com/notpratheek/vim-luna/master/colors/luna.vim
curl -o ~/.vim/colors/luna-term.vim https://raw.githubusercontent.com/notpratheek/vim-luna/master/colors/luna-term.vim
curl http://www.vim.org/scripts/download_script.php?src_id=9223 -o ~/.vim/plugin/autoclose.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/
if [ ! -d "~/dotfiles" ]; then
	git clone https://github.com/FernandoDoming/dotfiles.git
fi
cp ./dotfiles/vim/.vimrc ~/

vim -c VundleInstall
