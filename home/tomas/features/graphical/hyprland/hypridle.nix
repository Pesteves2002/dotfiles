{
  lib,
  pkgs,
  config,
  ...
}: let
  hyprlock = lib.getExe pkgs.hyprlock;
  loginctl = lib.getExe' pkgs.systemd "loginctl";
  systemctl = lib.getExe' pkgs.systemd "systemctl";
  hyprctl = lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl";
  cfg = config.services.hypridle;
in {
  options.services.hypridle.enableSuspend = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable system suspend by inactivity.";
  };

  config = {
    services.hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "pidof hyprlock || ${hyprlock}"; # lock screen.
          after_sleep_cmd = "${hyprctl} dispatch dpms on"; # turn on display after resume.
          before_sleep_cmd = "${loginctl} lock-session"; # lock before suspend.
        };

        listener =
          [
            {
              timeout = 150;
              on-timeout = "brightnessctl -s set 10";
              on-resume = "brightnessctl -r";
            }
            {
              timeout = 150;
              on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
              on-resume = "brightnessctl -rd rgb:kbd_backlight";
            }
            {
              timeout = 300;
              on-timeout = "${loginctl} lock-session";
            }
            {
              timeout = 310;
              on-timeout = "${hyprctl} dispatch dpms off";
              on-resume = "${hyprctl} dispatch dpms on";
            }
          ]
          ++ lib.optionals cfg.enableSuspend [
            {
              timeout = 330;
              on-timeout = "${systemctl} suspend";
            }
          ];
      };
    };
  };
}
