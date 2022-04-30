## Install `tmux`

- `pacman -S tmux`
- Install [`tpm`](https://github.com/tmux-plugins/tpm) which is used to install tmux plugins very easily. Use `git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm`(SSH) or `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`(HTTPS).
Paste this at the bottom of `.tmux.conf` file:
	```
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

	# Initialize TPM (keep this line at the very bottom of your tmux.conf).
	run -b '~/.tmux/plugins/tpm/tpm'
	# TPM related settings ---------------------------------------------------
	```

----

## Using `tmux`

### Sessions:

#### Create a new session -

- `tmux` ( No name assigned )
- `tmux new -s <name>` ( Create a session with name )

#### Rename a session -

- `tmux rename-session -t <prev_name> <new_name>`

#### List sessions -

- `tmux ls`

#### Delete a session -

- `tmux kill-session -t <name>`

#### Enter/attach into a session -

- `tmux attach -t <name>`

### Windows:

The window numbering by default will start form 0 just like index of an array.

#### Create a new window -

- `ctrl+b c`

#### Rename a window -

- While in the window you want to rename press the below key combination.
- `ctrl+b ,`
- Type the new name and press `enter key`.

#### Close a window -

- Just exit out from all the panes using `exit` command. That's it.

### Panes:

Before starting you must mug-up your invoke key combination. You have to press this key combination before executing any action. By default this is `ctrl+b`.

#### Create new pane horizontally -

- `ctrl+b %`

#### Create new pane vertically -

- `ctrl+b "`

#### Switch focus between panes -

- After pressing `ctrl+b` use arrow keys to move to that particular direction pane.

----

## Configuring tmux

- ["Making a tmux pretty and Usable"](https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/) - Blog

----

## Tmux Resurrect

- Link to tmux-resurrect [git repository](https://github.com/tmux-plugins/tmux-resurrect).
- Before doing this you must learn about configuring tmux, because we will use it a lot here.
- So, before installing tmux-resurrect you must install `tpm` which is [`Tmux Plugin Manager`](https://github.com/tmux-plugins/tpm), because tmux-resurrect is nothing but just a tmux plugin.
- 
