{...}: {
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    options = {
      number = true;
      relativenumber = true;
    };

    colorschemes.gruvbox.enable = true;

    plugins = {
      lualine.enable = true;

      lsp = {
        enable = true;

        servers = {
          nil_ls = {
            enable = true;
          };
        };
      };

      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
      };

      treesitter = {
        enable = true;
      };
    };
  };
}
