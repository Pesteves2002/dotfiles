{...}: {
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    autoCmd = [
      # save position in file (cursed thingies)
      {
        event = "BufReadPost";
        pattern = "*";
        callback = {__raw = "function() vim.api.nvim_exec('silent! normal! g`\"zv', false) end";};
      }
    ];

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

      undofile = true;
      undodir = "/tmp//";
    };

    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;

    colorschemes.one.enable = true;

    keymaps = [
      # invert search direction
      {
        mode = "n";
        key = "n";
        action = "'Nn'[v:searchforward]";
        options.expr = true;
      }
      {
        mode = "n";
        key = "N";
        action = "'nN'[v:searchforward]";
        options.expr = true;
      }
      # clear search highlight
      {
        mode = "n";
        key = "<Esc>";
        action = ":nohlsearch<CR>";
        options.silent = true;
      }

      # toggle wrap mode
      {
        mode = "n";
        key = "<Leader>w";
        action = ":set wrap!<CR>";
      }

      # move lines up and down

      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
      }

      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
      }

      # save methods
      {
        mode = "n";
        key = "<C-s>";
        action = ":w<CR>";
      }
      {
        mode = "i";
        key = "<C-s>";
        action = "<Esc>:w<CR>a";
      }
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

      presence-nvim = {
        enable = true;
        editingText = "Martelating %s";
        workspaceText = "Breaking the code of %s";
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
