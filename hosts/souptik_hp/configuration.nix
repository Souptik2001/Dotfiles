# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, lib, ... }:

{
  # Import any modules here.
  # Hardware-configuration is a must.
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Uncomment this to use hyperland, but there's lot of bugs. Also comment line 88, 89.
      # ./hyperland.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # boot.initrd.kernelModules = [ "amdgpu" ];

  # Setup keyfile
  # boot.initrd.secrets = {
  #   "/crypto_keyfile.bin" = null;
  # };

  # # Enable swap on luks
  # boot.initrd.luks.devices."luks-64e3ad83-3d1c-4a12-ba7e-c58857ca6ae7".device = "/dev/disk/by-uuid/64e3ad83-3d1c-4a12-ba7e-c58857ca6ae7";
  # boot.initrd.luks.devices."luks-64e3ad83-3d1c-4a12-ba7e-c58857ca6ae7".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "souptik"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  environment.sessionVariables = {
    EDITOR = "vim";
    QT_QPA_PLATFORM = "wayland";
  };

  # Configure nameservers.
  # Put any custom nameservers here - like I have for NextDNS.
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  networking.extraHosts =
    ''
      127.0.0.1 local.decoupledwp.com local.enchantingtravels.com local.ymtvacations.com local.europeexpress.com
    '';

  nix.settings = {
    # this is required because flakes hasn't graduated into a stable feature yet
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Start on display manager configuration ----

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # # Enable the GNOME Desktop Environment -- disabling as we will be no longer use GNOME. -- enabling it back as we will be using GNOME.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # End of display manager configuration ----

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth.
  hardware.bluetooth.enable = true;

  # So that we can get a bluetooth GUI.
  services.blueman.enable = true;

  # This is for making the GNUPG pinentry program work, somehow
  services.pcscd.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.souptik = {
    isNormalUser = true;
    description = "Souptik";
    # Please change it using `passwd` as mentioned above!
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      firefox
      git
      vim
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  programs.zsh.interactiveShellInit = ''
		set NIXPKGS_ALLOW_UNFREE 1

		# although we've set the NixOS-level setting, remember that Chrome would require this `TZ` envvar
		# otherwise, it defaults to UTC
		set TZ Asia/Kolkata
		'';

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # None is instealled in system profile, because we prefer everything in user profile!
  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

#   programs.fish.enable = true;
  fonts = {
    packages = with pkgs; [
      noto-fonts
      font-awesome
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra
    ];
  };

  # temporary: as we learn more Nix, this config will find its right home
  services.tailscale.enable = true;

  virtualisation.docker = {
    enable = true;
  };
}
