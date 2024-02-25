## My Dotfiles

**😛🙈 Not at all copied from - https://github.com/rounakdatta/dotfiles**

Here is how to use it -

- Copy `.ssh/keys` and entire `.gnugp` folder to a backup (pendrive maybe?)
- Setup a fresh NixOS installation.
- You have to create the following directory structure in your home directory `~`  -
    - Create a folder called `nix-secrets`.
    - Copy ssh keys into `nix-secrets/ssh/keys`. Please refer to this for understand how I organize my ssh keys -
    - Create a folder called `gpg` in `nix-secrets` (NOT FOR NOW)-
        - Copy `private.key`  - `gpg --output ./private.key --armor --export-secret-keys <id>`
        - Copy `public.key`  - `gpg --output ./public.key --armor --export <id>`
        - Copy `trust-db.txt` - `gpg --export-ownertrust > ./trust-db.txt`
- Copy `.gnupg` folder to `~/.gnugp`.
- Run `sudo nixos-rebuild switch --flake .#souptik_hp`
- Remove `~/nix-secrets`.
- Restart the system.
- Ready!