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
cd ~ && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh for root user
sudo su && cd ~ && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# --------------------------
# --------------------------