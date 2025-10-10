{pkgs, ...}: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./mako.nix
    ./fonts.nix
    ./firefox.nix
    ./rnote.nix
  ];

  home.packages = with pkgs; [
    unstable.cider-2
  ];
}
