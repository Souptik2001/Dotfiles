{ config, pkgs, ... }: {

  imports = [
    ../../configs
  ];

  home = {
    stateVersion = "23.11";

    # User name and home directory.
    username = "souptik";
    homeDirectory = "/home/souptik";

    # Environment variables for this user.
    sessionVariables = {
      EDITOR = "vim";
      QT_QPA_PLATFORM = "wayland";
    };

    # Link files into the home directory from nix store.
    file = {
      "wallpaper.jpg" = {
        source = ../../wallpaper.jpg;
        target = ".wallpaper.jpg";
      };
    };

    # Packages for this user.
    packages = with pkgs; [
      kitty
      zip
      unzip
      tmux
      vscode
      google-chrome
      spotify
      tailscale
      openssl
      inetutils # network utilities like telnet etc
      bind # more network utilities like dig etc
      inotify-tools
      flameshot
      vlc
      python3
      jq
      yq
      wget
      dive
      ffmpeg
      zoom-us
      nixpkgs-fmt
      docker
      gnupg
      pinentry-gnome
      mariadb
      filezilla

      # NodeJS. We have installed nodejs_21 here. NVM is not availble with it, and shouldn't be used also. As nix is itself a version manager.
      # Ideally each project should have a nodejs version specified in its .nix file.
      nodejs_21

      # password store related packages
      pass
      passExtensions.pass-import
      passExtensions.pass-update
      gopass-jsonapi

      # copy/pasting via command line
      xsel
      # getting battery and temperature information
      acpi
      # getting currently playing media information
      playerctl

      # PHP related
      php81
      php81Packages.composer

      #Slack
      slack
    ];
  };

  programs = {
    htop = {
      enable = true;
      settings.color_scheme = 6;
    };

    home-manager = {
      enable = true;
    };

    password-store = {
      enable = true;
    };
  };
}
