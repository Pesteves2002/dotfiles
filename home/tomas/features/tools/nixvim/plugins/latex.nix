{pkgs, ...}: {
  programs.nixvim.plugins.lsp = {
    servers = {
      texlab = {
        enable = true;
      };
    };
  };

  home.packages = with pkgs; [
    tree-sitter
  ];
}
