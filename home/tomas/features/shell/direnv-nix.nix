{pkgs, ...}: {
  programs.direnv = {
    enable = true;

    package = pkgs.unstable.direnv;

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
