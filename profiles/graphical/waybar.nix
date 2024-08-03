{pkgs, ...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        # height = 24;
        spacing = "10";
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["battery" "pulseaudio" "cpu" "memory"];
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
          tooltip-format = "Memory - {used:0.1f}GB used";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
          };
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

          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-full" = "  {capacity}%";
          "format-icons" = ["" "" "" "" ""];
        };
      };
    };

    style = ''
        * {
         border: none;
         font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
         font-size: 16px;
       }

       window#waybar {
         background: transparent;
       }

       #workspaces {
         border-radius: 10px;
         margin-right: 15px;
        margin-left:0;
         padding-left:0;
         padding-top: 1px;
         padding-right: 10px;
       }

      #workspaces button.active {
         background: #ffffff;
        color: #000000;
       }

       #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery, #cpu, #memory{
         border-radius: 10px;
         padding-left: 10px;
         padding-right: 10px;
         margin-right: 15px;
       }

       #pulseaudio, #network {
         border-top-left-radius: 0;
         border-bottom-left-radius: 0;
         padding-left: 5px;
       }

       #clock {
         margin-right: 0;
       }
    '';
  };

  home.packages = with pkgs; [
    pulseaudio
    pulsemixer
  ];
}
