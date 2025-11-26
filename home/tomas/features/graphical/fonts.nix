{pkgs, ...}: {
  home.packages = with pkgs;
    builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  fonts.fontconfig.enable = true;
}
