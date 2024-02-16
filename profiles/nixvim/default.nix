{...}: {
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";

    options = {
      number = true;
      relativenumber = true;

      list = true;
      listchars = {
        tab = ">-";
        trail = "~";
        extends = ">";
        precedes = "<";
      };

      mouse = "a";

      wrap = false;

      scrolloff = 12;

      splitbelow = true;
      splitright = true;

      ignorecase = true;
      smartcase = true;

      spell = true;
      spelllang = ["en" "pt"];
    };

    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;

    colorschemes.one.enable = true;

    keymaps = [
    ];

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

      telescope = {
        enable = true;
      };

      copilot-vim = {
        enable = true;

        filetypes = {
          "*" = true;
        };
      };

      surround = {
        enable = true;
      };

      gitblame = {
        enable = true;
      };
    };
  };
}
