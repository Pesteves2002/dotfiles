{pkgs, ...}: {
  imports = [
    ./wofi.nix
    ./waybar.nix
    ./wlogout.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./packages.nix

    ../common.nix

    ../flameshot.nix
  ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";
  home.sessionVariables.MOZ_ENABLE_WAYLAND = "1";

  xdg.portal = {
    enable = true;
    configPackages = with pkgs; [xdg-desktop-portal-hyprland];
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
  };
}
