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

    extraConfigLua = ''
      vim.cmd('cabbrev W w')
    '';

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
      {
        mode = "n";
        key = "<leader>pv";
        action = ":Ex<CR>";
      }

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

      {
        mode = "n";
        key = "<Leader>u";
        action = ":UndotreeToggle<CR>";
      }

      {
        mode = "n";
        key = "<Leader>gs";
        action = ":Git<CR>";
      }

      # replace word under cursor
      {
        mode = "n";
        key = "<Leader>s";
        action = ":%s/\\<<C-r><C-w>\\>/";
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

      # replace word under cursor
      {
        mode = "n";
        key = "<Leader>s";
        action = ":%s/\\<<C-r><C-w>\\>/";
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

        keymaps = {
          silent = true;
          diagnostic = {
            "<C-p>" = "goto_prev";
            "<C-n>" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gr = "references";
            K = "hover";
            rn = "rename";
          };
        };

        servers = {
          nil_ls = {
            enable = true;
          };

          clangd = {
            enable = true;
          };
        };
      };

      clangd-extensions = {
        enable = true;
        enableOffsetEncodingWorkaround = true;
      };

      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
          {name = "luasnip";}
          {name = "treesitter";}
        ];
      };

      cmp-nvim-lsp = {
        enable = true;
      };

      cmp-path = {
        enable = true;
      };

      cmp-buffer = {
        enable = true;
      };

      cmp_luasnip = {
        enable = true;
      };

      cmp-treesitter = {
        enable = true;
      };

      treesitter = {
        enable = true;
        nixvimInjections = true;
      };

      telescope = {
        enable = true;

        keymaps = {
          "<leader>pf" = {
            action = "find_files";
          };
          "<C-g>" = {
            action = "git_files";
          };
          "<leader>ps" = {
            action = "live_grep";
          };
        };
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

      illuminate = {
        enable = true;
      };

      harpoon = {
        enable = true;
        enableTelescope = true;
        keymaps = {
          addFile = "<leader>a";
          toggleQuickMenu = "<C-e>";
          navFile = {
            "1" = "<C-h>";
            "2" = "<C-j>";
            "3" = "<C-k>";
            "4" = "<C-l>";
          };
        };
      };

      undotree = {
        enable = true;
      };

      fugitive = {
        enable = true;
      };

      cursorline = {
        enable = true;
      };

      trouble = {
        enable = true;
      };

      indent-blankline = {
        enable = true;
      };

      rainbow-delimiters = {
        enable = true;
      };

      comment-nvim = {
        enable = true;
      };

      # TODO: enable this when it's available
      # autoclose = {
      #   enable = true;
      # };

      luasnip = {
        enable = true;
      };

      gitsigns = {
        enable = true;
      };

      nvim-jdtls = {
        enable = true;
        data = "/home/tomas/.cache/nvim/jdtls";
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
