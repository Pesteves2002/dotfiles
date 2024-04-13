{...}: {
  imports = [
    ./lsp.nix
    ./copilot.nix
    ./telescope.nix
    ./harpoon.nix
    ./treesitter.nix
    ./cmp.nix
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
    comment-nvim = {
      enable = true;
    };

    # Auto save
    auto-save = {
      enable = true;
      enableAutoSave = true;
    };

    # Built in git blame
    gitsigns = {
      enable = true;
      currentLineBlame = true;
    };

    # Help with commands
    wilder = {
      enable = true;
      modes = [":" "/" "?"];
    };

    # Help with commands completion
    which-key = {
      enable = true;
      showKeys = true;
    };

    # RPC presence
    presence-nvim = {
      enable = true;
      editingText = "Martelating %s";
      workspaceText = "Breaking the code of %s";
    };
  };
}
