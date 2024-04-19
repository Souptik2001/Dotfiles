**😛🙈 Not at all copied from - https://github.com/rounakdatta/dotfiles**

Steps to use -

**Before formatting the system -**

- Copy `.ssh/keys` and entire `.gnugp` folder to a backup (pendrive maybe?)

**After formatting the system -**

- Setup a fresh NixOS installation.
- Create a folder named `~/.ssh/`.
- Copy the `.ssh/keys` folder you previously backed up to `.ssh/keys` directory.
- Copy `.gnupg` folder you previously backed up to `~/.gnugp`.
- **[Please ignore this whole step for now]** You have to create the following directory structure in your home directory `~`  -
    - Create a folder called `nix-secrets`.
    - Copy ssh keys into `nix-secrets/ssh/keys`. Please refer to this for understand how I organize my ssh keys -
    - Create a folder called `gpg` in `nix-secrets` (NOT FOR NOW)-
        - Copy `private.key`  - `gpg --output ./private.key --armor --export-secret-keys <id>`
        - Copy `public.key`  - `gpg --output ./public.key --armor --export <id>`
        - Copy `trust-db.txt` - `gpg --export-ownertrust > ./trust-db.txt`
- Run `sudo nixos-rebuild switch --flake .#souptik_hp`
- Remove `~/nix-secrets`.
- Restart the system.
- Done.