{pkgs, ...}: {
  imports = [
    ./git.nix
    ./nixvim
    ./zathura.nix
    ./thunderbird.nix
    ./droidcam.nix
  ];
}
