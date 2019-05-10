#!/usr/bin/env bash
################################################################################
# Author: Joseph J. Radler
# Install and setup packages and frameworks with Homebrew on a new or freshly
# formatted system on MacOS (DO NOT USE WITH LINUX)
# Created: 2018 June 11
# Modified: 2018 June 11
################################################################################
# Section Install Homebrew {{{
# Install Homebrew if not already installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
        echo "Homebrew not installed. Attempting to install Homebrew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [ ! "$?" -eq 0 ] ; then
                echo "Something went wrong. Exiting..." && exit 1
        fi
fi

# Make sure this is the latest Homebrew update
brew update

# Upgrade any already-installed formulae
brew upgrade
# }}}
# ------------------------------------------------------------------------------

# Section Install Core Functions {{{
brew install coreutils      # Install GNU CoreUtils

brew install wget
brew install top
brew install watch
brew install tmux
# }}}
# ------------------------------------------------------------------------------
# Section Install NeoVim and Link Configs {{{
brew install neovim
# if [ -e ~/dotfiles/vim/vimrc && -e ~/dotfiles/config/nvim ] ; then
#         echo "Vim configuration script located! Linking to NeoVim..."
#         if [ -e ~/dotfiles/config/nvim/ ] ; then
#                 ln -sv ~/dotfiles/vim/vimrc ~/dotfiles/config/nvim/init.vim
#         else
#                 if [-e ~/dotfiles/config ] ; then
#                         echo "Building NeoVim init directory..."
#                         mkdir ~/dotfiles/config/nvim
#                         ln -sv ~/dotfiles/vim/vimrc ~/dotfiles/config/nvim/init.vim
#                 else
#                         echo "Building NeoVim configuration directory..."
#                         mkdir ~/dotfiles/config
#                         echo "Building NeoVim init directory..."
#                         mkdir ~/dotfiles/config/nvim
#                         ln -sv ~/dotfiles/vim/vimrc ~/dotfiles/config/nvim/init.vim
#                 fi
#         fi
# fi
#
# if [ -e ~/dotfiles/config/nvim/init.vim ] ; then
#         echo "NeoVim configuration file successfully linked to Vim configuration file!"
#         if [ ! -e ~/.vimrc ] ; then
#                 echo "No .vimrc file present in $HOME ! Linking..."
#                 ln -sv ~/dotfiles/vim/vimrc ~/.vimrc
#         else
#                 echo "Vim config file .vimrc already exists! Continuing..."
#         fi
# fi

# }}}
# ------------------------------------------------------------------------------
# Section Programming Languages and Frameworks {{{
# Python 3
brew install python

# Haskell GHCI
brew install ghci

# }}}
# ------------------------------------------------------------------------------
# Section Plotting Tools {{{

# }}}
# ------------------------------------------------------------------------------
# Section Misc {{{
# Remove outdated versions from the Cellar
brew cleanup
# }}}
# ------------------------------------------------------------------------------
# vim:foldmethod=marker:foldlevel=0
