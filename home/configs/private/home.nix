{ config, pkgs, inputs, ... }:

{

  imports = [
    ./modules
  ];

  firefox_module.enable = false;

  home.username = "private";
  home.homeDirectory = "/home/private";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs.obsidian

    pkgs.brave

    pkgs.haxor-news
  ];

  home.sessionVariables = {
    EDITOR = "code";
    DEFAULT_BROWSER = "brave";
  };

  programs.home-manager.enable = true;
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
