{pkgs, ...}: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./mako.nix
    ./fonts.nix
    ./firefox.nix
    ./rnote.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    cider-2
  ];
}
