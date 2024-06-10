{ pkgs, lib, config, ... }:

{
  options = {
		git_module.enable = lib.mkEnableOption "Enable Git module";
	};

  config = lib.mkIf config.git_module.enable {
    # Enable the git module

    programs.git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "d";
      userEmail = "d.d@d.d";
      extraConfig = {
        init.defaultBranch = "main";
      };
      aliases = {
        undo = "reset HEAD~1 --mixed";
        amend = "commit -a --amend";
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };

    home.packages =  with pkgs; [
      radicle-node
    ];
  };
}