{ config, pkgs, inputs, ... }:

{

  imports = [
    ./modules
  ];

  code_module.enable = false;
  thunderbird.enable = false;
  git_module.enable = false;

  home.username = "gaming";
  home.homeDirectory = "/home/gaming";

  home.stateVersion = "23.11";

  home.sessionVariables = {
    EDITOR = "nano";
    DEFAULT_BROWSER = "firefox";
  };

  programs.home-manager.enable = true;
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
