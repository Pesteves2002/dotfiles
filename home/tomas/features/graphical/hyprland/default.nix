{
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
}
