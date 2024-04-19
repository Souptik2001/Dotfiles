{ inputs, pkgs, ... }: {
  # services.xserver.displayManager.startx.enable = true;

  # Enable hyperland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Set some required environment variables for hyperland.
  environment.sessionVariables = {
    # If your cursor becomes invisible.
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland.
    NIXOS_OZONE_WL = "1";
  };

  # Set some hardware configurations for hyperland.
  hardware = {
	# Opengl
	opengl.enable = true;

	# Most wayland compositors need this
	nvidia.modesetting.enable = true;
  };

  # Desktop interaction like link opening, screen sharing, etc.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  security = {
    polkit.enable = true;
    pam.services.ags = {};
  };

  # Get some system packages for hyperland.
  environment.systemPackages = with pkgs; with gnome; [
    loupe
    adwaita-icon-theme
    nautilus
    baobab
    gnome-calendar
    gnome-boxes
    gnome-system-monitor
    gnome-control-center
    gnome-weather
    gnome-calculator
    gnome-clocks
    gnome-software # for flatpak
    wl-gammactl
    wl-clipboard
    wayshot
    pavucontrol
    brightnessctl

    # Top desktop bar
    waybar

    # Network manager droplet
    networkmanagerapplet

    # Logout screen
    wlogout

    # Wallpaper
    swww

    # Notification daemon
    dunst
    libnotify

    # App launcher
    rofi-wayland
  ];

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services = {
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    accounts-daemon.enable = true;
    gnome = {
      evolution-data-server.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
    };
  };
}
