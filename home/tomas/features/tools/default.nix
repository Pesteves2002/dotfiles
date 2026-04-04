{pkgs, ...}: {
  imports = [
    ./droidcam.nix
    ./git.nix
    ./nixvim
    ./signal.nix
    ./thunderbird.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    python3
  ];
}
