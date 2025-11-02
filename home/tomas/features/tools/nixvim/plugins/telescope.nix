{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        "<leader>pf" = {
          action = "find_files";
        };
        "<C-g>" = {
          action = "git_files";
        };
        "<leader>ps" = {
          action = "live_grep";
        };
      };

      extensions = {
        ui-select.enable = true;
        fzf-native.enable = true;
      };
    };

    # Fix: https://github.com/nvim-treesitter/nvim-treesitter/issues/7952#issuecomment-2996499844
    extraConfigLua = ''
      local actions = require("telescope.actions")

      local open_after_tree = function(prompt_bufnr)
        vim.defer_fn(function()
          actions.select_default(prompt_bufnr)
        end, 100) -- Delay allows filetype and plugins to settle before opening
      end

      require("telescope").setup({
        defaults = {
          mappings = {
            i = { ["<CR>"] = open_after_tree },
            n = { ["<CR>"] = open_after_tree },
          },
        },
      })
    '';
  };
}
