{
  imports = [
    ./bash.nix
    ./clang.nix
    ./latex.nix
    ./matlab.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./typst.nix

    ./fidget.nix
  ];

  programs.nixvim.plugins.lsp = {
    enable = true;

    capabilities = ''
      general = {
        positionEncodings = { "utf-16" };
      }
    '';

    keymaps = {
      # silent = true;

      diagnostic = {
        "<C-p>" = "goto_prev";
        "<leader>e" = "open_float";
      };

      lspBuf = {
        gd = "definition";
        gD = "references";
        gt = "type_definition";
        gi = "implementation";
        K = "hover";
        rn = "rename";
      };
    };
  };
}
