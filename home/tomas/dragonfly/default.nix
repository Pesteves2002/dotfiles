{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.mac-app-util.homeManagerModules.default

    ../common.nix

    ../features/graphical/aerospace.nix
    ../features/graphical/stylix.nix
    ../features/shell
    ../features/tools
  ];

  home.packages = with pkgs; [
    atool
    zip
    unzip

    tmux

    htop-vim

    man-pages
    tldr

    fastfetch

    fzf
    ripgrep
    fd

    curl
    wget

    bat
  ];

  # monitors = [
  #   {
  #     name = "eDP-1";
  #     width = 1920;
  #     height = 1080;
  #     refreshRate = 60;
  #     x = 0;
  #     y = 0;
  #     primary = true;
  #     workspace = "1";
  #   }
  # ];

  # credentials = {
  #   # hostname = "dragonfly";
  #   user = "tomas";
  # };

  # laptop.isLaptop = true;

  home.stateVersion = "24.11";
}
