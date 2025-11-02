{
  programs.nixvim.plugins.lsp.servers.clangd = {
    enable = true;
    cmd = [
      "clangd"
      "--offset-encoding=utf-16"
    ];
  };
}
