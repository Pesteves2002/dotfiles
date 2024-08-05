{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "nix fmt && sudo nixos-rebuild switch --flake .#$(hostname -s)";
      ff = "firefox";
      idea = "idea-ultimate > /dev/null 2>&1 &";
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "web-search"];
      theme = "robbyrussell";
    };
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
      }
      {
        name = "zsh-completions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-completions";
          rev = "0.34.0";
          sha256 = "0jjgvzj3v31yibjmq50s80s3sqi4d91yin45pvn3fpnihcrinam9";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.0";
          sha256 = "0s1z3whzwli5452h2yzjzzj27pf1hd45g223yv0v6hgrip9f853r";
        };
      }
    ];
  };

  # eza (modern ls replacement)
  programs.eza.enable = true;

  # starship (shell theme)
  programs.starship.enable = true;

  # zoxide (jump to directories)
  programs.zoxide.enable = true;
  home.sessionVariables._ZO_ECHO = "1";

  programs.starship.settings = {
    scan_timeout = 1;
    add_newline = true;

    username.format = "[$user]($style) in ";
    hostname = {
      ssh_only = true;
      format = "[$hostname]($style) ";
    };
  };
}
