#!/usr/bin/env bash

brew help
if [[ $? != 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed"
fi

if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
    if [[ $pretend -eq 1 ]]; then
        echo "Would install vundle"
    else
        echo "Installing vundle"
        # Cleean up old vundle install
        rm -rf $HOME/.vim/bundle/vundle
        git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim" &> /dev/null
        if [[ $bundleupdate -eq 0 ]]; then
            echo "Now start vim and run:"
            echo ":PluginInstall"
        fi
    fi
else
    echo "Vundle already installed"
fi
