{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tg
    telegram-desktop
  ];
}