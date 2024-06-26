{ pkgs, lib, config, ... }:

{
  imports = [
    ./foot
    ./waybar
    ./swaylock
    ./swaync
    ./wlogout
    ./phone
  ];

  foot_terminal.enable = lib.mkDefault true;
  
  home.file.".config/hypr/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  home.packages = [
    pkgs.swww
    pkgs.foot
    pkgs.dunst
    pkgs.libnotify
    pkgs.rofi-wayland
    pkgs.networkmanagerapplet

    # media
    pkgs.imv
    pkgs.mpv
    pkgs.imagemagick

    # screenshots
    pkgs.swappy
    pkgs.grimblast
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable= true;
    extraConfig = ''
    $scriptsDir = $HOME/.local/bin
    $hyprScriptsDir = $HOME/.config/hypr/scripts

    monitor=,1920x1080@144,0x0,1
    env = XCURSOR_SIZE,24

    exec-once = waybar &
    exec-once = swaync &
    exec-once = lxqt-policykit-agent
    exec-once = bash $hyprScriptsDir/swww.sh
    exec-once = bash ~/.config/hypr/start.sh

    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    input {
        kb_layout = us, de
        kb_variant =
        kb_model =
        kb_options = grp:win_space_toggle
        kb_rules =

        follow_mouse = 1

        touchpad {
            natural_scroll = no
        }

        sensitivity = 0 
        # -1.0 - 1.0, 0 means no modification.
    }

    general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5
        gaps_out = 5

        layout = master

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false
    }

    decoration {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 20
        
        inactive_opacity = 1

        blur {
            enabled = true
            size = 3
            passes = 1
        }

        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
    }

    animations {
        enabled = yes

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }

    dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
    }

    master {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true
    }

    gestures {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = on
        workspace_swipe_fingers = 4
        workspace_swipe_distance = 100
    }

    misc {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
      disable_hyprland_logo = true
      disable_splash_rendering = true
    }

    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

    # See https://wiki.hyprland.org/Configuring/Keywords/ for more
    $mainMod = SUPER

    # Basic
    bindm = $mainMod, mouse:272, movewindow

    bind = $mainMod, T, exec, foot
    bind = $mainMod, K, killactive, 
    bind = $mainMod, V, togglefloating

    # System Control
    bind = $mainMod, M, exit
    bind = $mainMod, Z, exec, swaylock --config "$HOME/.config/swaylock/config" & disown
    bind = $mainMod, X, exec, wlogout

    # Screenshot/Screencapture
    bind = $mainMod, P, exec, $hyprScriptsDir/screenshot.sh s # drag to snip an area / click on a window to print it
    bind = $mainMod CTRL, P, exec, $hyprScriptsDir/screenshot.sh sf # frozen screen, drag to snip an area / click on a window to print it

    # Software
    bind = $mainMod, N, exec, rofi -show drun -show-icons
    bind = $mainMod, S, exec, signal-desktop
    bind = $mainMod, F, exec, firefox
    bind = $mainMod, B, exec, brave
    bind = $mainMod, O, exec, obsidian
    bind = $mainMod, C, exec, code

    # Media
    bindel = $mainMod, f3, exec, wpctl set-volume @DEFAULT_SINK@ 5%+
    bindel = $mainMod, f2, exec, wpctl set-volume @DEFAULT_SINK@ 5%-
    bindl = $mainMod, f1, exec, wpctl set-mute @DEFAULT_SINK@ toggle

    # Move focus with mainMod + arrow keys
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    bind = $mainMod, Left, workspace, -1
    bind = $mainMod, Right, workspace, +1

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Example special workspace (scratchpad)
    bind = $mainMod, L, togglespecialworkspace, magic
    bind = $mainMod SHIFT, L, movetoworkspace, special:magic
    '';

  };
}