{ pkgs, ... }: {

  programs.waybar = {

    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right =
          [ "cpu" "memory" ];
        "custom/hello-from-waybar" = {
          format = "hello {}";
          max-length = 40;
          interval = "once";
          exec = pkgs.writeShellScript "hello-from-waybar"
            ''echo "from within waybar"      '';
        };
      };

      clock = {
        format-alt = "{:%Y-%m-%d}";
        tooltip-format = "{:%Y-%m-%d | %H:%M}";
      };

      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };

    };

    #style =
    #    "* {    border: none;    border-radius: 0; font-family: nerdfonts      }  window#waybar {    background: #16191C;    color: #AAB2BF;  }  #workspaces button {    padding: 0 5px;  }";
  };

}
