{...}: {
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
      };

      clangd = {
        enable = true;
      };

      typst-lsp = {
        enable = true;
        settings = {
          # Avoid conflicts
          exportPdf = "never";
        };
      };
    };
  };
}
