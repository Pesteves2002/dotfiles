{
  imports = [
    ./lsp.nix
    ./copilot.nix
    ./telescope.nix
    ./harpoon.nix
    ./treesitter.nix
    ./cmp.nix
    ./lint.nix
    ./typst.nix
    ./tree.nix
    ./which-key.nix
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

    # RPC presence
    presence-nvim = {
      enable = true;
      editingText = "Martelating %s";
      workspaceText = "Breaking the code of %s";
    };

    texpresso = {
      enable = true;
    };

    indent-blankline = {
      enable = true;
    };

    lastplace.enable = true;
  };
}
