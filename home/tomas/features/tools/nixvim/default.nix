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
    };

    autoCmd = [
      # save position in file (cursed thingies)
      {
        event = "BufReadPost";
        pattern = "*";
        callback = {__raw = "function() vim.api.nvim_exec('silent! normal! g`\"zv', false) end";};
      }
    ];
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  systemd.user.sessionVariables = {
    EDITOR = "nvim";
  };
}
