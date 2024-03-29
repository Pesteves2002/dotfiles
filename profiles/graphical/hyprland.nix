{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./waybar.nix ./wlogout.nix];

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    settings = {
      "$mod" = "SUPER";
      input = {
        kb_layout = "pt";
        numlock_by_default = true;
        repeat_rate = 30;
      };

      bind = [
        # Open terminal
        "$mod, Return, exec, alacritty"

        # Close Active Window
        "$mod, Q, killactive"

        # Run wlogout
        "$mod, Backspace, exec, pkill wlogout; wlogout"

        # Change focus
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Change focus (arrows)
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Move workspace between monitors
        "$mod SHIFT, h, movecurrentworkspacetomonitor, l"
        "$mod SHIFT, l, movecurrentworkspacetomonitor, r"
        "$mod SHIFT, k, movecurrentworkspacetomonitor, u"
        "$mod SHIFT, j, movecurrentworkspacetomonitor, d"

        # Move workspace between monitors (arrwows)
        "$mod SHIFT, left, movecurrentworkspacetomonitor, l"
        "$mod SHIFT, right, movecurrentworkspacetomonitor, r"
        "$mod SHIFT, up, movecurrentworkspacetomonitor, u"
        "$mod SHIFT, down, movecurrentworkspacetomonitor, d"

        # Swap monitors
        "$mod, s, swapactiveworkspaces, DP-3 DP-2"

        # Move window to the special workspace
        "$mod, C, movetoworkspace, special"

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

        # Toggle float state
        "$mod, Escape, togglefloating"

        # Toggle Fullscreen
        "$mod, f, fullscreen"

        # Toggle Fake Fullscreen
        "$mod SHIFT, f, fakefullscreen"

        # Pin floating window
        "$mod, p, pin"

        # Force reload
        "$mod SHIFT, r, forcerendererreload"
        "$mod SHIFT, r, exec, pkill .waybar-wrapped; waybar"

        # Take Screenshot
        ", Print, exec, grim -l 0 -g \"$(slurp)\" - | swappy -f -"

        # Start xwaylandvideobridge
        "$mod SHIFT, s, exec, pkill .xwaylandvideob; xwaylandvideobridge"

        # Music controls
        "CTRL, SPACE, exec, playerctl play-pause"
        "CTRL SHIFT, left, exec, playerctl previous"
        "CTRL SHIFT, right, exec, playerctl next"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindr = [
        # Start wofi opens wofi on first press, closes it on second
        "$mod, D, exec, pkill wofi || wofi --show=drun"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      binds = {allow_workspace_cycles = true;};

      misc = {disable_hyprland_logo = true;};

      monitor = [
        "DP-3, 2560x1440@144, 0x0,1,bitdepth,10"
        "DP-2, 1920x1080@144, 2560x200,1"
      ];

      workspace = [
        "1, monitor:DP-3, default:true"
        "2, monitor:DP-2, default:true"
        "3, monitor:DP-2, default:true"
      ];

      windowrule = [
        "workspace 1,^(Alacritty)$"
        "workspace 2,^(firefox)$"
        "workspace 3,^(discord)$"

        # Remove window to allow "Discord"
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
        "workspace 10 silent,^(xwaylandvideobridge)$"
      ];

      exec-once = [
        "waybar"
        "swww init && swww img ~/.dotfiles/config/wallpapers/planet.png"

        "alacritty"
        "firefox"
        "Discord"
      ];

      general = {
        border_size = 3;
        gaps_in = 10;
        gaps_out = 10;
        "col.active_border" = "rgb(61f4de) rgb(6e78ff) 45deg";
        "col.inactive_border" = "rgb(f3696e) rgb(f8a902) 45deg";

        # stop ping pong with windows
        no_focus_fallback = true;

        resize_on_border = true;
      };

      decoration = {
        rounding = 20;
        inactive_opacity = 0.9;
      };

      animation = [
        "borderangle, 1, 30, linear, loop"
      ];

      bezier = [
        "linear, 0.0, 0.0, 1.0, 1.0"
      ];
    };
    xwayland.enable = true;
  };

  programs.wofi = {enable = true;};

  home.packages = with pkgs; [
    swww
    xwaylandvideobridge
    playerctl
  ];
}
