{pkgs, ...}:

{
    programs = {
        zsh.enable = true;
        starship = {
            enable = true;
            settings = {
                add_newline = false;
                format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
                shlvl = {
                    disabled = false;
                    symbol = "ﰬ";
                    style = "bright-red bold";
                };
                shell = {
                    disabled = false;
                    format = "$indicator";
                    fish_indicator = "";
                    bash_indicator = "[BASH](bright-white) ";
                    zsh_indicator = "[ZSH](bright-white) ";
                };
                username = {
                    style_user = "bright-white bold";
                    style_root = "bright-red bold";
                };
            };
        };
    };

    environment.systemPackages = with pkgs; [
        kitty
        neovim
        
        # ls replacement
        eza

        (writeShellScriptBin "ls" ''
        eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions
        '')
        (writeShellScriptBin "lls" ''
        eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions --tree --level=2
        '')
        (writeShellScriptBin "llls" ''
        eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions --tree --level=3
        '')
        (writeShellScriptBin "lllls" ''
        eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions --tree --level=4
        '')
        (writeShellScriptBin "lsa" ''
        eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions --all
        '')
        (writeShellScriptBin "llsa" ''
        eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions --all --tree --level=2
        '')
        (writeShellScriptBin "lllsa" ''
        eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions --all --tree --level=3
        '')
        (writeShellScriptBin "llllsa" ''
        eza --color=always --long --git --no-filesize --icons --no-time --no-user --no-permissions --all --tree --level=4
        '')

        (writeShellScriptBin "open" ''
        xdg-open $@
        '')
        
        # cd replacement
        zoxide

        tlrc
        thefuck
    ];
}