{pkgs, ...}: {
  imports = [
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hyprsunset.nix
    ./packages.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix

    ../common.nix
    ../flameshot.nix
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";

    GDK_BACKEND = "wayland,x11,*";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

  xdg.portal = {
    enable = true;
    configPackages = with pkgs; [xdg-desktop-portal-hyprland];
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
  };
}
