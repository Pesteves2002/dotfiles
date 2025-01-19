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
    bufferline.enable = true;

    # Undo tree
    undotree = {
      enable = true;
    };

    # Cursor line
    cursorline = {
      enable = true;
      cursorline = {
        number = true;
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
      settings.current_line_blame = true;
    };

    # Help with commands
    wilder = {
      enable = true;
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
  };
}
