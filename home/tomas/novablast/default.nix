{pkgs, ...}: {
  imports = [
    ../common.nix
    ../features/graphical/hyprland

    ../features/graphical/nvidia.nix
  ];

  home.stateVersion = "23.11";
}
