{ config, pkgs, inputs, ... }:

{

  imports = [
    ./modules
  ];

  home.username = "dennisd";
  home.homeDirectory = "/home/dennisd";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.signal-desktop
    pkgs.obsidian

    pkgs.haxor-news
    pkgs.yt-dlp

    pkgs.neofetch

    (pkgs.writeShellScriptBin "my-up" ''
        sudo bash $HOME/Dev/NixOSConfig/scripts/updateConfig.sh
    '')

    (pkgs.writeShellScriptBin "my-up-home" ''
        sudo bash $HOME/Dev/NixOSConfig/scripts/updateHome.sh
    '')
  ];

  home.sessionVariables = {
    EDITOR = "code";
    DEFAULT_BROWSER = "firefox";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
