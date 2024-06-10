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
          # git
          mhutchie.git-graph
          eamodio.gitlens

          # organization
          gruntfuggly.todo-tree

          #code quality
          shardulm94.trailing-spaces

          # devops
          ms-azuretools.vscode-docker
          ms-vscode-remote.remote-containers
          ms-vscode-remote.remote-ssh
          github.vscode-github-actions

          # nix
          arrterian.nix-env-selector
          jnoortheen.nix-ide
          mkhl.direnv

          # languages
          foxundermoon.shell-format
          ms-python.python
          yzhang.markdown-all-in-one

          # assistants
          # Codium.codium
          # GitHub.copilot
          # GitHub.copilot-chat
          # TabNine.tabnine-vscode

          # visuals
          vscode-icons-team.vscode-icons
          catppuccin.catppuccin-vsc

          # misc
          # pnp.polacode
          humao.rest-client
        ];
        userSettings = {
          editor.fontFamily = "'JetBrainsMono Nerd Font Mono'";
          terminal.integrated.fontFamily = "'JetBrainsMono Nerd Font Mono'";
        };
      };

      direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
    };
  };
}