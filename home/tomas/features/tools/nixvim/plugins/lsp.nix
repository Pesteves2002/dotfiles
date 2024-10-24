{pkgs, ...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;

    keymaps = {
      silent = true;

      diagnostic = {
        "<C-p>" = "goto_prev";
        "<C-ç>" = "goto_next";
        "<leader>e" = "open_float";
      };

      lspBuf = {
        gd = "definition";
        gr = "references";
        gt = "type_definition";
        gi = "implementation";
        K = "hover";
        rn = "rename";
      };
    };

    servers = {
      bashls = {
        enable = true;
      };

      nixd = {
        enable = true;

        settings = {
          formatting.command = ["alejandra"];
          nixpkgs.expr = "import <nixpkgs> { }";
        };
      };

      clangd = {
        enable = true;
        cmd = [
          "clangd"
          "--offset-encoding=utf-16"
        ];
      };

      typst-lsp = {
        enable = true;
        settings = {
          # Avoid conflicts
          exportPdf = "never";
          experimentalFormatterMode = "on";
        };
      };
    };
  };

  home.packages = with pkgs; [
    alejandra
  ];
}
