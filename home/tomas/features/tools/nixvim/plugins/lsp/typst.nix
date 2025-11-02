{
  programs.nixvim.plugins.lsp.servers.tinymist = {
    enable = true;
    settings = {
      exportPdf = "auto";
      formatterMode = "typstyle";
    };
  };
}
