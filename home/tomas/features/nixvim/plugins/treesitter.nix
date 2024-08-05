{...}: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true;
      indent = true;
      folding = true;
    };

    treesitter-context.enable = true;
  };
}
