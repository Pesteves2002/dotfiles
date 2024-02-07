# # profiles/graphical/hyprland.nix
#
# Author: Tomás Esteves <tomasesteves2002@gmail.com>
# URL:    https://github.com/Pesteves2002/dotfiles
#
# hyprland configuration

{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    settings = {
      "$mod" = "SUPER";
      input = { "kb_layout" = "pt"; };

      bind = [

        # Open terminal
        "$mod, Return, exec, alacritty"

        # Close Active Window
        "$mod, Q, killactive"

        # Move focus with mainMod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, C, movetoworkspace, special"
      ];

      bindr = [
        # Start wofi opens wofi on first press, closes it on second
        "$mod, D, exec, pkill wofi || wofi --show=drun"
      ];

      misc = { disable_hyprland_logo = true; };

      monitor = [
        "DP-3, 2560x1440@144, 0x0,1,bitdepth,10"
        "DP-2, 1920x1080@144, 2560x200,1"
      ];

      workspace = [
        "1, monitor:DP-3, default:true"
        "2, monitor:DP-2, default:true"
        "3, monitor:DP-2, default:true"
      ];

      "exec-once" =
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP";

    };
    xwayland.enable = true;
  };

  programs.wofi = { enable = true; };

}

