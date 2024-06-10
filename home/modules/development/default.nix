{ pkgs, config, lib, ... }:

{
  options = {
    dev_module.enable = lib.mkEnableOption "Enable development module";
  };

  config = lib.mkIf config.dev_module.enable {
    environment.systemPackages = with pkgs; [

      (pkgs.writeShellScriptBin "my-python-shell" ''
          sudo bash $HOME/Dev/NixOSConfig/development/python/add-phtyon-shell.sh
      '')

    ];
  {

}