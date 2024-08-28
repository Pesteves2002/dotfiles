{
  programs.nixvim.plugins.typst-vim = {
    enable = true;

    keymaps = {
      silent = true;
      watch = "<leader>t";
    };
  };
}
