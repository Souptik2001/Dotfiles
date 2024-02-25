{ inputs, pkgs, self, ... }: {
  imports = [
    ./git
    ./tmux
    # ./zsh
    # Couldn't figure out a way of how to auto-import GPG keys. Till then have to do it manually.
    # ./gnupg
    ./ssh
    ./pass
  ];
}
