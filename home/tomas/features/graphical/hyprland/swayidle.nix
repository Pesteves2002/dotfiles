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
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${lib.getExe config.programs.swaylock.package} -defF";
      }
      {
        timeout = 350;
        command = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms off";
        resumeCommand = "${lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl"} dispatch dpms on";
      }
    ];
  };
}
