{pkgs, ...}: {
  imports = [
    ./lsp.nix
    ./copilot.nix
    ./telescope.nix
    ./harpoon.nix
    ./treesitter.nix
    ./cmp.nix
    ./lint.nix
    ./typst.nix
  ];

  programs.nixvim.plugins = {
    # Status bar on the bottom
    lualine.enable = true;

    # Add automatic pairs
    nvim-autopairs.enable = true;

    # Add open files at the top
    bufferline.enable = true;

    # Undo tree
    undotree = {
      enable = true;
    };

    # Cursor line
    cursorline = {
      enable = true;
      cursorline.number = true;
    };

    # Show errors on line
    trouble = {
      enable = true;
    };

    # Rainbow delimiters
    rainbow-delimiters = {
      enable = true;
    };

    # Easy commenting
    comment = {
      enable = true;
    };

    # Auto save
    auto-save = {
      enable = true;
      settings = {
        enable = true;
      };
    };

    # Built in git blame
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    # Help with commands
    wilder = {
      enable = true;
      modes = [":" "/" "?"];
    };

    # Help with commands completion
    which-key = {
      enable = true;
      settings = {
        show_keys = true;
      };
    };

    # RPC presence
    presence-nvim = {
      enable = true;
      editingText = "Martelating %s";
      workspaceText = "Breaking the code of %s";
    };

    texpresso = {
      enable = true;
    };

    web-devicons.enable = true;

    indent-blankline = {
      enable = true;
    };

    lastplace.enable = true;
  };

  programs.nixvim = {
    extraPlugins = with pkgs; [
      vimPlugins.ranger-nvim
    ];

    extraConfigLua = ''      require("ranger-nvim").setup({replace_netrw = true})
          vim.api.nvim_set_keymap("n", "<leader>pv", "", {
            noremap = true,
            callback = function()
              require("ranger-nvim").open(true)
            end,
          })
    '';
  };
}
