{
  programs.nixvim = {
    plugins = {
      luasnip = {
        enable = true;
      };

      cmp = {
        enable = true;

        autoEnableSources = true;

        settings = {
          experimental = {ghost_text = true;};

          completion.completeopt = "menu,menuone,noinsert,noselect";

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
            "<C-j>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
            "<C-k>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
            "<C-b>" = "cmp.mapping.scroll_docs(-1)";
            "<C-f>" = "cmp.mapping.scroll_docs(1)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "Esc" = "cmp.mapping.abort()";

            "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })";
          };

          formatting.format = ''
            function(entry, vim_item)
             vim_item.menu = entry.source.name
              return vim_item
            end
          '';
        };
      };
    };

    extraConfigLua = ''
          local luasnip = require("luasnip")
          local cmp = require("cmp")

          cmp.setup {
            mapping = cmp.mapping.preset.insert{
              ['<Tab>'] = cmp.mapping(function(fallback)
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),

              ['<S-Tab>'] = cmp.mapping(function(fallback)
                if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            }
          }

      vim.o.completeopt = "menu,menuone,noinsert,noselect"
    '';
  };
}
