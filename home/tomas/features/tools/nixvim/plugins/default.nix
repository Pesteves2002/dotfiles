{
  imports = [
    ./lsp
    ./copilot.nix
    ./telescope.nix
    ./harpoon.nix
    ./treesitter.nix
    ./ufo.nix
    ./cmp.nix
    ./lint.nix
    ./tree.nix
    ./which-key.nix
    ./indent.nix
  ];

  programs.nixvim.plugins = {
    # Status bar on the bottom
    lualine.enable = true;

    # Add automatic pairs
    nvim-autopairs = {
      enable = true;
      settings = {
        check_ts = true;
      };
    };

    # Add open files at the top
    # bufferline.enable = true;

    # Undo tree
    undotree = {
      enable = true;
      settings = {
        splitWidth = 45;
      };
    };

    # Cursor line
    cursorline = {
      enable = true;
      settings = {
        cursorline = {
          number = true;
        };
      };
    };

    # Rainbow delimiters
    rainbow-delimiters = {
      enable = true;
    };

    # Easy commenting
    commentary.enable = true;

    # Auto save
    auto-save = {
      enable = true;
    };

    # Built in git blame
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        trouble = true;
      };
    };

    fugitive.enable = true;

    # Help with commands
    wilder = {
      enable = true;
      modes = [":" "/" "?"];
    };

    # RPC presence
    presence-nvim = {
      enable = true;
      editingText = "Martelating %s";
      workspaceText = "Breaking the code of %s";
      mainImage = "file";
      neovimImageText = "Powered by Nixvim";
    };

    lastplace.enable = true;

    trouble.enable = true;
  };
}
