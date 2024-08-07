{
  imports = [
    ../common.nix
    ../features/graphical/hyprland

    ../features/graphical/nvidia.nix
  ];

  monitors = [
    {
      name = "DP-3";
      width = 2560;
      height = 1440;
      refreshRate = 144;
      x = 0;
      workspace = "1";
      primary = true;
    }
    {
      name = "DP-2";
      width = 1920;
      height = 1080;
      refreshRate = 144;
      x = 2560;
      y = 200;
      workspace = "2";
    }
    {
      name = "Unknown-1";
      enabled = false;
    }
  ];

  home.stateVersion = "23.11";
}
