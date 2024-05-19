{ pkgs, inputs, config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ./users.nix
      ./audio.nix
      ./terminal.nix
      ./docker.nix
      ./gaming.nix
    ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    useOSProber = true;
  };

  environment = {
    systemPackages = with pkgs; [
      home-manager
      
      # Hardware
      usbutils

      # Data
      wget
      zip
      unzip
      gitprograms.hyprland.enable = true;programs.hyprland.enable = true;
      rsync

      # Misc
      util-linux
      lxqt.lxqt-policykit
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  programs = {
    hyprland.enable = true;
  };

  services = {
    logind = {
      lidSwitch = "suspend";
      lidSwitchExternalPower = "suspend";
    };
    xserver = {
      xkb.layout = "us,de";
      xkb.variant = "";
      xkb.options = "grp:win_space_toggle";
      enable = true;
      displayManager.sddm.enable = false;
    };
    blueman.enable = true;
    openssh.enable = true;
  };

  networking = {
    hostName = "nixos";
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    # proxy = {
    #  default = "http://user:password@proxy:port/";
    #  noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };

  security = {
    polkit.enable = true;
    pam.services.swaylock = {};  
  };

  time.timeZone = "Europe/Berlin";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome
      liberation_ttf
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      proggyfonts
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

}
