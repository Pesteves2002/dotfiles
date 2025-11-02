{...}: {
  programs.nixvim.plugins = {
    luasnip.enable = true;
    cmp = {
      enable = true;

      autoEnableSources = true;

      settings = {
        experimental = {ghost_text = true;};

        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keyword_length = 3;
          }
          {name = "nvim_lua";}
          {name = "path";}
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
