{pkgs, ...}: {
  home.packages = with pkgs; [
    fira-code
    nerdfonts
    font-awesome
  ];

  fonts.fontconfig.enable = true;
}
