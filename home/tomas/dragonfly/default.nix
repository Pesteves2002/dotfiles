{
  imports = [
    ../common.nix

    ../features/graphical/hyprland
    ../features/graphical/hyprland/laptop.nix

    ../features/graphical/amd.nix

    ../features/games/geforce-now.nix
    ../features/games/minecraft.nix
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      x = 0;
      y = 1080;
      primary = true;
      workspace = "1";
    }
  ];

  home.stateVersion = "23.11";
}
