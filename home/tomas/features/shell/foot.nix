{
  lib,
  pkgs,
  ...
}: {
  programs.foot = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;
  };
}
