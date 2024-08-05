{pkgs, ...}: {
  imports = [
    ../common.nix
    ../features/graphical/hyprland
  ];

  home.packages = with pkgs; [
    firefox
    vesktop
  ];

  home.stateVersion = "23.11";
}
