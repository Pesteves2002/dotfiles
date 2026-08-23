{
  programs.nixvim = {
    plugins.telescope = {
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
        "<leader>pb" = {
          action = "buffers";
        };
      };

      settings = {
        defaults = {
          path_display = ["truncate"];
        };
      };

      extensions = {
        ui-select.enable = true;
        fzf-native.enable = true;
      };
    };
  };
}
