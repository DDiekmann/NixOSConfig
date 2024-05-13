{ pkgs, config, lib, ... }:

{
  options = {
    code_module.enable = lib.mkEnableOption "Enable vscode";
  };

  config = lib.mkIf config.code_module.enable
  {
    programs = {
      vscode = {
        enable = true;
        package = pkgs.vscode;
        extensions = with pkgs.vscode-extensions; [
          mhutchie.git-graph
          foxundermoon.shell-format
          ms-azuretools.vscode-docker
          ms-vscode-remote.remote-containers
          ms-vscode-remote.remote-ssh
          github.vscode-github-actions
          vscode-icons-team.vscode-icons
        ];
      };

      direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
    };
  };
}