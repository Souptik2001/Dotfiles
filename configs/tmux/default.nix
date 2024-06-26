{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
      }
      {
        plugin = tmuxPlugins.yank;
      }
      {
        plugin = tmuxPlugins.open;
      }
      {
        plugin = tmuxPlugins.copycat;
      }
    ];
    extraConfig = ''
		# Set default tmux shell as zsh
		# set-option -g default-shell /bin/bash

		# tmux display things in 256 colors
		set -g default-terminal "screen-256color"
		set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'

		# sensible yet memory-friendly scroll history
		set -g history-limit 20000

		# automatically renumber tmux windows
		set -g renumber-windows on

		##############################
		### Color & Style Settings ###
		##############################

		# remap prefix from 'C-b' to 'C-a'
		unbind C-b
		set-option -g prefix C-a
		bind-key C-a send-prefix

		# split panes using | and -
		bind | split-window -h
		bind - split-window -v
		unbind '"'
		unbind %

		# reload config file (change file location to your the tmux.conf you want to use)
		bind r source-file ~/.tmux.conf

		# switch panes using Alt-arrow without prefix
		bind -n M-Left select-pane -L
		bind -n M-Right select-pane -R
		bind -n M-Up select-pane -U
		bind -n M-Down select-pane -D

		# Settings about renaming window
		# make window/pane index start with 1
		set -g base-index 1
		setw -g pane-base-index 1

		set-option -g set-titles on
		set-option -g set-titles-string "#T - #W"
		# bind w rename-window
		# unbind c

		# # Enable mouse control (clickable windows, panes, resizable panes) (below tmux 2.1)
		# set -g mouse-select-window on
		# set -g mouse-select-pane on
		# set -g mouse-resize-pane on

		# Enable mouse mode (tmux 2.1 and above)
		set -g mouse on

		# -----------------------------------------------------------------------------
		# Plugin Manager - https://github.com/tmux-plugins/tpm
		# If tpm is installed manually i.e wtihout any installation script then follow the below steps:
		#   Step 1) git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		#   Step 2) Paste the below settings at the bottom of `.tmux.conf` file
		#   Step 3) Reload tmux if it's already started with `r
		#   Step 4) Launch tmux and hit `I (capital i) to fetch any plugins
		# -----------------------------------------------------------------------------

		# TPM related settings ---------------------------------------------------
		set -g @plugin 'tmux-plugins/tpm'
		set -g @plugin 'tmux-plugins/tmux-sensible'

		## List other plugins here and they will be managed by tpm ~~~~~~~~~~~~~~~

		set -g @plugin 'tmux-plugins/tmux-resurrect' ## https://github.com/Souptik2001/tmux-resurrect
		# set -g @plugin 'tmux-plugins/tmux-yank'## https://github.com/tmux-plugins/tmux-yank

		## List other plguins here and they will be managed by tpm ~~~~~~~~~~~~~~~

		# Initialize TPM (keep this line at the very bottom of your tmux.conf).
		run -b '~/.tmux/plugins/tpm/tpm'
		# TPM related settings ---------------------------------------------------
    '';
  };
}
