{lib, pkgs, ... }:

{
  imports = [
    ./firefox
    ./thunderbird
    ./git
    ./hypr
    ./vscode
    ./style/catppuccin.nix
    ./telegram
    ./development
  ];

  firefox_module.enable = lib.mkDefault true;
  thunderbird.enable = lib.mkDefault false;
  git_module.enable = lib.mkDefault true;
  code_module.enable = lib.mkDefault true;
  dev_module.enable = lib.mkDefault true;
}
