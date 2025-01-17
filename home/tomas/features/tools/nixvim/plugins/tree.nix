{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;

      # Disable netrw
      disableNetrw = true;
      hijackNetrw = true;

      # Keeps cursor at first letter of filename
      hijackCursor = true;

      # Open the tree when opening a new empty buffer
      hijackUnnamedBufferWhenOpening = true;

      # Open on Setup if buffer is empty or a directory
      openOnSetup = true;

      actions = {
        openFile = {
          quitOnOpen = true;
        };
      };

      # Enable diagnostics on preview
      diagnostics.enable = true;

      # Start centered
      view.centralizeSelection = true;
    };

    keymaps = [
      {
        # Toggle NvimTree
        mode = "n";
        key = "<C-n>";
        action = "<CMD>NvimTreeToggle<CR>";
      }

      {
        # Toggle NvimTree
        mode = "n";
        key = "<leader>pv";
        action = "<CMD>NvimTreeToggle<CR>";
      }
    ];
  };
}
