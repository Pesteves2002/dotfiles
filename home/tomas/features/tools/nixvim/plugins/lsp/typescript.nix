{
  programs.nixvim.plugins.lsp.servers = {
    vtsls = {
      enable = true;
    };

    stylelint_lsp = {
      enable = true;
    };

    eslint = {
      enable = true;
    };

    oxlint = {
      enable = true;
    };

    graphql = {
      enable = true;
    };
  };
}
