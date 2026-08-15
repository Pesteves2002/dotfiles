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
    ./typescript.nix
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
          # was <c-p>: freed up for other use
          key = "[d";
          action = config.lib.nixvim.mkRaw ''
            function()
              vim.diagnostic.goto_prev({ wrap = false })
            end
          '';
        }

        {
          # was <c-m>: clashed with harpoon's select(4) and with <CR> (same keycode in terminal)
          key = "]d";
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

  # Format on save using whatever LSP client supports formatting for the buffer.
  # Wrapped in pcall so it's a silent no-op on filetypes with no formatting-capable client.
  programs.nixvim.autoCmd = [
    {
      event = ["BufWritePre"];
      pattern = ["*"];
      callback = config.lib.nixvim.mkRaw ''
        function()
          pcall(vim.lsp.buf.format, { async = false, timeout_ms = 2000 })
        end
      '';
    }
  ];
}
