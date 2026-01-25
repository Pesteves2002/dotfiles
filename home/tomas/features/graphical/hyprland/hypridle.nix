{
  lib,
  pkgs,
  config,
  ...
}: let
  loginctl = lib.getExe' pkgs.systemd "loginctl";
  systemctl = lib.getExe' pkgs.systemd "systemctl";
  hyprctl = lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl";
  inherit (config.laptop) isLaptop;

  lockTimeout =
    if isLaptop
    then 300 # 5 minutes
    else 900; # 15 minutes
in {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # lock screen.
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
            timeout = lockTimeout;
            on-timeout = "${loginctl} lock-session";
          }
          {
            timeout = lockTimeout + 10;
            on-timeout = "${hyprctl} dispatch dpms off";
            on-resume = "${hyprctl} dispatch dpms on";
          }
        ]
        ++ lib.optionals isLaptop [
          {
            timeout = lockTimeout + 30;
            on-timeout = "${systemctl} suspend";
          }
        ];
    };
  };
}
