{
  pkgs,
  lib,
  config,
  ...
}: {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${lib.getExe config.programs.swaylock.package} -defF";
      }
      {
        # TODO: Make dynamic for window manager
        event = "after-resume";
        command = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on";
      }
      {
        event = "lock";
        command = "${lib.getExe config.programs.swaylock.package} -defF";
      }
    ];
    timeouts = [
      {
        timeout = 900;
        command = "${lib.getExe config.programs.swaylock.package} -defF";
      }
      {
        # TODO: Make dynamic for window manager
        timeout = 1200;
        command = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms off";
      }
    ];
  };
}
