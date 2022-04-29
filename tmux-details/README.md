## Install `tmux`

`pacman -S tmux`

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
