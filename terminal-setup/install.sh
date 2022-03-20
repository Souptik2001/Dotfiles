#! /bin/bash

# --------------------------
# Kitty
# --------------------------

# Install kitty terminal
sudo pacman -S kitty

# --------------------------
# --------------------------


# --------------------------
# OhMyZSH
# --------------------------

# Install zsh for current user
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh for root user
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Next copy the .zshrc file and .oh-my-zsh folder to home folders of both curent user's and root user's home directories.

# --------------------------
# --------------------------