{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ./fonts.nix
    ./gtk.nix
    ./mako.nix
    ./qt.nix
    ./rnote.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    cider-2
    feh
    obsidian
  ];
}
