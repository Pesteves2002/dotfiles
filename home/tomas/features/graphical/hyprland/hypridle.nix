{
  lib,
  config,
  ...
}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof ${lib.getExe config.programs.hyprlock.package} || ${lib.getExe config.programs.hyprlock.package}"; # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 150; # 2.5min.
          on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl -r"; # monitor backlight restore.
        }

        {
          timeout = 150; # 2.5min.
          on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
          on-resume = "brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight.
        }

        {
          timeout = 300; # 5min
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
        }

        {
          timeout = 330; # 5.5min
          on-timeout = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms off"; # screen off when timeout has passed
          on-resume = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on"; # screen on when activity is detected after timeout has fired.
        }
      ];
    };
  };
}
