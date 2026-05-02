{
  lib,
  pkgs,
  ...
}: {
  programs.ghostty = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    installBatSyntax = true;
  };
}
