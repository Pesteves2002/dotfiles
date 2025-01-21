{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true;
      settings = {
        auto_install = true;
        indent.enable = true;
      };
      folding = true;
    };

    treesitter-context.enable = true;
  };
}
