{
  programs.nixvim.plugins = {
    lsp.servers = {
      roslyn_ls.enable = true;
    };
  };
}
