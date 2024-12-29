{pkgs, ...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "10 10 10 10";
        # height = 24;
        modules-left = ["hyprland/workspaces" "mpris"];
        modules-center = ["clock"];
        modules-right = ["network" "backlight" "battery" "pulseaudio" "cpu" "memory"];

        "custom/hello-from-waybar" = {
          format = "hello {}";
          max-length = 40;
          interval = "once";
          exec =
            pkgs.writeShellScript "hello-from-waybar"
            ''echo "from within waybar"      '';
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        cpu = {
          format = "{usage}% ";
          on-click = "kitty htop";
        };

        memory = {
          format = "{}% ";
          tooltip = "true";
          tooltip-format = "Memory {used:0.1f}GB used";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            default = "";
          };
          scroll-step = 5;
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-click-right = "kitty pulsemixer";
        };

        "battery" = {
          "interval" = 10;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };

          "format" = "{capacity}% {icon}";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-full" = "  {capacity}%";
          "format-icons" = ["" "" "" "" ""];
        };

        backlight = {
          "format" = "{percent}% {icon}";
          "on-scroll-up" = "brightnessctl set 1%-";
          "on-scroll-down" = "brightnessctl set 1%+";
          "format-icons" = ["" ""];
        };

        network = {
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-disconnected" = "";
        };

        mpris = {
          format = "{title} - {artist} - {album}";

          # Uncomment to ignore specific players
          ignored-players = ["firefox"];
        };
      };
    };

    style = builtins.readFile ./style.css;
  };

  home.packages = with pkgs; [
    pulseaudio
    pulsemixer
  ];
}
