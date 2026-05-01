{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim = {
    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy =
      lib.mkIf
      pkgs.stdenv.hostPlatform.isLinux {enable = true;};
  };
}
