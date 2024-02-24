{ inputs, pkgs, self, ... }: {
  imports = [
    ./git
    ./tmux
    # ./zsh
    ./gnupg
    ./ssh
    ./pass
  ];
}