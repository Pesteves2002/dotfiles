{pkgs, ...}: {
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      package = pkgs.unstable.vimPlugins.nvim-tree-lua;

      openOnSetup = true;
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
