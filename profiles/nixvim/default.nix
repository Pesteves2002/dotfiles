{...}: {
  imports = [
    ./commands.nix
    ./options.nix
    ./clipboard.nix
    ./colorscheme.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";

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
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            rn = "rename";
          };
        };

        servers = {
          bashls = {
            enable = true;
          };

          nixd = {
            enable = true;
          };

          clangd = {
            enable = true;
          };
        };
      };

      nvim-tree = {
        enable = true;
        openOnSetupFile = true;
        autoReloadOnWrite = true;
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

      cmp-emoji = {
        enable = true;
      }; cmp-path = { enable = true;
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

      which-key = {
        enable = true;
        showKeys = true;
      };

      treesitter = {
        enable = true;
        nixvimInjections = true;
        nixGrammars = true;
        indent = true;
      };

      treesitter-context.enable = true;

      nvim-autopairs = {
        enable = true;
      };

      auto-save = {
        enable = true;
        enableAutoSave = true;
      };

      bufferline = {
        enable = true;
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

      wilder = {
        enable = true;
        modes = [":" "/" "?"];
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
        currentLineBlame = true;
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
