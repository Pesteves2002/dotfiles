{lib, pkgs, ...}: {
  programs.direnv = lib.mkIf pkgs.stdenv.isLinux{
    enable = true;

    enableZshIntegration = true;

    config = {
      global = {
        disable_stdin = true;
        warn_timeout = "2m";
        hide_env_diff = true;
      };
    };

    nix-direnv.enable = true;
  };
}
