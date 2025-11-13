{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        keymap = {
          "<C-l>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];

          "<CR>" = [
            "accept"
            "fallback"
          ];

          "<C-e>" = [
            "hide"
          ];

          "<Tab>" = [
            "snippet_forward"
            "fallback"
          ];

          "<S-Tab>" = [
            "snippet_backward"
            "fallback"
          ];

          "<C-k>" = [
            "select_prev"
            "fallback_to_mappings"
          ];

          "<C-j>" = [
            "select_next"
            "fallback_to_mappings"
          ];

          "<C-n>" = [
            "scroll_documentation_up"
            "fallback"
          ];

          "<C-m>" = [
            "scroll_documentation_down"
            "fallback"
          ];
        };

        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 0;

            window = {
              border = "rounded";
            };
          };

          list = {
            selection = {
              auto_insert = true;
              preselect = false; # only select with my confirmation
            };
          };

          menu = {
            border = "rounded";
          };
        };

        signature.enabled = true;

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"

            "spell"
            # "copilot"
          ];

          providers = {
            spell = {
              name = "Spell";
              module = "blink-cmp-spell";
              score_offset = -99;
            };

            copilot = {
              async = true;
              module = "blink-cmp-copilot";
              name = "copilot";
              score_offset = -100;
              # Optional configurations
              opts = {
                max_completions = 3;
                max_attempts = 4;
                kind = "Copilot";
                debounce = 750;
                auto_refresh = {
                  backward = true;
                  forward = true;
                };
              };
            };
          };
        };
      };
    };

    blink-cmp-spell.enable = true;
    blink-cmp-copilot.enable = true;
  };
}
