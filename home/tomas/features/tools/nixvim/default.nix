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
    vimdiffAlias = true;

    globals.mapleader = " ";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  systemd.user.sessionVariables = {
    EDITOR = "nvim";
  };
}
