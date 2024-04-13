{...}: {
  imports = [
    ./commands.nix
    ./options.nix
    ./clipboard.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";

    plugins = {
      indent-blankline = {
        enable = true;
      };

      nvim-jdtls = {
        enable = true;
        data = "/home/tomas/.cache/jdtls/worksapce";
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  systemd.user.sessionVariables = {
    EDITOR = "nvim";
  };
}
