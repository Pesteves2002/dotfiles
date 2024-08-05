{
  config,
  lib,
  pkgs,
  ...
}: let
  i3Mod = "Mod4";
  alt = "Mod1";
in {
  imports = [./i3-bar.nix];

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = i3Mod;

        keybindings = lib.mkOptionDefault {
          # kill focused window
          "${i3Mod}+q" = "kill";

          # Spawn a new terminal
          "${i3Mod}+Return" = "exec alacritty";

          # Move around workspaces
          "${alt}+Tab" = "workspace next";
          "${alt}+Shift+Tab" = "workspace prev";

          # Enter full screen
          "{$i3Mod}+f" = "fullscreen toggle";

          # PrintScreen
          "Print" = "exec flameshot gui";

          # Change focus
          "${i3Mod}+h" = "focus left";
          "${i3Mod}+j" = "focus down";
          "${i3Mod}+k" = "focus up";
          "${i3Mod}+l" = "focus right";

          # Change focus (arrows)
          "${i3Mod}+Left" = "focus left";
          "${i3Mod}+Down" = "focus down";
          "${i3Mod}+Up" = "focus up";
          "${i3Mod}+Right" = "focus right";

          # Change workspace monitor
          "${i3Mod}+Shift+h" = "move workspace to output left";
          "${i3Mod}+Shift+j" = "move workspace to output down";
          "${i3Mod}+Shift+k" = "move workspace to output up";
          "${i3Mod}+Shift+l" = "move workspace to output right";

          # Change workspace monitor (arrows)
          "${i3Mod}+Shift+Left" = "move workspace to output left";
          "${i3Mod}+Shift+Down" = "move workspace to output down";
          "${i3Mod}+Shift+Up" = "move workspace to output up";
          "${i3Mod}+Shift+Right" = "move workspace to output right";

          # Toggle split
          "${i3Mod}+e" = "layout toggle split";

          # Toggle floating window
          "${i3Mod}+Escape" = "floating toggle";

          # Restart i3
          "${i3Mod}+Shift+r" = "restart";

          # Resize mode
          "${i3Mod}+r" = ''mode "resize"'';

          # Move mode
          "${i3Mod}+m" = ''mode "move"'';
        };

        modes = {
          resize = {
            Escape = "mode default";
            Return = "mode default";
            "${i3Mod}+r" = "mode default";

            h = "resize shrink width 5 px or 5 ppt";
            j = "resize grow height 5 px or 5 ppt";
            k = "resize shrink height 5 px or 5 ppt";
            l = "resize grow width 5 px or 5 ppt";

            Left = "resize shrink width 5 px or 5 ppt";
            Down = "resize grow height 5 px or 5 ppt";
            Up = "resize shrink height 5 px or 5 ppt";
            Right = "resize grow width 5 px or 5 ppt";
          };

          move = {
            Escape = "mode default";
            Return = "mode default";
            "${i3Mod}+m" = "mode default";

            # Change focus
            "${i3Mod}+h" = "focus left";
            "${i3Mod}+j" = "focus down";
            "${i3Mod}+k" = "focus up";
            "${i3Mod}+l" = "focus right";

            # Change focus (arrows)
            "${i3Mod}+Left" = "focus left";
            "${i3Mod}+Down" = "focus down";
            "${i3Mod}+Up" = "focus up";
            "${i3Mod}+Right" = "focus right";

            h = "move left";
            j = "move down";
            k = "move up";
            l = "move right";

            Left = "move left";
            Down = "move down";
            Up = "move up";
            Right = "move right";
          };
        };

        fonts = {
          names = ["JetBrains Mono Nerd Font"];
          style = "Bold Semi-Condensed";
          size = 14.0;
        };

        menu = "${pkgs.rofi}/bin/rofi -matching normal -modi drun -show drun";

        window = {
          titlebar = false;
          hideEdgeBorders = "smart";
        };

        assigns = {
          "1" = [{class = "Alacritty";}];
          "2" = [{class = "firefox";}];
          "3" = [{class = "discord";}];
        };

        workspaceAutoBackAndForth = true;

        bars = [
          {
            position = "top";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
            fonts = {
              names = ["DejaVu Sans Mono"];
              style = "Bold Semi-Condensed";
              size = 8.0;
            };
            colors = {
              separator = "#666666";
              background = "#222222";
              statusline = "#dddddd";
            };
          }
        ];
      };
    };
  };
}
