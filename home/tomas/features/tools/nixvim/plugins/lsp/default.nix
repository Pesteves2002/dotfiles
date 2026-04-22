{config, ...}: {
  imports = [
    ./bash.nix
    ./clang.nix
    ./fidget.nix
    ./latex.nix
    ./matlab.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./typst.nix
    ./yaml.nix
  ];

  programs.nixvim.plugins.lsp = {
    enable = true;

    inlayHints = true;

    # capabilities = ''
    #   general = {
    #     positionEncodings = { "utf-16" };
    #   }
    # '';

    keymaps = {
      diagnostic = {
        "<leader>e" = "open_float";
      };
      # silent = true;

      lspBuf = {
        gd = "definition";
        gD = "references";
        gt = "type_definition";
        gi = "implementation";
        K = "hover";
        rn = "rename";
      };

      extra = [
        {
          key = "<leader>fm";
          action = config.lib.nixvim.mkRaw ''
            function()
              vim.lsp.buf.format()
            end
          '';
        }

        {
          key = "<c-p>";
          action = config.lib.nixvim.mkRaw ''
            function()
              vim.diagnostic.goto_prev({ wrap = false })
            end
          '';
        }

        {
          key = "<c-m>";
          action = config.lib.nixvim.mkRaw ''
            function()
              vim.diagnostic.goto_next({ wrap = false })
            end
          '';
        }

        {
          key = "<leader>a";
          action = config.lib.nixvim.mkRaw ''
            function()
              vim.lsp.buf.code_action()
            end
          '';
        }
      ];
    };
  };
}
