{...}: {
  programs.nixvim.plugins = {
    cmp-buffer = {
      enable = true;
    };

    cmp_luasnip = {
      enable = true;
    };

    luasnip.enable = true;

    cmp-nvim-lsp = {
      enable = true;
    };

    cmp-path = {
      enable = true;
    };

    copilot-cmp = {
      enable = true;
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        sources = [
          {name = "nvim_lsp";}
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          {name = "luasnip";}
          {name = "path";}
          {name = "nvim_lua";}
          {name = "copilot";}
        ];

        mapping = {
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-1)";
          "<C-f>" = "cmp.mapping.scroll_docs(1)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })";
        };
      };
    };
  };
}
