{
  imports = [
    ./clipboard.nix
    ./colorscheme.nix
    ./commands.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;
    enablePrintInit = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    globals.mapleader = " ";

    performance = {
      byteCompileLua = {
        enable = true;

        luaLib = true;
        nvimRuntime = true;
      };

      # combinePlugins = {
      #   enable = true;
      # };
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  systemd.user.sessionVariables = {
    EDITOR = "nvim";
  };
}
