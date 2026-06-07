{
  lib,
  pkgs,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        update = "nix fmt * -- -q && sudo nixos-rebuild switch --flake .#$(hostname -s)";
        ff = "firefox";
        idea = "idea-ultimate > /dev/null 2>&1 &";
        vi = "nvim";
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
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];

      initContent = lib.optionalString pkgs.stdenv.hostPlatform.isDarwin ''
        source "$HOME/.sdkman/bin/sdkman-init.sh"
        export PATH="$HOME/.local/bin:$PATH"
      '';
    };

    # eza (modern ls replacement)
    eza.enable = true;

    # zoxide (jump to directories)
    zoxide.enable = true;

    # starship (shell theme)
    starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = true;
        scan_timeout = 10;

        username.format = "[$user]($style) in ";
        hostname = {
          ssh_only = true;
          format = "[$hostname]($style) ";
        };
      };
    };
  };

  home.sessionVariables._ZO_ECHO = "1";
}
